class TestResultTypeTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testTestResultTypeListNewDelete()
        // add tests for more operations here
    }

    def testTestResultTypeListNewDelete() {
        webtest('TestResultType basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')
            
            invoke      (url: 'testResultType')
            verifyText  (text:'Test Result Type')

            verifyListSize 0

            clickLink   (label:'New Test Result Type')
            verifyText  (text: 'Create Test Result Type')
            setInputField(name: "description", value: "whatever")
            clickButton (label:'Create')
            verifyText  (text: 'Show Test Result Type', description:'Detail page')
            clickLink   (label:'Test Result Type', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Test Result Type')
                clickButton (label:'Update')
                verifyText  (text: 'Show Test Result Type')
                clickLink   (label:'Test Result Type', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                /*verifyXPath (xpath:"//div[@class='message']", text:/.*TestResultType.*deleted.*//*, regex:true)*/
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Test Result Type list view with $size row(s)") {
            verifyText  (text:'Test Result Type List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'whatever', description:'go to detail view')
    }
}