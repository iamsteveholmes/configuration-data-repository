class RelationController {
    /*def scaffold = Relation*/

    static accessControl = {
        // All actions require the 'Observer' role.
        role(name: 'Observer')
    }
    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        if (!params.max) params.max = 10
        [relationList: Relation.list(params)]
    }

    def show = {
        [relation: Relation.get(params.id)]
    }

    def delete = {
        def relation = Relation.get(params.id)
        if (relation) {
            relation.delete()
            flash.message = "Relation ${params.id} deleted"
            redirect(action: list)
        }
        else {
            flash.message = "Relation not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def relation = Relation.get(params.id)

        if (!relation) {
            flash.message = "Relation not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            return [relation: relation]
        }
    }

    def update = {
        def relation = Relation.get(params.id)
        if (relation) {
            if (Long.valueOf(relation.version) != Long.valueOf(params.version)) {
                flash.message = "This record has been modified since you last saw it.  Please try updating again."
                redirect(action: show, id: relation.id)
            } else {
                relation.properties = params
                if (!relation.hasErrors() && relation.save()) {
                    flash.message = "Relation ${params.id} updated"
                    redirect(action: show, id: relation.id)
                }
                else {
                    render(view: 'edit', model: [relation: relation])
                }
            }
        }
        else {
            flash.message = "Relation not found with id ${params.id}"
            redirect(action: edit, id: params.id)
        }
    }

    def create = {
        def relation = new Relation()
        relation.properties = params
        log.debug params
        return ['relation': relation, ciList: ConfigurationItem.list(sort: "name", order: "desc")]
    }

    def relationForm = {
        if (params.name) {
            return [ciList: ConfigurationItem.findAllByNameIlike("%${params.name}%", [sort: "name", order: "desc"])]
        } else {
            return [ciList: ConfigurationItem.list(sort: "name", order: "desc")]
        }
    }

    def save = {
        def relation = new Relation(params)
        if (!relation.hasErrors() && relation.save()) {
            flash.message = "Relation ${relation.id} created"
            redirect(action: show, id: relation.id)
        }
        else {
            render(view: 'create', model: [relation: relation])
        }
    }
}