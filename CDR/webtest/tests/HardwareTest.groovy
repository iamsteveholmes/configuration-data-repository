class HardwareTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testHardwareListNewDelete()
        // add tests for more operations here
    }

    def testHardwareListNewDelete() {
        webtest('Hardware basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')

            invoke(url: 'hardware')
            verifyText(text: 'Hardware List')
            clickLink(label: "New Hardware")
            verifyText(text: 'Create Hardware')
            setInputField(name: "name", value: "Solutions")
            setInputField(name: "description", value: "Solutions Server")
            setInputField(name: "author", value: "Steve Holmes")
            setInputField(name: "ownerName", value: "Steve Holmes")
            setInputField(name: "ownerEmail", value: "sholmes@delegata.com")
            clickButton(label: "Create")
            verifyText(description: "Verify that text is contained in the page", text: "Create Hardware")
            clickLink(label: "Hardware")
            verifyText(text: 'Hardware List')

            //verifyListSize 1

            group(description: 'edit the one element') {
                showFirstElementDetails()
                /*clickLink(label: "Solutions")*/
                clickButton(label: 'Edit')
                verifyText(text: 'Edit Hardware')
                clickButton(label: 'Update')
                verifyText(text: 'Show Hardware')
                /*clickLink(label: 'List', description: 'Back to list view')*/
                clickLink(label: "Hardware")
            }

            //verifyListSize 1

            //Test Create Relation
            clickLink(label:'Home')
            clickLink(label: "Hardware")
            /*clickLink(label: "Solutions")*/
            showFirstElementDetails()
            clickLink(label: "New Relation")
            setRadioButton(description: "Check radio button thatCI.id: 1", name: "thatCI.id", value: "1")
            clickButton(label: "Create")
            verifyText(description: "Verify that text is contained in the page", text: "Show Relation")

            //Test Edit Relation
            clickLink(label:'Home')
            clickLink(label: "Hardware")
            /*clickLink(label: "Solutions")*/
            showFirstElementDetails()
            clickLink(label: "Solutions depends on Solutions")

            group(description: 'delete the only element') {
                showFirstElementDetails()
                clickButton(label: 'Delete')
                verifyXPath(xpath: "//div[@class='message']", text: /.*Hardware.*deleted.*/, regex: true)
            }

            //verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description: "verify Hardware list view with $size row(s)") {
            verifyText(text: 'Hardware List')
            verifyXPath(xpath: ROW_COUNT_XPATH, text: size, description: "$size row(s) of data expected")
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label: 'Solutions', description: 'go to detail view')
    }
}