class ChangeRequestController {

    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }


    def index = {
        if (params["_action_Save"]) {
            save()
        }
        else if (params["_action_Update"]) {
            update()
        }
        else if (params["_action_Delete"]) {
            delete()
        }
        else {
            redirect(action: list, params: params)
        }
    }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [changeRequestList: ChangeRequest.list(params)]
    }

    def show = {
        [changeRequest: ChangeRequest.get(params.id)]
    }

    def delete = {
        def changeRequest = ChangeRequest.get(params.id)
        if (changeRequest) {
            changeRequest.delete()
            flash.message = "ChangeRequest ${params.id} deleted"
            redirect(action: list)
        }
        else {
            flash.message = "ChangeRequest not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def changeRequest = ChangeRequest.get(params.id)

        if (!changeRequest) {
            flash.message = "ChangeRequest not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [changeRequest: changeRequest]
        }
    }

    def update = {
        def changeRequest = ChangeRequest.get(params.id)
        if (changeRequest) {
            log.debug "changeRequest.version: ${changeRequest.version}"
            log.debug "params.version: ${params.version}"
            def circular = false
            if (Long.valueOf(changeRequest.version) != Long.valueOf(params.version)) {
                    flash.message = "This record has been modified since you last saw it.  Please try updating again."
                    redirect(action: show, id: changeRequest.id)
            } else {

                if (params.get('parent.id') != 'null') {
                    def parent = ChangeRequest.get(Long.parseLong(params.get('parent.id')))
                    log.debug "parent: ${parent}"
                    changeRequest.configurationItems.each {child ->
                        log.debug "child: ${child}"
                        if (child.id == parent.id) {
                            circular = true
                        }
                    }
                }
            }

            if (circular) {
                flash.message = "Cannot choose a child as a parent."
                render(view: 'edit', model: [changeRequest: changeRequest])
            } else {
                def upload = request.getFile('document')
                changeRequest.document = upload.getBytes()
                changeRequest.fileType = upload.getContentType()
                changeRequest.fileName = upload.getOriginalFilename()
                changeRequest.properties = params
                if (!changeRequest.hasErrors() && changeRequest.save()) {
                    if(!changeRequest.fileName) flash.message = "Change Request ${params.id} updated.  No document was saved.  This may be due to a bad Path."
                    else flash.message = "ChangeRequest ${params.id} updated"
                    redirect(action: show, id: changeRequest.id)
                }
                else {
                    render(view: 'edit', model: [changeRequest: changeRequest])
                }
            }
        }
        else {
            flash.message = "ChangeRequest not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def changeRequest = new ChangeRequest()
        changeRequest.properties = params
        return ['changeRequest': changeRequest]
    }

    def save = {
        def changeRequest = new ChangeRequest(params)
        def upload = request.getFile('document')
        changeRequest.document = upload.getBytes()
        changeRequest.fileType = upload.getContentType()
        changeRequest.fileName = upload.getOriginalFilename()
        changeRequest.fileSize = upload.getSize()
        if (!changeRequest.hasErrors() && changeRequest.save()) {
            if(!changeRequest.fileName) flash.message = "Change Request ${changeRequest.id} created.  No document was saved.  This may be due to a bad Path."
            else flash.message = "ChangeRequest ${changeRequest.id} created"
            redirect(action: show, id: changeRequest.id)
        }
        else {
            render(view: 'create', model: [changeRequest: changeRequest])
        }
    }

    def downloadDocument = {
        def changeRequest = ChangeRequest.get(params.id)
        assert changeRequest.fileName
        assert changeRequest.fileSize
        assert changeRequest.document
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment;filename = \"${changeRequest.fileName}\"")
        response.setHeader("Content-Length", "${changeRequest.fileSize}")
        response.outputStream << changeRequest.document
    }
}
