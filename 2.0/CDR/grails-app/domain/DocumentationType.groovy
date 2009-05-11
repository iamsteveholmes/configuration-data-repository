class DocumentationType implements java.io.Serializable{

    String description
    String type = 'Documentation'

    Set documents

    Date dateCreated
    Date lastUpdated

    static hasMany = [documents:Documentation]
    static constraints = {
        description(nullable:false, blank:false, maxSize: 50,unique:'type')
        documents(nullable:true)
    }

    static mapping = {
        table 'R_CI_TYPE'
    }

    String toString(){
        return "${description}"
    }
}