class ReportController {

    def index = { }

    def diffReport = {
        def model = [projects:Project.list(),environments:Environment.list()]
        if(chainModel?.errors) model.errors = chainModel['errors']
        render(view: 'diffReport', model:model)
    }

    def environmentReport = {
        def model = [projects:Project.list(),environments:Environment.list()]
        if(chainModel?.errors) model.errors = chainModel['errors']
        log.debug model
        render(view: 'environmentReport', model:model)
    }

    def environmentSelect = {
        def project = Project.get(params.project.id)
        def environments = project ? Environment.findAllByProject(project) : []
        return [environments:environments]
    }
}