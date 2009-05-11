class ConfigurationItemTests extends GroovyTestCase{
    public void testQuery(){
        def configs = [new ConfigurationItem(name:'asdf', author:'Steve'), new ConfigurationItem(name:'asdf', author:'Ash')]
        configs*.save(flush:true)
        assertEquals 2, ConfigurationItem.list().size()
    }
}
