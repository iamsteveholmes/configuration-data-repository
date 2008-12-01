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
        def c = Network.createCriteria()
        def networkList = c.listDistinct {
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
            maxResults(params?.max)
            firstResult(params?.offset ? params?.offset : 0)
        }

        def count = Network.createCriteria().listDistinct {
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
        [networkList: networkList, environmentId: params.environmentId, active: params.active, count: count]
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
            if (Long.valueOf(network.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: network.id)
            } else {
                def circular = false
                if (params.get('parent.id') != 'null') {
                    def parent = Network.get(Long.parseLong(params.get('parent.id')))
                    log.debug "parent: ${parent}"
                    network.configurationItems.each {child ->
                        log.debug "child: ${child}"
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