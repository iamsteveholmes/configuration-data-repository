class DocumentationTypeTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testDocumentationTypeListNewDelete()
        // add tests for more operations here
    }

    def testDocumentationTypeListNewDelete() {
        webtest('DocumentationType basic operations: view list, create new entry, view, edit, delete, view') {

            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')
            
            invoke      (url: 'documentationType')
            verifyText  (text:'Documentation Type List')

            verifyListSize 1

            clickLink   (label:'New Documentation Type')
            verifyText  (text: 'Create Documentation Type')
            setInputField(name: "description", value: "description")
            clickButton (label:'Create')
            verifyText  (text: 'Show Documentation Type', description:'Detail page')
            clickLink   (label:'Documentation Type', description:'Back to list view')

            verifyListSize 2

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Documentation Type')
                clickButton (label:'Update')
                verifyText  (text: 'Show Documentation Type')
                clickLink   (label:'Documentation Type', description:'Back to list view')
            }

            verifyListSize 2

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                verifyXPath (xpath:"//div[@class='message']", text:/.*Documentation Type.*deleted.*/, regex:true)
            }

            verifyListSize 1
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Documentation Type list view with $size row(s)") {
            verifyText  (text:'Documentation Type List')
            verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'description', description:'go to detail view')
    }
}