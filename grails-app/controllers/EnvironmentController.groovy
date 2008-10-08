class EnvironmentController {
    /*def scaffold = Environment*/
    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }
    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [environmentList: Environment.list(params)]
    }

    def addRelation = {
        if (!params.max) params.max = 10
        if (!params.offset) params.offset = 0
        log.debug params
        if (params.name) {
            return [ciList: ConfigurationItem.findAllByNameIlike("%${params.name}%", [max: params.max, offset: params.offset, sort: "name", order: "desc"]), ciListSize: ConfigurationItem.findAllByNameIlike("%${params.name}%").size, environment: Environment.get(params.id)]
        } else {
            return [ciList: ConfigurationItem.list(max: params.max, offset: params.offset, sort: "name", order: "desc"), ciListSize: ConfigurationItem.list().size, environment: Environment.get(params.id)]
        }
    }

    def relationForm = {
        if (!params.max) params.max = 10
        if (!params.offset) params.offset = 0
        log.debug params

        if (params.name) {
            return [ciList: ConfigurationItem.findAllByNameIlike("%${params.name}%", [max: params.max, offset: params.offset, sort: "name", order: "desc"]), ciListSize: ConfigurationItem.findAllByNameIlike("%${params.name}%").size, environment: Environment.get(params.id)]
        } else {
            return [ciList: ConfigurationItem.list(max: params.max, offset: params.offset, sort: "name", order: "desc"), ciListSize: ConfigurationItem.list().size, environment: Environment.get(params.id)]
        }
    }

    def saveRelation = {
        def configurationItem = ConfigurationItem.get(params.ciId)
        def environment = Environment.get(params.id)
        if (configurationItem) {
            environment.addToConfigurationItems(configurationItem)
        }
        redirect(action: show, id: environment.id)
    }

    def show = {
        [environment: Environment.get(params.id)]
    }

    def delete = {
        def environment = Environment.get(params.id)
        if (environment) {
            environment.delete()
            flash.message = "Environment ${params.id} deleted."
            redirect(action: list)
        }
        else {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def environment = Environment.get(params.id)

        if (!environment) {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [environment: environment]
        }
    }

    def update = {
        def environment = Environment.get(params.id)
        if (environment) {
            if (Long.valueOf(environment.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: environment.id)
            } else {
                environment.properties = params
                if (environment.save()) {
                    flash.message = "Environment ${params.id} updated."
                    redirect(action: show, id: environment.id)
                }
                else {
                    render(view: 'edit', model: [environment: environment])
                }
            }
        } else {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def environment = new Environment()
        environment.properties = params
        return ['environment': environment]
    }

    def save = {
        def environment = new Environment()
        environment.properties = params
        log.debug environment
        if (environment.save()) {
            flash.message = "Environment ${environment.id} created."
            redirect(action: show, id: environment.id)
        }
        else {
            render(view: 'create', model: [environment: environment])
        }
    }

    def removeCI = {
        ConfigurationItem ci = ConfigurationItem.get(params.ciID)
        Environment environment = Environment.get(params.id)
        environment.configurationItems -= ci
        environment.save()
        flash.message = "Configuration Item ${params.ciID} removed from this Environment"
        redirect(action: show, id: environment.id)
    }
}