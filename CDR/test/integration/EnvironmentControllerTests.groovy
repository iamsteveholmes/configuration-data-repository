class EnvironmentControllerTests extends GroovyTestCase
{
    def aps
    def testEnvironment
    def solutions
    void setUp(){
        aps = new Project(name:"APS", description:"APS project", ownerName:"Steve Holmes", ownerEmail:"sholmes@delegata.com")
        assert aps.validate()
        aps.save(flush:true)
        testEnvironment = new Environment(name:"Testing", description:"Testing", ownerName:"Steve Holmes", ownerEmail:"sholmes@delegata.com", project:aps)
        assert testEnvironment.validate()
        testEnvironment.save(flush:true)
        new Environment(name:"Development", description:"Development", ownerName:"Steve Holmes", ownerEmail:"sholmes@delegata.com", project:aps).save(flush:true)
        def hardwareType = new HardwareType(description:'Server')
        assert hardwareType.validate()
        hardwareType.save(flush:true)
        solutions = new Hardware(name:'Solutions',author:'Steve Holmes', hardwareType:hardwareType)
        if( !solutions.validate() ) {
           solutions.errors.each {
                log.debug it
           }
        }
        assert solutions.validate()
        solutions.save(flush:true)
    }

    public void testIndex(){
        EnvironmentController controller = new EnvironmentController()
        controller.index()
        assertEquals "/environment/list", controller.response.redirectedUrl
    }

    public void testList(){
        EnvironmentController controller = new EnvironmentController()
        def environments = controller.list()?.environmentList
        assert environments != null
        assertLength(2, environments as Object[])
        assert environments[0].name?.toString() == "Testing"
    }

    public void testAddRelation(){
        EnvironmentController controller = new EnvironmentController()
        controller.params.id = testEnvironment.id
        assert controller.addRelation()?.environment == testEnvironment
        assert controller.addRelation()?.ciList != null
    }

    public void testSaveRelation(){
        EnvironmentController controller = new EnvironmentController()
        controller.params.ciId = solutions.id
        controller.params.id = testEnvironment.id
        controller.saveRelation()
        assert testEnvironment.configurationItems != null
        testEnvironment.configurationItems.each {assert it == solutions}
    }

    public void testRemoveCI(){
        EnvironmentController controller = new EnvironmentController()
        testEnvironment.configurationItems = [solutions]
        testEnvironment.save(flush: true)
        controller.params.ciID = solutions.id
        controller.params.id = testEnvironment.id
        controller.removeCI()
        assert controller.flash.message.startsWith("Configuration Item ")
        assert controller.response.redirectedUrl.startsWith("/environment/show/")
    }

    /*void tearDown(){
        Project.list()*.delete()
        Environment.list()*.delete()
        Hardware.list()*.delete()
    }*/
}
