class RelationTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testRelationListNewDelete()
        // add tests for more operations here
    }

    def testRelationListNewDelete() {
        webtest('Relation basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')
            
            invoke(url: 'relation')
            verifyText(text: 'Home')

            verifyListSize 0

            /*clickLink(label: 'New Relation')
            verifyText(text: 'Create Relation')
            clickButton(label: 'Create')
            verifyText(text: 'Show Relation', description: 'Detail page')
            clickLink(label: 'List', description: 'Back to list view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Relation')
                clickButton(label: 'Update')
                verifyText(text: 'Show Relation')
                clickLink(label: 'List', description: 'Back to list view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Relation.*deleted.*//*, regex: true)
            }

            verifyListSize 0*/
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Relation list view with $size row(s)") {
            verifyText(text: 'Relation List')
            /*verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: '1', description: 'go to detail view')
    }
}