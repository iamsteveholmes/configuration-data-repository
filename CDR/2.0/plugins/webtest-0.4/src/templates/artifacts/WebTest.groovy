class XclassNameXTest extends grails.util.WebTest {

    // Unlike unit tests, functional tests are often sequence dependent.
    // Specify that sequence here.
    void suite() {
        testXclassNameXListNewDelete()
        // add tests for more operations here
    }

    def testXclassNameXListNewDelete() {
        webtest('XclassNameX basic operations: view list, create new entry, view, edit, delete, view') {
            invoke      (url: 'XpropertyNameX')
            verifyText  (text:'Home')

            verifyListSize 0

            clickLink   (label:'New XclassNameX')
            verifyText  (text: 'Create XclassNameX')
            clickButton (label:'Create')
            verifyText  (text: 'Show XclassNameX', description:'Detail page')
            clickLink   (label:'List', description:'Back to list view')

            verifyListSize 1

            group(description:'edit the one element') {
                showFirstElementDetails()
                clickButton (label:'Edit')
                verifyText  (text: 'Edit XclassNameX')
                clickButton (label:'Update')
                verifyText  (text: 'Show XclassNameX')
                clickLink   (label:'List', description:'Back to list view')
            }

            verifyListSize 1

            group(description:'delete the only element') {
                showFirstElementDetails()
                clickButton (label:'Delete')
                verifyXPath (xpath:"//div[@class='message']", text:/.*XclassNameX.*deleted.*/, regex:true)
            }

            verifyListSize 0
        }
    }

    String ROW_COUNT_XPATH = "count(//div[@class='list']//tbody/tr)"

    def verifyListSize(int size) {
        ant.group(description:"verify XclassNameX list view with $size row(s)") {
            verifyText  (text:'XclassNameX List')
            verifyXPath (xpath:ROW_COUNT_XPATH, text:size, description:"$size row(s) of data expected")
        }
    }

    def showFirstElementDetails() {
        ant.clickLink(label:'1', description:'go to detail view')
    }
}