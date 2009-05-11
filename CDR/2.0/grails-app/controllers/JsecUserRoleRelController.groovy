            
class JsecUserRoleRelController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ jsecUserRoleRelList: JsecUserRoleRel.list( params ) ]
    }

    def show = {
        [ jsecUserRoleRel : JsecUserRoleRel.get( params.id ) ]
    }

    def delete = {
        def jsecUserRoleRel = JsecUserRoleRel.get( params.id )
        String user = jsecUserRoleRel.user?.username
        String name = new String(jsecUserRoleRel.role.name)
        if(jsecUserRoleRel) {
            jsecUserRoleRel.delete()
            flash.message = "Role ${name} deleted for User ${user}"
            redirect(action:list)
        }
        else {
            flash.message = "Role not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def jsecUserRoleRel = JsecUserRoleRel.get( params.id )

        if(!jsecUserRoleRel) {
            flash.message = "Role not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ jsecUserRoleRel : jsecUserRoleRel ]
        }
    }

    def update = {
        def jsecUserRoleRel = JsecUserRoleRel.get( params.id )
        if(jsecUserRoleRel) {
            jsecUserRoleRel.properties = params
            if(!jsecUserRoleRel.hasErrors() && jsecUserRoleRel.save()) {
                flash.message = "Role ${jsecUserRoleRel.role?.name} updated for User ${jsecUserRoleRel.user?.username}"
                redirect(action:show,id:jsecUserRoleRel.id)
            }
            else {
                render(view:'edit',model:[jsecUserRoleRel:jsecUserRoleRel])
            }
        }
        else {
            flash.message = "Role not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def jsecUserRoleRel = new JsecUserRoleRel()
        jsecUserRoleRel.properties = params
        return ['jsecUserRoleRel':jsecUserRoleRel]
    }

    def save = {
        def jsecUserRoleRel = new JsecUserRoleRel(params)
        if(!jsecUserRoleRel.hasErrors() && jsecUserRoleRel.save()) {
            flash.message = "Role ${jsecUserRoleRel.role?.name} created for User ${jsecUserRoleRel.user?.username}"
            redirect(action:show,id:jsecUserRoleRel.id)
        }
        else {
            render(view:'create',model:[jsecUserRoleRel:jsecUserRoleRel])
        }
    }
}