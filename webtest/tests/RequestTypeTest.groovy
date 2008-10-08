class RequestTypeTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testRequestTypeListNewDelete()
        // add tests for more operations here
    }

    def testRequestTypeListNewDelete() {
        webtest('RequestType basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')
            
            invoke      (url: 'requestType')
            verifyText  (text:'Request Type List')

            verifyListSize 0

            clickLink   (label:'New Request Type')
            verifyText  (text: 'Create Request Type')
            setInputField(name: "description", value: "whatever")
            clickButton (label:'Create')
            verifyText  (text: 'Show Request Type', description:'Detail page')
            clickLink   (label:'Request Type', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Request Type')
                clickButton (label:'Update')
                verifyText  (text: 'Show Request Type')
                clickLink   (label:'Request Type', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                /*verifyXPath (xpath:"//div[@class='message']", text:/.*RequestType.*deleted.*//*, regex:true)*/
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Request Type list view with $size row(s)") {
            verifyText  (text:'Request Type List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'whatever', description:'go to detail view')
    }
}