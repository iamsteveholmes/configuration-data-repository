class ChangeRequestControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new ChangeRequestController()
        controller.index()
        assertEquals "/changeRequest/list", controller.response.redirectedUrl
    }

    public void testCircularBomReference() {
        def controller = new ChangeRequestController()
        def requestType = new RequestType(description:"ciType")
        requestType.save(flush: true)
        def changeRequest1 = new ChangeRequest(name:'name1',author:"author1",requestType:requestType)
        changeRequest1.save(flush: true)
        def changeRequest2 = new ChangeRequest(name:'name2',author:"author2",requestType:requestType,parent:changeRequest1)
        changeRequest1.configurationItems = [changeRequest2]
        changeRequest2.save(flush: true)
        changeRequest1.save(flush: true)
        controller.params.id = changeRequest1.id
        controller.params.version = changeRequest1.version
        controller.params.name = changeRequest1.name
        controller.params.author = changeRequest1.author
        controller.params.put('requestType.id',Long.toString(changeRequest1.requestType.id))
        controller.params.put('parent.id',Long.toString(changeRequest2.id))
        controller.update()
        assert controller.modelAndView.model.changeRequest
    }
}