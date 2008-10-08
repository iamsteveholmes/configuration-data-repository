class StatusReferenceTests extends GroovyTestCase
{
    public void testQuery(){
        def statusReferences = [new StatusReference(name:'aps'),new StatusReference(name:'cdr')]
        statusReferences*.save(flush:true)
        assertEquals 2, StatusReference.list().size()
    }
}
