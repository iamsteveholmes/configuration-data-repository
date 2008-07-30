class TestResultTypeControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new TestResultTypeController()
        controller.index()
        assertEquals "/testResultType/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new TestResultTypeController()
        controller.params.description = "records"
        controller.save()
        assert controller.flash.message.startsWith("Test Result Type")
        assert controller.response.redirectedUrl.startsWith("/testResultType/show/")
    }

    public void testDuplicateSave() {
        def controller = new TestResultTypeController()
        new TestResultType(description:'records').save(flush: true)
        controller.params.description = "records"
        controller.save()
        assert controller.modelAndView.model.testResultType
        assert !controller.modelAndView.model.testResultType.id
    }

    public void testDelete() {
        def controller = new TestResultTypeController()
        TestResultType testResultType = new TestResultType(description: "records")
        testResultType.save(flush: true)
        controller.params.id = testResultType.id
        controller.delete()
        assert controller.flash.message.startsWith("Test Result Type")
        assertEquals "/testResultType/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new TestResultTypeController()
        TestResultType testResultType = new TestResultType(description: "records")
        testResultType.save(flush: true)
        new TestResult(name: "name", author: "author", testResultType: testResultType).save(flush: true)
        controller.params.id = testResultType.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/testResultType/show/")
        assert controller.flash.message.startsWith("Unable to Delete Test Result Type")
    }
}
