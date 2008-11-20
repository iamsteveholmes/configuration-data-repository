class ConfigurationItemController {

    def index = { }
    //http://localhost:8080/CDR/configurationItem/hardware?id=1&name=Solutions&project.name=APS&environment.name=Testing&ciType.name=Server&status.reference.name=Active
    def ciList = {
        Date date = new Date()
        Project project = Project.find(new Project(name: params.project.name))
        Environment environment = Environment.find(new Environment(name: params.environment.name, project: project))
        def ciList

        if (params.category == 'hardware') {
            HardwareType hardwareType = HardwareType.find(new HardwareType(description: params.ciType.name))
            ciList = Hardware.executeQuery("select ci from Hardware as ci join fetch ci.environments environment join fetch ci.hardwareType join ci.statuses as status where ci.name=:name and environment=:environment and ci.hardwareType=:hardwareType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, hardwareType: hardwareType, date: date, statusName:params.status.reference.name])
        } else if (params.category == 'software') {
            log.debug "params: ${params}"
            log.debug "params.ciType.name: ${params.ciType.name}"
            SoftwareType softwareType = SoftwareType.find(new SoftwareType(description: params.ciType.name))
            log.debug "softwareType: ${softwareType}"
            ciList = Software.executeQuery("select ci from Software as ci join fetch ci.environments environment join fetch ci.softwareType join ci.statuses as status  where ci.name=:name and environment=:environment and ci.softwareType=:softwareType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, softwareType: softwareType, date: date, statusName:params.status.reference.name])
            log.debug "ciList[0].thisRelations: ${ciList[0].thisRelations}"
            log.debug "ciList[0].thatRelations: ${ciList[0].thatRelations}"
        } else if (params.category == 'network') {
            NetworkType networkType = NetworkType.find(new NetworkType(description: params.ciType.name))
            ciList = Network.executeQuery("select ci from Network as ci join fetch ci.environments environment join fetch ci.networkType join ci.statuses as status where ci.name=:name and environment=:environment and ci.networkType=:networkType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, networkType: networkType, date: date, statusName:params.status.reference.name])
        } else if (params.category == "documentation") {
            DocumentationType documentationType = DocumentationType.find(new DocumentationType(description: params.ciType.name))
            ciList = Documentation.executeQuery("select ci from Documentation as ci join fetch ci.environments environment join fetch ci.documentationType join ci.statuses as status where ci.name=:name and environment=:environment and ci.documentationType=:documentationType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, documentationType: documentationType, date: date, statusName:params.status.reference.name])
        } else if (params.category == "changeRequest") {
            RequestType requestType = ChangeRequestType.find(new RequestType(description: params.ciType.name))
            ciList = ChangeRequest.executeQuery("select ci from ChangeRequest as ci join fetch ci.environments environment join fetch ci.requestType join ci.statuses as status where ci.name=:name and environment=:environment and ci.requestType=:requestType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, requestType: requestType, date: date, statusName:params.status.reference.name])
        } else if (params.category == "testResult") {
            TestResultType testResultType = TestResultType.find(new TestResultType(description: params.ciType.name))
            ciList = TestResult.executeQuery("select ci from TestResult as ci join fetch ci.environments environment join fetch ci.testResultType join ci.statuses as status where ci.name=:name and environment=:environment and ci.testResultType=:testResultType and status.endDate > :date and status.startDate < :date and status.reference.name = :statusName", [name: params.name, environment: environment, testResultType: testResultType, date: date, statusName:params.status.reference.name])
        } else {
//barf      
        }
        log.debug "environment: $environment"
        log.debug "project: $project"
        log.debug "params.name: ${params.name}"
        log.debug "params.category: ${params.category}"
        log.debug "params.project.name: ${params.project.name}"
        log.debug "params.ciType.name: ${params.ciType.name}"
        log.debug "params.status.reference.name: ${params.status.reference.name}"
        log.debug "ciList: ${ciList}"
        if (ciList.size == 1) {
            render(view:"${params.category}", model: [ci: ciList[0]])
        } else {
            log.debug "ciList != 1"
            error()
        }
    }
}