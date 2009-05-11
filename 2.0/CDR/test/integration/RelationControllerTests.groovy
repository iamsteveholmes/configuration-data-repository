class RelationControllerTests extends GroovyTestCase {

    public void testIndex(){
        def controller = new RelationController()
        controller.index()
        assertEquals "/relation/list", controller.response.redirectedUrl
    }
}