class NetworkController {
    /*def scaffold = Network*/
    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }
    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [networkList: Network.list(params)]
    }

    def show = {
        [network: Network.get(params.id)]
    }

    def delete = {
        def network = Network.get(params.id)
        if (network) {
            network.delete()
            flash.message = "Network ${params.id} deleted."
            redirect(action: list)
        }
        else {
            flash.message = "Network not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def network = Network.get(params.id)

        if (!network) {
            flash.message = "Network not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [network: network]
        }
    }

    def update = {
        def network = Network.get(params.id)
        if (network) {
            def circular = false
            if (params.get('parent.id') != 'null') {
                def parent = Network.get(Long.parseLong(params.get('parent.id')))
                println "parent: ${parent}"
                network.configurationItems.each {child ->
                    println "child: ${child}"
                    if (child.id == parent.id) {
                        circular = true
                    }
                }
            }

            if (circular) {
                flash.message = "Cannot choose a child as a parent."
                render(view: 'edit', model: [network: network])
            } else {
                network.properties = params
                if (network.save()) {
                    flash.message = "Network ${params.id} updated."
                    redirect(action: show, id: network.id)
                }
                else {
                    render(view: 'edit', model: [network: network])
                }
            }
        }
        else {
            flash.message = "Network not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def network = new Network()
        network.properties = params
        return ['network': network]
    }

    def save = {
        def network = new Network()
        network.properties = params
        if (network.save()) {
            flash.message = "Network ${network.id} created."
            redirect(action: show, id: network.id)
        }
        else {
            render(view: 'create', model: [network: network])
        }
    }

}