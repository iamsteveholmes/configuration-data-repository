package com.delegata.cdr.client.util

import org.apache.commons.httpclient.*
import org.apache.commons.httpclient.methods.*

/**
 * User: sholmes
 * Date: Jul 6, 2008
 * Time: 3:04:42 PM
 */
class Get {
    String url
    HttpClient client

    String statusCode
    String responseBody
    String queryString

    void execute() {
        HttpMethod method = new GetMethod()
        method.followRedirects = false
        method.setURI(new URI(this.url, false))
        client.executeMethod(method)
        def locationHeader
        def redirectLocation
        while (locationHeader = method.getResponseHeader("location")) {
            redirectLocation = locationHeader.getValue().tokenize(";")[0]
            method.followRedirects = false
            method.setURI(new URI(redirectLocation, false))
            client.executeMethod(method)
            client.executeMethod(method)
        }

        this.statusCode = method.statusCode
        this.responseBody = method.responseBodyAsString
        this.queryString = method.queryString
        def key = method.queryString.tokenize('=')[1]
        method.releaseConnection()
    }
}