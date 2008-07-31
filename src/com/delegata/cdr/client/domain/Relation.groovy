package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class Relation{
    String id
    RelationReference reference
    ConfigurationItem thisCI
    ConfigurationItem thatCI

    List getParams(){
        def params = []
        if(id) params << new NameValuePair("id",id)
        if(reference?.id) params << new NameValuePair("reference.id",reference.id)
        if(reference?.name) params << new NameValuePair("reference.name",reference.name)
        if(thisCI?.id) params << new NameValuePair("thisCI.id",thisCI.id)
        if(thatCI?.id) params << new NameValuePair("thatCI.id",thatCI.id)
        return params
    }

    String toString() {
        if (thisCI && reference && thatCI) {
            return "${thisCI.name} ${reference.name} ${thatCI.name}"
        } else {
            return ""
        }
    }
}