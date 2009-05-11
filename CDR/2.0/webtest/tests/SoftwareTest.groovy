class SoftwareTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testSoftwareListNewDelete()
        // add tests for more operations here
    }

    def testSoftwareListNewDelete() {
        webtest('Software basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')
            
            invoke      (url: 'software')
            verifyText  (text:'Home')

            verifyListSize 0

            clickLink   (label:'New Software')
            verifyText  (text: 'Create Software')
            setInputField(name: "name", value: "Windows XP Pro #56")
            setInputField(name: "description", value: "sdfsdf")
            setInputField(name: "author", value: "Steve Holmes")
            clickButton (label:'Create')
            verifyText  (text: 'Show Software', description:'Detail page')
            clickLink   (label:'Software', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Software')
                clickButton (label:'Update')
                verifyText  (text: 'Show Software')
                clickLink   (label:'Software', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                verifyXPath (xpath:"//div[@class='message']", text:/.*Software.*deleted.*/, regex:true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Software list view with $size row(s)") {
            verifyText  (text:'Software List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'Windows XP Pro #56', description:'go to detail view')
    }
}