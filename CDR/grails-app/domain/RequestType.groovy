class RequestType implements java.io.Serializable{
    static auditable = true
    String description
    String type = 'Change Request'
    Set requests

    Date dateCreated
    Date lastUpdated

    static hasMany = [requests:ChangeRequest]
    static constraints = {
        description(nullable:false, blank:false, maxSize: 50,unique:'type')
        requests(nullable:true)
    }

    static mapping = {
        table 'R_CI_TYPE'
    }

    String toString(){
        return "${description}"
    }
}