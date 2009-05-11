class RelationReferenceTests extends GroovyTestCase{
    public void testQuery(){
        def relationReferences = [new RelationReference(name:'aps'),new RelationReference(name:'cdr')]
        relationReferences*.save(flush:true)
        assertEquals 2, RelationReference.list().size()
    }
}
