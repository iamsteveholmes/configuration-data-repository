package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class Software extends ConfigurationItem{
    String id
    String versionNum
    String port
    String releaseNum
    String category = "software"
    SoftwareType softwareType

    List getParams(){
        def params = []
        params += super.params
        if(id) params << new NameValuePair("id",id)
        if(category) params << new NameValuePair("category",category)
        if(versionNum) params << new NameValuePair("versionNum",versionNum)
        if(port) params << new NameValuePair("port",port)
        if(releaseNum) params << new NameValuePair("releaseNum",releaseNum)
        if(softwareType?.id) params << new NameValuePair("softwareType.id",softwareType.id)
        return params
    }

    String toString(){
        return "${name}"
    }
}