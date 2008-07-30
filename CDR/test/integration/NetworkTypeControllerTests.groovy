class NetworkTypeControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new NetworkTypeController()
        controller.index()
        assertEquals "/networkType/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new NetworkTypeController()
        controller.params.description = "records"
        controller.save()
        assert controller.flash.message.startsWith("Network Type")
        assert controller.response.redirectedUrl.startsWith("/networkType/show/")
    }

    public void testDuplicateSave() {
        def controller = new NetworkTypeController()
        new NetworkType(description:'records').save(flush: true)
        controller.params.description = "records"
        controller.save()
        assert controller.modelAndView.model.networkType
        assert !controller.modelAndView.model.networkType.id
    }

    public void testDelete() {
        def controller = new NetworkTypeController()
        NetworkType networkType = new NetworkType(description: "records")
        networkType.save(flush: true)
        controller.params.id = networkType.id
        controller.delete()
        assert controller.flash.message.startsWith("Network Type")
        assertEquals "/networkType/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new NetworkTypeController()
        NetworkType networkType = new NetworkType(description: "records")
        networkType.save(flush: true)
        new Network(name: "name", author: "author", networkType: networkType).save(flush: true)
        controller.params.id = networkType.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/networkType/show/")
        assert controller.flash.message.startsWith("Unable to Delete Network Type")
    }
}
