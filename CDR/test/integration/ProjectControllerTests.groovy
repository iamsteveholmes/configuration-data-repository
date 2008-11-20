class ProjectControllerTests extends GroovyTestCase{
    public void testIndex(){
        def controller = new ProjectController()
        controller.index()
        assertEquals "/project/list", controller.response.redirectedUrl
    }

    public void testDelete() {
        def controller = new ProjectController()
        Project project = new Project(name: "records")
        project.save(flush: true)
        controller.params.id = project.id
        controller.delete()
        assert controller.flash.message.startsWith("Project")
        assertEquals "/project/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new ProjectController()
        Project project = new Project(name: "records")
        project.save(flush: true)
        def environment = new Environment(name: "name")
        environment.save(flush: true)
        project.environments = [environment]
        project.save(flush: true)
        log.debug "environment.id: ${environment?.id}"
        controller.params.id = project.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/project/show/")
        assert controller.flash.message.startsWith("Unable to Delete Project")
    }
}
