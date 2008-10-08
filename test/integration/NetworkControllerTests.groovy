class NetworkControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new NetworkController()
        controller.index()
        assertEquals "/network/list", controller.response.redirectedUrl
    }

    public void testCircularBomReference() {
        def controller = new NetworkController()
        def networkType = new NetworkType(description:"ciType")
        networkType.save(flush: true)
        def network1 = new Network(name:'name1',author:"author1",networkType:networkType)
        network1.save(flush: true)
        def network2 = new Network(name:'name2',author:"author2",networkType:networkType,parent:network1)
        network1.configurationItems = [network2]
        network2.save(flush: true)
        network1.save(flush: true)
        controller.params.id = network1.id
        controller.params.name = network1.name
        controller.params.author = network1.author
        controller.params.put('networkType.id',Long.toString(network1.networkType.id))
        controller.params.put('parent.id',Long.toString(network2.id))
        controller.params.version = network1.version

        controller.update()
        assert controller.modelAndView.model.network
    }
}
