package com.delegata.cdr.client.domain

import org.apache.commons.httpclient.NameValuePair

class RequestType{
    String id
    String description
    String type = 'Change Request'
    String category = "changeRequest"
    Set requests

    String toString(){
        return "${description}"
    }
}