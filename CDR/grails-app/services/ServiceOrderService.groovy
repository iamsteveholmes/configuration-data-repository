import com.delegata.domain.ServiceOrder

class ServiceOrderService implements java.io.Serializable{

    boolean transactional = true

    def persistServiceOrder(ServiceOrder serviceOrder) {
        serviceOrder.configurationItems.each { ci ->
            log.debug ci
            if(ci.metaClass.hasProperty(ci, "document")) ci.document = ci.document
            ci.save(flush:true)

            if(ci.environments){
                ci.environments.each{ environment ->
                    environment.configurationItems << ci
                    environment.save()   
                }
            }
        }
        serviceOrder.relations.each {
            log.debug "it.thisCI?.id: ${it.thisCI?.id}"
            log.debug "it.thatCI?.id: ${it.thatCI?.id}"
            log.debug "it.thatCI: ${it.thatCI}"
            it.save()
        }
        Date date = new Date();
        serviceOrder.statusus.each {newStatus ->
            newStatus.configurationItem.statuses.each {status ->
                if (status.endDate > date) {
                    status.endDate = date
                    status.save()
                }
            }

            newStatus.startDate = date
            newStatus.endDate = date + 100000
            newStatus.save()
        }
    }
}