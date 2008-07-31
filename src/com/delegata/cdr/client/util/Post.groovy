package com.delegata.cdr.client.util

import org.apache.commons.httpclient.*
import org.apache.commons.httpclient.methods.*

/**
 * User: sholmes
 * Date: Jun 11, 2008
 * Time: 2:21:06 PM
 */
class Post {
    String url
    NameValuePair[] params
    HttpClient client

    String statusCode
    String responseBody
    String queryString

    void execute() {
        HttpMethod method
        method = new PostMethod()
        method.followRedirects = false
        method.setURI(new URI(this.url, false))
        method.requestBody = this.params
        client.executeMethod(method)
        Header locationHeader
        def redirectLocation
        while (locationHeader = method.getResponseHeader("location")) {
            redirectLocation = locationHeader.getValue().tokenize(";")[0]
            method = new GetMethod()
            method.followRedirects = false
            method.setURI(new URI(redirectLocation, false))
            client.executeMethod(method)
        }
        this.statusCode = method.statusCode
        this.responseBody = method.responseBodyAsString
        this.queryString = method.queryString
        method.releaseConnection()
    }
}