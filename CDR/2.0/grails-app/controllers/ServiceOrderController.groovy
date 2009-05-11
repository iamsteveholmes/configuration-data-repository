import com.delegata.domain.ServiceOrder
import org.springframework.web.multipart.commons.CommonsMultipartFile
/*import grails.converters.XML*/

class ServiceOrderController {
    //def serviceOrderService

    /*def index = { }*/

    def serviceOrderFlow = {
        createServiceOrder {
            action {
                flow.serviceOrder = new ServiceOrder()
                log.debug "create service Order"
            }
            on("success").to "proposed"
            on(Exception).to "proposed"
        }

        proposed {
            render(view: "/serviceOrder/proposed")

            on("createConfigurationItem") {
                log.debug "createConfigurationItem"
                log.debug params
                if (params.category) {
                    def ci
                    if (params.category == "hardware") {
                        ci = new Hardware(params)
                        if (!ci.hardwareType.id && ci.hardwareType.description) {
                            ci.hardwareType = HardwareType.find(ci.hardwareType)
                        }
                    } else if (params.category == "software") {
                        ci = new Software(params)
                        if(!ci?.softwareType?.id && ci?.softwareType?.description){
                            ci.softwareType = SoftwareType.find(ci.softwareType)
                        }
                    } else if (params.category == "network") {
                        ci = new Network(params)
                        if (!ci.networkType.id && ci.networkType.description) {
                            ci.networkType = NetworkType.find(ci.networkType)
                        }
                    } else if (params.category == "documentation") {
                        ci = new Documentation()
                        if (!ci.documentationType.id && ci.documentationType.description) {
                            ci.documentationType = DocumentationType.find(ci.documentationType)
                        }
                        ci.properties = params
                        def documentMap = session.getAttribute("documentMap")
                        log.debug documentMap
                        ci.document = documentMap.document
                        ci.fileType = documentMap.contentType
                        ci.fileName = documentMap.fileName
                        ci.fileSize = documentMap.fileSize
                        ci.docVersion = 1
                    } else if (params.category == "testResult") {
                        ci = new TestResult(params)
                        if (!ci.testResultType.id && ci.testResultType.description) {
                            ci.testResultType = TestResultType.find(ci.testResultType)
                        }
                        def documentMap = session.getAttribute("documentMap")
                        log.debug documentMap
                        ci.document = documentMap.document
                        ci.fileType = documentMap.contentType
                        ci.fileName = documentMap.fileName
                        ci.fileSize = documentMap.fileSize
                    } else if (params.category == "changeRequest") {
                        ci = new ChangeRequest(params)
                        if (!ci.requestType.id && ci.requestType.description) {
                            ci.requestType = RequestType.find(ci.requestType)
                        }
                        def documentMap = session.getAttribute("documentMap")
                        log.debug documentMap
                        ci.document = documentMap.document
                        ci.fileType = documentMap.contentType
                        ci.fileName = documentMap.fileName
                        ci.fileSize = documentMap.fileSize
                    } else {
                        return error()
                    }
                    println params
                    if(params.environmentName && params.projectName){
                        ci.environments = new HashSet()
                        ci.environments << Environment.find("from Environment e where e.name=:environmentName and e.project.name=:projectName", [environmentName: params.environmentName, projectName: params.projectName])
                    }
                    if (!ci?.validate()) {
                        ci?.errors.allErrors.each {
                            log.debug it
                        }
                        return error()
                    }
                    flow.serviceOrder.configurationItems << ci
                    println "flow.serviceOrder.configurationItems: ${flow?.serviceOrder?.configurationItems}"
                } else {
                    return error()
                }
            }.to "proposed"

            on("addConfigurationItem") {
                if (params.category) {
                    def ci
                    if (params.category == "hardware") {
                        ci = Hardware.get(params.id)
                    } else if (params.category == "software") {
                        ci = Software.get(params.id)
                    } else if (params.category == "network") {
                        ci = Network.get(params.id)
                    } else if (params.category == "documentation") {
                        ci = Documentation.get(params.id)
                    } else if (params.category == "testResult") {
                        ci = TestResult.get(params.id)
                    } else if (params.category == "changeRequest") {
                        ci = ChangeRequest.get(params.id)
                    } else {
                        return error()
                    }
                    flow.serviceOrder.configurationItems << ci
                } else {
                    return error()
                }
            }.to "proposed"

            on("modifyConfigurationItem") {
                def ci = flow.serviceOrder.configurationItems.each {if (it.id == params.id) return it}
                ci.properties = params
            }.to "proposed"

            on("createRelation") {
                Relation relation = new Relation()
                log.debug params
                relation.properties = params
                if (!params['thisCI.id']) relation.thisCI = flow.serviceOrder.configurationItems[Integer.parseInt(params.ciListId)]
                else if (!params['thatCI.id']) relation.thatCI = flow.serviceOrder.configurationItems[Integer.parseInt(params.ciListId)]
                if (!relation?.reference?.id && (relation?.reference?.name || relation?.reference?.description)) relation.reference = RelationReference.find(relation.reference)
                flow.serviceOrder.relations << relation
            }.to "proposed"

            on("deleteRelation") {
                List relations = flow.serviceOrder.relations
                relations.each {if (it.id == params.id) relations.remove(it)}
            }.to "proposed"

            on("createStatus") {
                try {
                    Status status = new Status(params)
                    println "status crated: $status"
                    if (!status?.configurationItem?.id) {
                        status.configurationItem = flow.serviceOrder.configurationItems[Integer.parseInt(params.ciListId)]
                    }
                    println "status.configurationItem: ${status.configurationItem}"
                    if (!status?.reference?.id && (status?.reference?.name || status?.reference?.description)) status.reference = StatusReference.find(status.reference)
                    println "status.reference: ${status.reference}"
                    flow.serviceOrder.statusus << status
                } catch (Exception e) {
                    e.printStackTrace()
                    return error()
                }

            }.to "proposed"

            on("cancel").to "end"
            on("persist") {
                log.debug "persist"
                serviceOrderService.persistServiceOrder(flow.serviceOrder)
            }.to "end"
        }

        end {
            render(view: "/serviceOrder/proposed")
        }
    }
}
