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

    /*public void setOwnerEmail(String ownerEmail){
        this.ownerEmail = ownerEmail.replace('%40','@')
    }

    public String getOwnerEmail(){
        return ownerEmail.replace('%40','@')
    }*/
    
    Set configurationItems
    Set environments
    Set statuses
    List thisRelations = []
    List thatRelations = []

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