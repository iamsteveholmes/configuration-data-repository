class NetworkTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testNetworkListNewDelete()
        // add tests for more operations here
    }

    def testNetworkListNewDelete() {
        webtest('Network basic operations: view list, create new entry, view, edit, delete, view') {
            invoke(url: 'auth')
            verifyText(text:'Login')
            setInputField(name: "username", value: "admin")
            setInputField(name:"password",value: "changeit")
            clickButton(label: 'Login >')
            verifyText(text: 'Application List')

            invoke      (url: 'network')
            verifyText  (text:'Home')

            verifyListSize 0

            clickLink   (label:'New Network')
            verifyText  (text: 'Create Network')
            setInputField(name: "name", value: "Windows XP Pro #56")
            setInputField(name: "description", value: "sdfsdf")
            setInputField(name: "author", value: "Steve Holmes")
            clickButton (label:'Create')
            verifyText  (text: 'Show Network', description:'Detail page')
            clickLink   (label:'Network', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit Network')
                clickButton (label:'Update')
                verifyText  (text: 'Show Network')
                clickLink   (label:'Network', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                verifyXPath (xpath:"//div[@class='message']", text:/.*Network.*deleted.*/, regex:true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify Network list view with $size row(s)") {
            verifyText  (text:'Network List')
            /*verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")*/
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'Windows XP Pro #56', description:'go to detail view')
    }
}