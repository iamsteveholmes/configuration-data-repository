package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.methods.multipart.*

class TestResult extends ConfigurationItem{
    File document
    String category = "testResult"
    TestResultType testResultType

    List getParts(){
        def params = []
        super.params.each{ params << new StringPart(it.name,it.value) }
        if(id) params << new StringPart("id",id)
        if(category) params << new StringPart("category",category)
        if(document) params << new FilePart("document", document.name, document)
        if(testResultType?.id) params << new StringPart("testResultType.id",testResultType.id)
        if(testResultType?.description) params << new StringPart("testResultType.description",testResultType.description)
        return params
    }

    String toString(){
        return "${name}"
    }
}