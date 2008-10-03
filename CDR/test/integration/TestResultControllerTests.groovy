class TestResultControllerTests extends GroovyTestCase {
    public void testIndex() {
        def controller = new TestResultController()
        controller.index()
        assertEquals "/testResult/list", controller.response.redirectedUrl
    }

    public void testCircularBomReference() {
        def controller = new TestResultController()
        def testResultType = new TestResultType(description:"ciType")
        testResultType.save(flush: true)
        def testResult1 = new TestResult(name:'name1',author:"author1",testResultType:testResultType)
        testResult1.save(flush: true)
        def testResult2 = new TestResult(name:'name2',author:"author2",testResultType:testResultType,parent:testResult1)
        testResult1.configurationItems = [testResult2]
        testResult2.save(flush: true)
        testResult1.save(flush: true)
        controller.params.id = testResult1.id
        controller.params.name = testResult1.name
        controller.params.author = testResult1.author
        controller.params.put('testResultType.id',Long.toString(testResult1.testResultType.id))
        controller.params.put('parent.id',Long.toString(testResult2.id))
        controller.params.version = testResult1.version

        controller.update()
        assert controller.modelAndView.model.testResult
    }
}
