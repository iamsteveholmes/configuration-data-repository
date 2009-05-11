            
class StatusController{
    StatusService statusService

    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ statusList: Status.list( params ) ]
    }

    def show = {
        [ status : Status.get( params.id ) ]
    }

    def delete = {
        def status = Status.get( params.id )
        if(status) {
            status.delete()
            flash.message = "Status ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Status not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def status = Status.get( params.id )

        if(!status) {
            flash.message = "Status not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ status : status ]
        }
    }

    def update = {
        def status = Status.get( params.id )
        if(status) {
            status.properties = params
            if(!status.hasErrors() && status.save()) {
                flash.message = "Status ${params.id} updated"
                redirect(action:show,id:status.id)
            }
            else {
                render(view:'edit',model:[status:status])
            }
        }
        else {
            flash.message = "Status not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def status = new Status()
        status.properties = params
        return ['status':status]
    }

    def save = {
        def status = new Status(params)
        if(!status.hasErrors() && statusService.createStatus(status)) {
            flash.message = "Status ${status.id} created"
            redirect(action:show,id:status.id)
        }
        else {
            render(view:'create',model:[status:status])
        }
    }
}