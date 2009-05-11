class HardwareControllerTests extends GroovyTestCase
{
    def testEnvironment
    def solutions
    void setUp(){
        def aps = new Project(name:"APS", description:"APS project", ownerName:"Steve Holmes", ownerEmail:"sholmes@delegata.com").save(flush:true)
        testEnvironment = new Environment(name:"Testing", description:"Testing", ownerName:"Steve Holmes", ownerEmail:"sholmes@delegata.com", project:aps).save(flush:true)
        def hardwareType = new HardwareType(description:'Server')
        assert hardwareType.validate()
        hardwareType.save(flush:true)
        solutions = new Hardware(name:'Solutions',author:'Steve Holmes', hardwareType:hardwareType).save(flush:true)
        testEnvironment.addToConfigurationItems(solutions).save(flush:true)
    }
    public void testIndex(){
        def controller = new HardwareController()
        controller.index()
        assertEquals "/hardware/list", controller.response.redirectedUrl
    }

    public void testDelete(){
        def controller = new HardwareController()
        controller.params.id = solutions.id
        assert testEnvironment.configurationItems.size() == 1
        testEnvironment.configurationItems.each {assert it == solutions}
        controller.delete()
        assert testEnvironment.configurationItems.size() == 0
    }

    public void testCircularBomReference() {
        def controller = new HardwareController()
        def hardwareType = new HardwareType(description:"ciType")
        hardwareType.save(flush: true)
        def hardware1 = new Hardware(name:'name1',author:"author1",hardwareType:hardwareType)
        hardware1.save(flush: true)
        def hardware2 = new Hardware(name:'name2',author:"author2",hardwareType:hardwareType,parent:hardware1)
        hardware1.configurationItems = [hardware2]
        hardware2.save(flush: true)
        hardware1.save(flush: true)
        controller.params.id = hardware1.id
        controller.params.name = hardware1.name
        controller.params.author = hardware1.author
        controller.params.put('hardwareType.id',Long.toString(hardware1.hardwareType.id))
        controller.params.put('parent.id',Long.toString(hardware2.id))

        controller.update()
        assert controller.modelAndView.model.hardware
    }

    /*void tearDown(){
        Project.list()*.delete()
        Environment.list()*.delete()
        Hardware.list()*.delete()
    }*/
}
