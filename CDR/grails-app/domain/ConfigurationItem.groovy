class ConfigurationItem implements java.io.Serializable {
    static auditable = true
    String name
    String description
    String author
    String ownerName
    String ownerEmail
    ConfigurationItem parent

    Date dateCreated
    Date lastUpdated

    Set configurationItems
    Set environments
    Set statuses
    Set thisRelations
    Set thatRelations

    static hasMany = [thisRelations: Relation, thatRelations: Relation, environments: Environment, statuses: Status, configurationItems: ConfigurationItem]
    static mappedBy = [thisRelations: 'thisCI', thatRelations: 'thatCI', configurationItems: 'parent']
    static belongsTo = [Environment, ConfigurationItem]
    static constraints = {
        name(nullable: false, blank: false, maxSize: 50)
        description(nullable: true, maxSize: 1000)
        author(nullable: false, blank: false, maxSize: 50)
        ownerName(nullable: true, maxSize: 50)
        ownerEmail(nullable: true, email: true, maxSize: 75)
        parent(nullable: true)
        configurationItems(nullable: true)
        environments(nullable: true)
        statuses(nullable: true)
        thisRelations(nullable: true)
        thatRelations(nullable: true)
    }

    static mapping = {
        //tablePerHierarchy false
        table 'configuration_item'
        columns {
            environments lazy: false
            parent lazy: false, column: 'bom'
        }
    }

    String toString() {
        return "${name}"
    }
}