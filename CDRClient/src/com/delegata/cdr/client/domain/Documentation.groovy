package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.methods.multipart.*

class Documentation extends ConfigurationItem {
    File document
    String title
    String abstraction
    String category = "documentation"
    DocumentationType documentationType

    List getParts(){
        def params = []
        super.params.each{ params << new StringPart(it.name,it.value) }
        if(id) params << new StringPart("id",id)
        if(category) params << new StringPart("category",category)
        if(document) params << new FilePart("document", document.name, document)
        if(title) params << new StringPart("title",title)
        if(abstraction) params << new StringPart("abstraction",abstraction)
        if(documentationType?.id) params << new StringPart("documentationType.id",documentationType.id)
        if(documentationType?.description) params << new StringPart("documentationType.description",documentationType.description)

        return params
    }

    String toString() {
        return "${name}"
    }
}