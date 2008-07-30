class SoftwareType implements java.io.Serializable{
    String description
    Set softwares
    String type = 'Software'

    Date dateCreated
    Date lastUpdated

    static hasMany = [softwares:Software]
    static constraints = {
        description(nullable:false, blank:false, maxSize: 50,unique:'type')
        softwares(nullable:true)
    }

    static mapping = {
        table 'R_CI_TYPE'
    }

    String toString(){
        return "${description}"
    }
}