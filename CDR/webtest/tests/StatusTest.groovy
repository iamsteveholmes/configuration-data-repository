class StatusTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testStatusListNewDelete()
        // add tests for more operations here
    }

    def testStatusListNewDelete() {
        webtest('Status basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')
            
            //invoke(url: 'status')
            //verifyText(text: 'Home')

            /*verifyListSize 0

            clickLink(label: 'New Status')
            verifyText(text: 'Create Status')
            clickButton(label: 'Create')
            verifyText(text: 'Show Status', description: 'Detail page')
            clickLink(label: 'List', description: 'Back to list view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Status')
                clickButton(label: 'Update')
                verifyText(text: 'Show Status')
                clickLink(label: 'List', description: 'Back to list view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Status.*deleted.*//*, regex: true)
            }

            verifyListSize 0*/
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Status list view with $size row(s)") {
            verifyText(text: 'Status List')
            verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: '1', description: 'go to detail view')
    }
}