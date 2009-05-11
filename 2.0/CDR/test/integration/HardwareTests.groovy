class HardwareTests extends GroovyTestCase
{
    public void testQuery(){
        def type = new HardwareType(description:'Server').save(flush:true)
        def hardwares = [new Hardware(name:'asdf', author:'Steve', hardwareType:type), new Hardware(name:'asdf', author:'Ash', hardwareType:type)]
        hardwares*.save(flush:true)
        assertEquals 2, hardwares.size()
        assertEquals 2, Hardware.list().size()
    }
}
