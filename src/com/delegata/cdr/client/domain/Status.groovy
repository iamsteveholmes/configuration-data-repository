package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class Status{
    String id
    Date startDate
    Date endDate
    ConfigurationItem configurationItem
    StatusReference reference

    List getParams(){
        def params = []
        if(id) params << new NameValuePair("id",id)
        if(configurationItem) params << new NameValuePair("configurationItem.id",configurationItem.id)
        if(reference?.id) params << new NameValuePair("reference.id",reference.id)
        if(reference?.name) params << new NameValuePair("reference.name",reference.name)
        if(reference?.description) params << new NameValuePair("reference.description",reference.description)
        return params
    }

    String toString() {
        if (reference) {
            return "${reference.name}"
        } else {
            return ""
        }
    }
}