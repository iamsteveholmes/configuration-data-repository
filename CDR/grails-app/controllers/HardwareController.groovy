import grails.converters.*

class HardwareController {
    /*def scaffold = Hardware*/
    /*static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }*/
    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [hardwareList: Hardware.list(params)]
    }

    def show = {
        def hardware = Hardware.get(params.id)
        [hardware: hardware]
    }

    def delete = {
        Hardware hardware = Hardware.get(params.id)
        if (hardware) {
            def name = hardware.name
            hardware.environments.each {environment ->
                environment.removeFromConfigurationItems(hardware).save()
            }

            hardware.delete()

            flash.message = "Hardware ${name} deleted."
            redirect(action: list)
        }
        else {
            flash.message = "Hardware not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def hardware = Hardware.get(params.id)

        if (!hardware) {
            flash.message = "Hardware not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [hardware: hardware]
        }
    }

    def update = {
        def hardware = Hardware.get(params.id)

        def circular = false
        if (params.get('parent.id') != 'null') {
            def parent = Hardware.get(Long.parseLong(params.get('parent.id')))
            println "parent: ${parent}"
            hardware.configurationItems.each {child ->
                println "child: ${child}"
                println "child.id == parent.id: ${child.id == parent.id}"
                if (child.id == parent.id) {
                    circular = true
                }
            }
        }

        if (circular) {
            println "in circular"
            flash.message = "Cannot choose a child as a parent."
            render(view: 'edit', model: [hardware: hardware])
            println "after render"
        } else {
            hardware.properties = params
            if (hardware.save()) {
                println "in true???"
                flash.message = "Hardware ${params.id} updated."
                println "$hardware"
                redirect(action: show, id: hardware.id)
            } else {
                println "$hardware"
                render(view: 'edit', model: [hardware: hardware])
            }
        }
        println "even getting here...about to drop out..."
    }

    def create = {
        def hardware = new Hardware()
        hardware.properties = params
        return ['hardware': hardware]
    }

    def save = {
        def hardware = new Hardware(params)
        if (hardware.parent) {
            hardware.parent.addToConfigurationItems(hardware)
        }
        if (hardware.save()) {
            flash.message = "Hardware ${hardware.id} created."
            redirect(action: show, id: hardware.id, params: ["parent.id": params.parent?.id])
        } else {
            render(view: 'create', model: [hardware: hardware])
        }
    }
}