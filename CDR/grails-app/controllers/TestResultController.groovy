class TestResultController {
    /*def scaffold = TestResult*/
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
        def c = TestResult.createCriteria()
        def testResultList = c.listDistinct {
            environments {
                if (params.environmentId) {
                    eq('id', new Long(params.environmentId))
                }
            }

            statuses {
                if (params.active) {
                    gt('endDate', new Date())
                    reference {
                        eq('name', 'Active')
                    }
                }
            }
            maxResults(params?.max ? (params.max instanceof String ? Integer.parseInt(params.max) : params.max) : null)
            firstResult(params?.offset ? (params.offset instanceof String ? Integer.parseInt(params.offset) : params.offset) : 0)
        }

        def count = TestResult.createCriteria().listDistinct {
            environments {
                if (params.environmentId) {
                    eq('id', new Long(params.environmentId))
                }
            }

            statuses {
                if (params.active) {
                    gt('endDate', new Date())
                    reference {
                        eq('name', 'Active')
                    }
                }
            }
        }.size
        [testResultList: testResultList, environmentId: params.environmentId, active: params.active, count: count]
    }

    def show = {
        [testResult: TestResult.get(params.id)]
    }

    def delete = {
        def testResult = TestResult.get(params.id)
        if (testResult) {
            testResult.delete()
            flash.message = "TestResult ${params.id} deleted."
            redirect(action: list)
        }
        else {
            flash.message = "TestResult not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def testResult = TestResult.get(params.id)

        if (!testResult) {
            flash.message = "TestResult not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [testResult: testResult]
        }
    }

    def update = {
        def testResult = TestResult.get(params.id)
        if (testResult) {
            if (Long.valueOf(testResult.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: testResult.id)
            } else {
                def circular = false
                if (params.get('parent.id') != 'null') {
                    def parent = TestResult.get(Long.parseLong(params.get('parent.id')))
                    log.debug "parent: ${parent}"
                    testResult.configurationItems.each {child ->
                        log.debug "child: ${child}"
                        if (child.id == parent.id) {
                            circular = true
                        }
                    }
                }

                if (circular) {
                    flash.message = "Cannot choose a child as a parent."
                    render(view: 'edit', model: [testResult: testResult])
                } else {
                    def upload = request.getFile('document')
                    testResult.document = upload.getBytes()
                    testResult.fileType = upload.getContentType()
                    testResult.fileName = upload.getOriginalFilename()
                    testResult.properties = params
                    if (testResult.save()) {
                        if (!testResult.fileName) flash.message = "Test Result ${params.id} updated.  No document was saved.  This may be due to a bad Path."
                        else flash.message = "TestResult ${params.id} updated."
                        redirect(action: show, id: testResult.id)
                    }
                    else {
                        render(view: 'edit', model: [testResult: testResult])
                    }
                }
            }
        }
        else {
            flash.message = "TestResult not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def testResult = new TestResult()
        testResult.properties = params
        return ['testResult': testResult]
    }

    def save = {
        def testResult = new TestResult()
        testResult.properties = params
        def upload = request.getFile('document')
        testResult.document = upload.getBytes()
        testResult.fileType = upload.getContentType()
        testResult.fileName = upload.getOriginalFilename()
        testResult.fileSize = upload.getSize()
        if (testResult.save()) {
            if (!testResult.fileName) flash.message = "Test Result ${testResult.id} created.  No document was saved.  This may be due to a bad Path."
            else flash.message = "TestResult ${testResult.id} created."
            redirect(action: show, id: testResult.id)
        }
        else {
            render(view: 'create', model: [testResult: testResult])
        }
    }

    def downloadDocument = {
        def testResult = TestResult.get(params.id)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment;filename = \"${testResult.fileName}\"")
        response.setHeader("Content-Length", "${testResult.fileSize}")
        response.outputStream << testResult.document
    }
}