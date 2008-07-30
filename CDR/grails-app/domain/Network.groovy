class Network extends ConfigurationItem{
    String internetProtocolAddress
    String macAddress
    String element
    String location

    NetworkType networkType

    Date dateCreated
    Date lastUpdated

    static belongsTo = [Environment]
    static constraints = {
        internetProtocolAddress(nullable:true, maxSize: 75)
        macAddress(nullable:true, maxSize: 75)
        element(nullable:true, maxSize: 255)
        location(nullable:true, maxSize: 255)
        networkType(nullable:false, blank:false)
    }
    static mapping = {
        tablePerHierarchy false
    }

    String toString(){
        return "${name}"
    }
}