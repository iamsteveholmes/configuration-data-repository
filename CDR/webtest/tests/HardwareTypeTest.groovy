class HardwareTypeTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testHardwareTypeListNewDelete()
        // add tests for more operations here
    }

    def testHardwareTypeListNewDelete() {
        webtest('HardwareType basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')

            invoke      (url: 'hardwareType')
            verifyText  (text:'Hardware Type List')

            verifyListSize 0

            clickLink   (label:'New Hardware Type')
            verifyText  (text: 'Create Hardware Type')
            setInputField(name: "description", value: "whatever")
            clickButton (label:'Create')
            verifyText  (text: 'Show Hardware Type', description:'Detail page')
            clickLink   (label:'Hardware Type', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Hardware Type')
                clickButton (label:'Update')
                verifyText  (text: 'Show Hardware Type')
                clickLink   (label:'Hardware Type', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                verifyXPath (xpath:"//div[@class='message']", text:/.*Hardware Type.*deleted.*/, regex:true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Hardware Type list view with $size row(s)") {
            verifyText  (text:'Hardware Type List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'whatever', description:'go to detail view')
    }
}