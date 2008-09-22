package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.methods.multipart.*

class ChangeRequest extends ConfigurationItem{
    File document
    String category = "changeRequest"
    RequestType requestType

    String toString(){
        return "${name}"
    }

    List getParts(){
        def params = []
        super.params.each{ params << new StringPart(it.name,it.value) }
        if(id) params << new StringPart("id",id)
        if(category) params << new StringPart("category",category)
        if(document) params << new FilePart("document", document.name, document)
        if(requestType?.id) params << new StringPart("requestType.id",requestType.id)
        if(requestType?.description) params << new StringPart("requestType.description",requestType.description)
        return params
    }
}