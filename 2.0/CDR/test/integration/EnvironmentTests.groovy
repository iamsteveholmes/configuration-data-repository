class EnvironmentTests extends GroovyTestCase{
    public void testQuery(){
        def project = new Project(name:'aps').save(flush:true)
        def environments = [new Environment(name:'asdf1', project:project), new Environment(name:'asdf2', project:project)]
        environments*.save(flush:true)
        assertEquals 2, Environment.list().size()
    }
}
