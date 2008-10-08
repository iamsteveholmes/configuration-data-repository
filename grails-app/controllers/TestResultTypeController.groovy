class TestResultTypeController {
    def scaffold = TestResultType
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
        [testResultTypeList: TestResultType.findAllByType('Test Result', params)]
    }

    def show = {
        [testResultType: TestResultType.get(params.id)]
    }

    def delete = {
        def testResultType = TestResultType.get(params.id)
        if (testResultType) {
            try {
                testResultType.delete(flush: true)
                flash.message = "Test Result Type ${params.id} deleted."
                redirect(action: list)
            } catch (org.hibernate.exception.ConstraintViolationException e) {
                flash.message = "Unable to Delete Test Result Type ${params.id}.  Types used by Configuration Items cannot be deleted."
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "TestResultType not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def testResultType = TestResultType.get(params.id)

        if (!testResultType) {
            flash.message = "Test Result Type not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [testResultType: testResultType]
        }
    }

    def update = {
        def testResultType = TestResultType.get(params.id)
        if (testResultType) {
            if (Long.valueOf(testResultType.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: testResultType.id)
            } else {
                testResultType.properties = params
                if (testResultType.save()) {
                    flash.message = "Test Result Type ${params.id} updated."
                    redirect(action: show, id: testResultType.id)
                }
                else {
                    render(view: 'edit', model: [testResultType: testResultType])
                }
            }
        }
        else {
            flash.message = "Test Result Type not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def testResultType = new TestResultType()
        testResultType.properties = params
        return ['testResultType': testResultType]
    }

    def save = {
        def testResultType = new TestResultType()
        testResultType.properties = params
        if (testResultType.save()) {
            flash.message = "Test Result Type ${testResultType.id} created."
            redirect(action: show, id: testResultType.id)
        }
        else {
            render(view: 'create', model: [testResultType: testResultType])
        }
    }
}