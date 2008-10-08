import grails.converters.XML

class ConfigurationItemTypeController {

    def index = { }

    def ciTypeList = {
        if(params.category == 'hardware'){
            def ci = new HardwareType(params)
            render HardwareType.findAll(ci) as XML
        } else if(params.category == 'software'){
            def ci = new SoftwareType(params)
            render SoftwareType.findAll(ci) as XML
        } else if(params.category == 'network'){
            def ci = new NetworkType(params)
            render NetworkType.findAll(ci) as XML
        } else if(params.category == "documentation"){
            def ci = new DocumentationType(params)
            render DocumentationType.findAll(ci) as XML
        } else if(params.category == "changeRequest"){
            def ci = new RequestType(params)
            render RequestType.findAll(ci) as XML
        } else if(params.category == "testResult"){
            def ci = new TestResultType(params)
            render TestResultType.findAll(ci) as XML
        }
    }
}