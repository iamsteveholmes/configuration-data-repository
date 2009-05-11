class RelationReferenceControllerTests extends GroovyTestCase{
    public void testIndex(){
        def controller = new RelationReferenceController()
        controller.index()
        assertEquals "/relationReference/list", controller.response.redirectedUrl
    }

    public void testSave() {
        def controller = new RelationReferenceController()
        controller.params.name = "records"
        controller.save()
        assert controller.flash.message.startsWith("Relation Reference")
        assert controller.response.redirectedUrl.startsWith("/relationReference/show/")
    }

    public void testDuplicateSave() {
        def controller = new RelationReferenceController()
        RelationReference reference = new RelationReference(name: "duplicate")
        reference.save(flush: true)
        controller.params.name = "duplicate"
        controller.save()

        assert controller.modelAndView.model.relationReference
        assert !controller.modelAndView.model.relationReference.id
    }

    public void testDelete() {
        def controller = new RelationReferenceController()
        RelationReference relationReference = new RelationReference(name: "records")
        relationReference.save(flush: true)
        controller.params.id = relationReference.id
        controller.delete()
        assert controller.flash.message.startsWith("Relation Reference")
        assertEquals "/relationReference/list", controller.response.redirectedUrl
    }

    public void testFailDelete() {
        def controller = new RelationReferenceController()
        RelationReference relationReference = new RelationReference(name: "records")
        relationReference.save(flush: true)
        NetworkType networkType = new NetworkType(description: "records")
        networkType.save(flush: true)
        def network = new Network(name: "name", author: "author", networkType: networkType).save(flush: true)
        new Relation(reference: relationReference, thisCI:network, thatCI:network).save(flush: true)
        controller.params.id = relationReference.id
        controller.delete()
        assert controller.response.redirectedUrl.startsWith("/relationReference/show/")
        assert controller.flash.message.startsWith("Unable to Delete Relation Reference")
    }
}
