class ChangeRequestTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testChangeRequestListNewDelete()
        // add tests for more operations here
    }

    def testChangeRequestListNewDelete() {
        webtest('Change Request basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(description: "Verify that text is contained in the page", text: "Application List")

            invoke(url: 'changeRequest')
            verifyText(text: 'Home')

            verifyListSize 0

            clickLink(label: 'New Change Request')
            verifyText(text: 'Create Change Request')
            setInputField(name: "name", value: "request 1")
            setInputField(name: "description", value: "Steve Holmes")
            setInputField(name: "author", value: "Steve Holmes")
            clickButton(label: 'Create')
            verifyText(text: 'Show Change Request', description: 'Detail page')
            clickLink(label: 'Request', description: 'Back to list view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Change Request')
                clickButton(label: 'Update')
                verifyText(text: 'Show Change Request')
                clickLink(label: 'Request', description: 'Back to list view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*ChangeRequest.*deleted.*/, regex: true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Change Request list view with $size row(s)") {
            verifyText(text: 'Change Request List')
            /*verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: 'request 1', description: 'go to detail view')
    }
}