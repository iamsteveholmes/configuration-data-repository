class NetworkTypeTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testNetworkTypeListNewDelete()
        // add tests for more operations here
    }

    def testNetworkTypeListNewDelete() {
        webtest('Network Type basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Project List')

            invoke      (url: 'networkType')
            verifyText  (text:'Network Type List')

            verifyListSize 0

            clickLink   (label:'New Network Type')
            verifyText  (text: 'Create Network Type')
            setInputField(name: "description", value: "whatever")
            clickButton (label:'Create')
            verifyText  (text: 'Show Network Type', description:'Detail page')
            clickLink   (label:'Network Type', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Network Type')
                clickButton (label:'Update')
                verifyText  (text: 'Show Network Type')
                clickLink   (label:'Network Type', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                /*verifyXPath (xpath:"//div[@class='message']", text:/.*NetworkType.*deleted.*//*, regex:true)*/
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Network Type list view with $size row(s)") {
            verifyText  (text:'Network Type List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'whatever', description:'go to detail view')
    }
}