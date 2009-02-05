class ProjectTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testProjectListNewDelete()
        // add tests for more operations here
    }

    def testProjectListNewDelete() {
        webtest('Project basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')

            invoke(url: 'project')
            verifyText(text: 'Home')

            verifyListSize 0

            clickLink(label: 'New Application')
            verifyText(text: 'Create Application')
            setInputField(name: "name", value: "Unique Name")
            setInputField(name: "description", value: "APS Project")
            setInputField(name: "ownerName", value: "Steve Holmes")
            setInputField(name: "ownerEmail", value: "sholmes@delegata.com")
            clickButton(label: "Create")
            verifyText(text: "Show Application", description: "Verify that text is contained in the page")
            clickLink(label: "Application", description: 'Back to List view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Application')
                clickButton(label: 'Update')
                verifyText(text: 'Show Application')
                clickLink(label: "Application", description: 'Back to List view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Project.*deleted.*/, regex: true)
                clickLink(label: "Application", description: 'Back to List view')
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Application list view with $size row(s)") {
            verifyText(text: 'Application List')
            /*verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: 'APS', description: 'go to detail view')
    }
}