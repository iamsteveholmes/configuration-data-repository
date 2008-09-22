package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class Network extends ConfigurationItem{
    String internetProtocolAddress
    String macAddress
    String element
    String location
    String category = "network"

    NetworkType networkType

    List getParams(){
        def params = []
        params += super.params
        if(id) params << new NameValuePair("id",id)
        if(category) params << new NameValuePair("category",category)
        if(macAddress) params << new NameValuePair("macAddress",macAddress)
        if(internetProtocolAddress) params << new NameValuePair("internetProtocolAddress",internetProtocolAddress)
        if(element) params << new NameValuePair("element",element)
        if(location) params << new NameValuePair("location",location)
        if(networkType) params << new NameValuePair("networkType.id",networkType.id)
        return params
    }

    String toString(){
        return "${name}"
    }
}