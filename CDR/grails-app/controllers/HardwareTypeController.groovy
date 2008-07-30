class HardwareTypeController{
    /*def scaffold = HardwareType*/
    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')

        // Alternatively, several actions can be specified.
        role(name: 'Administrator', only: [ 'create', 'edit', 'save', 'update' ])
    }
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ hardwareTypeList: HardwareType.findAllByType('Hardware', params) ]
    }

    def show = {
        [ hardwareType : HardwareType.get( params.id ) ]
    }

    def delete = {
        def hardwareType = HardwareType.get( params.id )
        if(hardwareType) {
            try {
                hardwareType.delete(flush:true)
                flash.message = "Hardware Type ${params.id} deleted."
                redirect(action:list)
            } catch (org.hibernate.exception.ConstraintViolationException e) {
                flash.message = "Unable to Delete Hardware Type ${params.id}.  Types used by Configuration Items cannot be deleted."
                redirect(action:show, id:params.id)
            }

        }
        else {
            flash.message = "Hardware Type not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def hardwareType = HardwareType.get( params.id )

        if(!hardwareType) {
                flash.message = "Hardware Type not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ hardwareType : hardwareType ]
        }
    }

    def update = {
        def hardwareType = HardwareType.get( params.id )
        if(hardwareType) {
             hardwareType.properties = params
            if(hardwareType.save()) {
                flash.message = "Hardware Type ${params.id} updated."
                redirect(action:show,id:hardwareType.id)
            }
            else {
                render(view:'edit',model:[hardwareType:hardwareType])
            }
        }
        else {
            flash.message = "Hardware Type not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
      def hardwareType = new HardwareType()
      hardwareType.properties = params
      return ['hardwareType':hardwareType]
    }

    def save = {
        def hardwareType = new HardwareType()
        hardwareType.properties = params
        if(hardwareType.save()) {
            flash.message = "Hardware Type ${hardwareType.id} created."
            redirect(action:show,id:hardwareType.id)
        }
        else {
            render(view:'create',model:[hardwareType:hardwareType])
        }
    }

}