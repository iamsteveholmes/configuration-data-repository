package com.delegata.cdr.client.util

import org.apache.commons.httpclient.*
import org.apache.commons.httpclient.methods.*
import org.apache.commons.httpclient.methods.multipart.*

/**
 * User: sholmes
 * Date: Jul 7, 2008
 * Time: 11:10:14 AM
 */
class MultipartPost {
    String url
    List parts
    HttpClient client

    String statusCode
    String responseBody
    String queryString

    void execute() {
        HttpMethod method
        method = new PostMethod()
        method.followRedirects = false
        method.setURI(new URI(this.url, false))
        method.requestEntity = new MultipartRequestEntity(parts as Part[], method.getParams())
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