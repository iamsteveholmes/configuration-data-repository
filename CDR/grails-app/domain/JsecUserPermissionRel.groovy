class JsecUserPermissionRel {
    JsecUser user
    JsecPermission permission
    String target
    String actions

    static constraints = {
        target(nullable: true, blank: false, maxSize: 255)
        actions(nullable: false, blank: false, maxSize: 255)
    }
}
