class Status implements java.io.Serializable {
    Date startDate
    Date endDate
    ConfigurationItem configurationItem
    StatusReference reference

    Date dateCreated
    Date lastUpdated

    static belongsTo = [ConfigurationItem]
    static constraints = {
        startDate(nullable: false, blank: false)
        endDate(nullable: false, blank: false)
        configurationItem(nullable: false, blank: false)
        reference(nullable: false, blank: false)
    }

    String toString() {
        if (reference) {
            return "${reference?.name}"
        } else {
            return ""
        }
    }
}