class ChangeRequestControllerTests extends GroovyTestCase {
    //class ChangeRequestControllerTests extendzzz GroovyTestCase {   //compile error
    public void testIndex() {
        def controller = new ChangeRequestController()
        controller.index()
        assertEquals "/changeRequest/list", controller.response.redirectedUrl
        //assertEquals "this", "that" //test failure
        //assertEquals "this", "this" //legitimate change to test, should work
        println "Make changes to this line so that it causes a conflict in subversion with another users changes to this line"

    }
}
