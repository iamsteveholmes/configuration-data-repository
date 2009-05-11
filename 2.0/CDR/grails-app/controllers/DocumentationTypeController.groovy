class DocumentationTypeController{
    /*def scaffold = DocumentationType*/

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
        [ documentationTypeList: DocumentationType.findAllByType('Documentation', params) ]
    }

    def show = {
        [ documentationType : DocumentationType.get( params.id ) ]
    }

    def delete = {
        def documentationType = DocumentationType.get(params.id)
        if(documentationType) {
            try {
                documentationType.delete(flush:true)
                flash.message = "Documentation Type ${params.id} deleted."
                redirect(action:list)
            } catch (org.hibernate.exception.ConstraintViolationException e) {
                flash.message = "Unable to Delete Documentation Type ${params.id}.  Types used by Configuration Items cannot be deleted."
                redirect(action:show, id:params.id)
            }
        }
        else {
            flash.message = "Documentation Type not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def documentationType = DocumentationType.get( params.id )

        if(!documentationType) {
                flash.message = "DocumentationType not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ documentationType : documentationType ]
        }
    }

    def update = {
        def documentationType = DocumentationType.get( params.id )
        if(documentationType) {
             documentationType.properties = params
            if(documentationType.save()) {
                flash.message = "Documentation Type ${params.id} updated."
                redirect(action:show,id:documentationType.id)
            }
            else {
                render(view:'edit',model:[documentationType:documentationType])
            }
        }
        else {
            flash.message = "Documentation Type not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
      def documentationType = new DocumentationType()
      documentationType.properties = params
      return ['documentationType':documentationType]
    }

    def save = {
        def documentationType = new DocumentationType()
        documentationType.properties = params
        if(documentationType.save()) {
            flash.message = "Documentation Type ${documentationType.id} created."
            redirect(action:show,id:documentationType.id)
        }
        else {
            render(view:'create',model:[documentationType:documentationType])
        }
    }

}