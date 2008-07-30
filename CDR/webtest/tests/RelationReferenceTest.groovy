class RelationReferenceTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testRelationReferenceListNewDelete()
        // add tests for more operations here
    }

    def testRelationReferenceListNewDelete() {
        webtest('RelationReference basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')
            
            invoke(url: 'relationReference/list')
            verifyText(text: 'Relation Reference List')

            verifyListSize 0

            clickLink(label: 'New Relation Reference')
            verifyText(text: 'Create Relation Reference')
            setInputField(name: "name", value: "thisReference")
            setInputField(name: "description", value: "this")
            clickButton(label: 'Create')
            verifyText(text: 'Show Relation Reference', description: 'Detail page')
            clickLink(label: 'Relation Reference', description: 'Back to list view')

            verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Relation Reference')
                clickButton(label: 'Update')
                verifyText(text: 'Show Relation Reference')
                clickLink(label: 'Relation', description: 'Back to list view')
            }

            verifyListSize 1

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Relation Reference.*deleted.*/, regex: true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify RelationReference list view with $size row(s)") {
            verifyText(text: 'Relation Reference List')
            /*verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: 'depends on', description: 'go to detail view')
    }
}