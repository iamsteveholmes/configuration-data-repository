class StatusReference implements java.io.Serializable{
    String name
    String description
    Set statuses

    Date dateCreated
    Date lastUpdated

    static hasMany = [statuses: Status]
    static constraints = {
        name(nullable: false, blank:false, maxSize: 50)
        description(nullable: true, maxSize: 255)
    }

    String toString() {
        return "${name}"
    }
}