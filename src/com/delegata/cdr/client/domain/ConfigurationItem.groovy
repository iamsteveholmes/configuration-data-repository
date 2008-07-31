package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class ConfigurationItem {
    String id
    String name
    String description
    String author
    String ownerName
    String ownerEmail
    String environmentName
    String projectName
    ConfigurationItem parent


    Set configurationItems
    Set environments
    Set statuses
    Set thisRelations
    Set thatRelations

    List getParams(){
        def params = []
        if(name) params << new NameValuePair("name",name)
        if(description) params << new NameValuePair("description",description)
        if(author) params << new NameValuePair("author",author)
        if(ownerName) params << new NameValuePair("ownerName",ownerName)
        if(ownerEmail) params << new NameValuePair("ownerEmail",ownerEmail)
        if(environmentName) params << new NameValuePair("environmentName",environmentName)
        if(projectName) params << new NameValuePair("projectName",projectName)
        return params
    }

    String toString() {
        return "${name}"
    }
}