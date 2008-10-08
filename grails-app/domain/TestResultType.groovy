class TestResultType implements java.io.Serializable{
    String description
    Set results
    String type = 'Test Result'

    Date dateCreated
    Date lastUpdated

    static hasMany = [results:TestResult]
    static constraints = {
        description(nullable:false, blank:false, maxSize: 50,unique:'type')
        results(nullable:true)
    }

    static mapping = {
        table 'R_CI_TYPE'
    }

    String toString(){
        return "${description}"
    }
}