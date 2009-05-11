class EnvironmentTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testEnvironmentListNewDelete()
        // add tests for more operations here
    }

    def testEnvironmentListNewDelete() {
        webtest('Environment basic operations: view list, create new entry, view, edit, delete, view') {

            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')

            invoke(url: 'environment')
            verifyText(text: 'Home')

            verifyListSize 0

            /*clickLink(label: 'New Environment')
            verifyText(text: 'Create Environment')
            clickButton(label: 'Create')
            verifyText(text: 'Show Environment', description: 'Detail page')
            clickLink(label: 'List', description: 'Back to list view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Environment')
                clickButton(label: 'Update')
                verifyText(text: 'Show Environment')
                clickLink(label: 'List', description: 'Back to list view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Environment.*deleted.*//*, regex: true)
            }*/

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Environment list view with $size row(s)") {
            verifyText(text: 'Environment List')
            /*verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: '1', description: 'go to detail view')
    }
}