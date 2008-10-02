class Project implements java.io.Serializable{
    static auditable = true
    String name
    String description
    String ownerName
    String ownerEmail
    Set environments

    Date dateCreated
    Date lastUpdated

    static hasMany = [environments: Environment]
    static constraints = {
        name(nullable:false, blank:false, maxSize: 50, unique:true)
        description(nullable:true, maxSize:1000)
        ownerName(nullable:true, maxSize: 50)
        ownerEmail(nullable:true, email:true, maxSize: 75)
        environments(nullable:true)
    }

    String toString() {
        return "${name}"
    }
}