class DocumentationControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new DocumentationController()
        controller.index()
        assertEquals "/documentation/list", controller.response.redirectedUrl
    }

    public void testCircularBomReference() {
        def controller = new DocumentationController()
        def documentationType = new DocumentationType(description:"ciType")
        documentationType.save(flush: true)
        def documentation1 = new Documentation(name:'name1',author:"author1",documentationType:documentationType)
        documentation1.save(flush: true)
        def documentation2 = new Documentation(name:'name2',author:"author2",documentationType:documentationType,parent:documentation1)
        documentation1.configurationItems = [documentation2]
        documentation2.save(flush: true)
        documentation1.save(flush: true)
        controller.params.id = documentation1.id
        controller.params.name = documentation1.name
        controller.params.author = documentation1.author
        controller.params.put('documentationType.id',Long.toString(documentation1.documentationType.id))
        controller.params.put('parent.id',Long.toString(documentation2.id))
        controller.params.version = documentation1.version

        controller.update()
        assert controller.modelAndView.model.documentation
    }
}
