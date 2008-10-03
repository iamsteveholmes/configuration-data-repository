class SoftwareControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new SoftwareController()
        controller.index()
        assertEquals "/software/list", controller.response.redirectedUrl
    }

    public void testCircularBomReference() {
        def controller = new SoftwareController()
        def softwareType = new SoftwareType(description:"ciType")
        softwareType.save(flush: true)
        def software1 = new Software(name:'name1',author:"author1",softwareType:softwareType)
        software1.save(flush: true)
        def software2 = new Software(name:'name2',author:"author2",softwareType:softwareType,parent:software1)
        software1.configurationItems = [software2]
        software2.save(flush: true)
        software1.save(flush: true)
        controller.params.id = software1.id
        controller.params.name = software1.name
        controller.params.author = software1.author
        controller.params.put('softwareType.id',Long.toString(software1.softwareType.id))
        controller.params.put('parent.id',Long.toString(software2.id))
        controller.params.version = software1.version

        controller.update()
        assert controller.modelAndView.model.software
    }
}
