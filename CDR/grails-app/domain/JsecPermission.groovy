class JsecPermission {
    String type
    String possibleActions

    static constraints = {
        type(nullable: false, blank: false, unique: true, maxSize: 255)
        possibleActions(nullable:false, blank: false, maxSize: 255)
    }
}
