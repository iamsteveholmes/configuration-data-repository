class UrlMappings {
    static mappings = {
        /*"/hardwares/$id?"{
            controller = 'hardware'
            action = [GET:'showRest', PUT:"updateRest", DELETE:"deleteRest", POST:"saveRest"]
        }*/
        "/"(controller: "project")

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        /* SERVICES */
        "/serviceOrder" (controller:'serviceOrder',action:'serviceOrder')

        "/serviceOrder/configurationItem" (controller:'serviceOrder', action:'serviceOrder')

        "/serviceOrder/configurationItem/$ciListId" (controller:'serviceOrder', action:'serviceOrder')

        "/serviceOrder/configurationItem/$ciListId/this" (controller:'serviceOrder', action:'serviceOrder')

        "/serviceOrder/configurationItem/$ciListId/this/$id" (controller:'serviceOrder', action:'serviceOrder')

        "/serviceOrder/configurationItem/$ciListId/status" (controller:'serviceOrder', action:'serviceOrder')

        "/relationReference" (controller:'relationReference',action:'referenceList')

        "/statusReference" (controller:'statusReference',action:'referenceList')

        "/configurationItem/$category" (controller:'configurationItem', action:'ciList')

        "/configurationItemType/$category" (controller:'configurationItemType', action:'ciTypeList')
    }
}