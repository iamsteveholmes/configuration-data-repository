class RequestTypeController {
    def scaffold = RequestType
    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')

        // Alternatively, several actions can be specified.
        role(name: 'Administrator', only: ['create', 'edit', 'save', 'update'])
    }
    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [requestTypeList: RequestType.findAllByType('Change Request', params)]
    }

    def show = {
        [requestType: RequestType.get(params.id)]
    }

    def delete = {
        def requestType = RequestType.get(params.id)
        if (requestType) {
            try {
                requestType.delete(flush: true)
                flash.message = "Request Type ${params.id} deleted."
                redirect(action: list)
            } catch (org.hibernate.exception.ConstraintViolationException e) {
                flash.message = "Unable to Delete Request Type ${params.id}.  Types used by Configuration Items cannot be deleted."
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "Request Type not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def requestType = RequestType.get(params.id)

        if (!requestType) {
            flash.message = "Request Type not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [requestType: requestType]
        }
    }

    def update = {
        def requestType = RequestType.get(params.id)
        if (requestType) {
            if (Long.valueOf(requestType.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: requestType.id)
            } else {
                requestType.properties = params
                if (requestType.save()) {
                    flash.message = "Request Type ${params.id} updated."
                    redirect(action: show, id: requestType.id)
                }
                else {
                    render(view: 'edit', model: [requestType: requestType])
                }
            }
        }
        else {
            flash.message = "Request Type not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def requestType = new RequestType()
        requestType.properties = params
        return ['requestType': requestType]
    }

    def save = {
        def requestType = new RequestType()
        requestType.properties = params
        if (requestType.save()) {
            flash.message = "Request Type ${requestType.id} created."
            redirect(action: show, id: requestType.id)
        }
        else {
            render(view: 'create', model: [requestType: requestType])
        }
    }

}