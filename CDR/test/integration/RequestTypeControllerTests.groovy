class RequestTypeControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new RequestTypeController()
        controller.index()
        assertEquals "/requestType/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new RequestTypeController()
        controller.params.description = "records"
        controller.save()
        assert controller.flash.message.startsWith("Request Type")
        assert controller.response.redirectedUrl.startsWith("/requestType/show/")
    }

    public void testDuplicateSave() {
        def controller = new RequestTypeController()
        new RequestType(description:'records').save(flush: true)
        controller.params.description = "records"
        controller.save()
        assert controller.modelAndView.model.requestType
        assert !controller.modelAndView.model.requestType.id
    }

    public void testDelete() {
        def controller = new RequestTypeController()
        RequestType requestType = new RequestType(name: "records")
        requestType.save(flush: true)
        controller.params.id = requestType.id
        controller.delete()
        assert controller.flash.message.startsWith("Request Type")
        assertEquals "/requestType/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new RequestTypeController()
        RequestType requestType = new RequestType(description: "records")
        requestType.save(flush: true)
        new ChangeRequest(name: "name", author: "author", requestType: requestType).save(flush: true)
        controller.params.id = requestType.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/requestType/show/")
        assert controller.flash.message.startsWith("Unable to Delete Request Type")
    }
}
