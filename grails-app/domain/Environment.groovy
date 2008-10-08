class Environment implements java.io.Serializable{
    String name
    String description
    String ownerName
    String ownerEmail
    Project project

    Set configurationItems

    Date dateCreated
    Date lastUpdated

    static hasMany = [configurationItems: ConfigurationItem]
    static belongsTo = [Project]
    static constraints = {
        name(nullable: false, blank:false, maxSize: 50,unique:['project'])
        description(nullable: true, maxSize: 1000)
        ownerName(nullable: true, maxSize: 50)
        ownerEmail(nullable: true, email: true, maxSize: 75)
        project(nullable: true)
        configurationItems(nullable: true)
    }

    static mapping = {
        columns {
            configurationItems lazy: false
            project lazy: false
        }
    }

    String toString() {
        return "${name}"
    }
}