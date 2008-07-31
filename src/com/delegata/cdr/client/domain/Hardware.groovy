package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class Hardware extends ConfigurationItem{
    String id
    String macAddress
    String internetProtocolAddress
    String hostName
    String category = "hardware"
    HardwareType hardwareType

    List getParams(){
        def params = []
        params += super.params
        if(id) params << new NameValuePair("id",id)
        if(category) params << new NameValuePair("category",category)
        if(macAddress) params << new NameValuePair("macAddress",macAddress)
        if(internetProtocolAddress) params << new NameValuePair("internetProtocolAddress",internetProtocolAddress)
        if(hostName) params << new NameValuePair("hostName",hostName)
        if(hardwareType) params << new NameValuePair("hardwareType.id",hardwareType.id)
        return params
    }

    String toString() {
        return "${name}"
    }
}