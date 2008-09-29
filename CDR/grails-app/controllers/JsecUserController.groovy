
class JsecUserController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ jsecUserList: JsecUser.list( params ) ]
    }

    def show = {
        [ jsecUser : JsecUser.get( params.id ) ]
    }

    def delete = {
        def jsecUser = JsecUser.get( params.id )
        String name = new String(jsecUser.username)
        if(jsecUser) {
            jsecUser.delete()
            flash.message = "${name} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def jsecUser = JsecUser.get(params.id)

        if(!jsecUser) {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ jsecUser : jsecUser ]
        }
    }

    def update = {
        def jsecUser = JsecUser.get(params.id)
        jsecUser.passwordHash = new org.jsecurity.crypto.hash.Sha1Hash(params.passwordHash).toHex()
        //jsecUser.passwordHash = DigestUtils.shaHex(params.passwordHash)
        params.passwordHash = jsecUser.passwordHash
        if(jsecUser) {
            jsecUser.properties = params
            if(!jsecUser.hasErrors() && jsecUser.save()) {
                flash.message = "${jsecUser.username} updated"
                redirect(action:show,id:jsecUser.id)
            }
            else {
                render(view:'edit',model:[jsecUser:jsecUser])
            }
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def jsecUser = new JsecUser()
        jsecUser.properties = params
        return ['jsecUser':jsecUser]
    }

    def save = {
        def jsecUser = new JsecUser(params)
        //jsecUser.passwordHash = DigestUtils.shaHex(params.passwordHash)
        jsecUser.passwordHash = new org.jsecurity.crypto.hash.Sha1Hash(params.passwordHash).toHex()
        if(!jsecUser.hasErrors() && jsecUser.save()) {
            flash.message = "User ${jsecUser.username} created"
            redirect(action:show,id:jsecUser.id)
        }
        else {
            render(view:'create',model:[jsecUser:jsecUser])
        }
    }
}
