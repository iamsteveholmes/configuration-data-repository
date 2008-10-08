import org.springframework.web.multipart.commons.CommonsMultipartFile

/**
 * User: sholmes
 * Date: Jul 2, 2008
 * Time: 11:47:13 AM
 */
class RestFilters {
    def filters = {
        log.debug "here 1"
        cancelServiceOrder(uri: '/serviceOrder') {
            before = {
                if (request.method == "DELETE"){
                    params._eventId_cancel = 'cancel'
                    log.debug "here 2"
                } else if (request.method == "POST"){
                    params._eventId_persist = 'persist'
                    log.debug "here 3"
                    log.debug params
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }

        createConfigurationItem(uri: '/serviceOrder/configurationItem') {
            before = {
                if (request.method == "POST"){
                    params._eventId_createConfigurationItem ='createConfigurationItem'
                    log.debug "here 4"
                    if(params.document){
                        def upload = request.getFile("document")
                        Map documentMap = ["document": upload.getBytes(),"contentType":upload.getContentType(), "fileName":upload.getOriginalFilename(), "fileSize":upload.getSize()]
                        session.setAttribute("documentMap",documentMap)
                        params.remove("document")
                    }
                    log.debug params
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }

        modifyConfigurationItem(uri: '/serviceOrder/configurationItem/**') {
            before = {
                if (request.method == "PUT"){
                    params._eventId_modifyConfigurationItem = 'modifyConfigurationItem'
                    log.debug "here 5"
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }

        createRelation(uri: '/serviceOrder/configurationItem/**/this') {
            before = {
                if (request.method == "POST"){
                    params._eventId_createRelation = 'createRelation'
                    log.debug "here 6"
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }

        deleteRelation(uri: '/serviceOrder/configurationItem/**/this/**') {
            before = {
                if (request.method == "DELETE"){
                    params._eventId_deleteRelation = 'deleteRelation'
                    log.debug "here 7"
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }
        
        createStatus(uri: '/serviceOrder/configurationItem/**/status') {
            before = {
                if (request.method == "POST"){
                    params._eventId_createStatus = 'createStatus'
                    log.debug "here 9"
                    redirect(action: 'serviceOrder', params:params)
                }
            }
        }
    }
}