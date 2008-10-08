import grails.converters.XML

class StatusReferenceController {

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
        [statusReferenceList: StatusReference.list(params)]
    }

    def show = {
        [statusReference: StatusReference.get(params.id)]
    }

    def delete = {
        def statusReference = StatusReference.get(params.id)
        if (statusReference) {
            try {
                statusReference.delete(flush: true)
                flash.message = "Status Reference ${params.id} deleted"
                redirect(action: list)
            } catch (org.hibernate.exception.ConstraintViolationException e) {
                flash.message = "Unable to Delete Status Reference ${params.id}.  References used by Statuses cannot be deleted."
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "Status Reference not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def statusReference = StatusReference.get(params.id)

        if (!statusReference) {
            flash.message = "Status Reference not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [statusReference: statusReference]
        }
    }

    def update = {
        def statusReference = StatusReference.get(params.id)
        if (statusReference) {
            if (Long.valueOf(statusReference.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: statusReference.id)
            } else {
                statusReference.properties = params
                if (!statusReference.hasErrors() && statusReference.save()) {
                    flash.message = "Status Reference ${params.id} updated"
                    redirect(action: show, id: statusReference.id)
                }
                else {
                    render(view: 'edit', model: [statusReference: statusReference])
                }
            }
        }
        else {
            flash.message = "Status Reference not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def statusReference = new StatusReference()
        statusReference.properties = params
        return ['statusReference': statusReference]
    }

    def save = {
        def statusReference = new StatusReference(params)
        if (!statusReference.hasErrors() && statusReference.save()) {
            flash.message = "Status Reference ${statusReference.id} created"
            redirect(action: show, id: statusReference.id)
        }
        else {
            render(view: 'create', model: [statusReference: statusReference])
        }
    }

    def referenceList = {
        def reference = new StatusReference(params)
        render StatusReference.findAll(reference) as XML
    }
}