class Relation implements java.io.Serializable {
    static auditable = true
    RelationReference reference
    ConfigurationItem thisCI
    ConfigurationItem thatCI

    Date dateCreated
    Date lastUpdated

    static belongsTo = [ConfigurationItem]
    static constraints = {
        thisCI(nullable: false, blank:false)
        reference(nullable: false, blank:false)
        thatCI(nullable: false, blank:false)
    }

    String toString() {
        if (thisCI && reference && thatCI) {
            return "${thisCI.name} ${reference.name} ${thatCI.name}"
        } else {
            return ""
        }
    }
}