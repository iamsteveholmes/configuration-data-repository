class StatusTests extends GroovyTestCase{
    public void testQuery(){
        def configurationItem = new ConfigurationItem(name:'config1', author:'steve').save(flush:true)
        def statusReference = new StatusReference(name:'aps').save(flush:true)
        def statuses = [new Status(startDate:new Date(), endDate:new Date(), configurationItem:configurationItem, reference:statusReference),new Status(startDate:new Date(), endDate:new Date(), configurationItem:configurationItem, reference:statusReference)]
        statuses*.save(flush:true)
        assertEquals 2, Status.list().size()
    }
}
