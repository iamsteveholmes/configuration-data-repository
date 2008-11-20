class StatusReferenceControllerTests extends GroovyTestCase {
    StatusService statusService
    public void testIndex() {
        def controller = new StatusReferenceController()
        controller.index()
        assertEquals "/statusReference/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new StatusReferenceController()
        controller.params.name = "records"
        controller.save()
        assert controller.flash.message.startsWith("Status Reference")
        assert controller.response.redirectedUrl.startsWith("/statusReference/show/")
    }

    public void testDelete() {
        def controller = new StatusReferenceController()
        StatusReference statusReference = new StatusReference(name: "records")
        statusReference.save(flush: true)
        controller.params.id = statusReference.id
        controller.delete()
        assert controller.flash.message.startsWith("Status Reference")
        assertEquals "/statusReference/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new StatusReferenceController()
        StatusReference statusReference = new StatusReference(name: "records")
        statusReference.save(flush: true)
        NetworkType networkType = new NetworkType(description: "records")
        networkType.save(flush: true)
        def network = new Network(name: "name", author: "author", networkType: networkType).save(flush: true)
        Date date = new Date()
        def status = new Status(reference: statusReference, configurationItem:network)
        statusService.createStatus(status)
        log.debug "status: $status"
        log.debug "status.id ${status.id}"
        controller.params.id = statusReference.id
        controller.delete()
        log.debug "controller.response.redirectedUrl: ${controller.response.redirectedUrl}"
        log.debug "controller.flash.message: ${controller.flash.message}"
        assert controller.response.redirectedUrl.startsWith("/statusReference/show/")
        assert controller.flash.message.startsWith("Unable to Delete Status Reference")
    }
}
