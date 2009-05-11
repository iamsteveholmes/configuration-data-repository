class RelationReference implements java.io.Serializable{
    String name
    String description
    Set relations

    Date dateCreated
    Date lastUpdated
    
    static hasMany = [relations: Relation]
    static constraints = {
        name(nullable: false, blank:false, maxSize: 50, unique: true)
        description(nullable: true, maxSize: 255)
        relations(nullable: true)
    }

    String toString() {
        return "${name}"
    }
}