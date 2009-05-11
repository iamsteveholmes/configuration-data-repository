class SoftwareTypeControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new SoftwareTypeController()
        controller.index()
        assertEquals "/softwareType/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new SoftwareTypeController()
        controller.params.description = "records"
        controller.save()
        assert controller.flash.message.startsWith("Software Type")
        assert controller.response.redirectedUrl.startsWith("/softwareType/show/")
    }

    public void testDuplicateSave() {
        def controller = new SoftwareTypeController()
        new SoftwareType(description:'records').save(flush: true)
        controller.params.description = "records"
        controller.save()
        assert controller.modelAndView.model.softwareType
        assert !controller.modelAndView.model.softwareType.id
    }

    public void testDelete() {
        def controller = new SoftwareTypeController()
        SoftwareType softwareType = new SoftwareType(name: "records")
        softwareType.save(flush: true)
        controller.params.id = softwareType.id
        controller.delete()
        assert controller.flash.message.startsWith("Software Type")
        assertEquals "/softwareType/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new SoftwareTypeController()
        SoftwareType softwareType = new SoftwareType(description: "records")
        softwareType.save(flush: true)
        new Software(name: "name", author: "author", softwareType: softwareType).save(flush: true)
        controller.params.id = softwareType.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/softwareType/show/")
        assert controller.flash.message.startsWith("Unable to Delete Software Type")
    }
}
