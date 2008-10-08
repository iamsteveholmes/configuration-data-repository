class ProjectTests extends GroovyTestCase{
    public void testQuery(){
        def aps = new Project(name:'aps',description:'asdf',ownerName:'asdf',ownerEmail:'steve@delegata.com')
        aps.save(flush:true)
        assertEquals 1, Project.list().size()
    }
}
