class StatusControllerTests extends GroovyTestCase
{
    public void testIndex(){
        def controller = new StatusController()
        controller.index()
        assertEquals "/status/list", controller.response.redirectedUrl
    }
}
