class HardwareTypeControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new HardwareTypeController()
        controller.index()
        assertEquals "/hardwareType/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new HardwareTypeController()
        controller.params.description = "records"
        controller.save()
        assert controller.flash.message.startsWith("Hardware Type")
        assert controller.response.redirectedUrl.startsWith("/hardwareType/show/")
    }

    public void testDuplicateSave() {
        def controller = new HardwareTypeController()
        new HardwareType(description:'records').save(flush: true)
        controller.params.description = "records"
        controller.save()
        assert controller.modelAndView.model.hardwareType
        assert !controller.modelAndView.model.hardwareType.id
    }

    public void testDelete() {
        def controller = new HardwareTypeController()
        
        HardwareType hardwareType = new HardwareType(description: "records")
        hardwareType.save(flush: true)
        controller.params.id = hardwareType.id
        controller.delete()
        assert controller.flash.message.startsWith("Hardware Type")
        assertEquals "/hardwareType/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new HardwareTypeController()
        HardwareType hardwareType = new HardwareType(description: "records")
        hardwareType.save(flush: true)
        new Hardware(name: "name", author: "author", hardwareType: hardwareType).save(flush: true)
        controller.params.id = hardwareType.id
        controller.delete()
        println controller.response.redirectedUrl
        assert controller.response.redirectedUrl.startsWith("/hardwareType/show/")
        assert controller.flash.message.startsWith("Unable to Delete Hardware Type")
    }
}
