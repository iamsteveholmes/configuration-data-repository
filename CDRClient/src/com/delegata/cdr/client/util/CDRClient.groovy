package com.delegata.cdr.client.util

import org.apache.commons.httpclient.*
import com.delegata.cdr.client.domain.*
import org.apache.commons.httpclient.methods.multipart.StringPart

/**
 * User: sholmes
 * Date: Jul 6, 2008
 * Time: 3:50:41 PM
 */
class CDRClient {
    HttpClient client = new HttpClient()
    def root
    def key
    def body

    void startServiceOrder(){
        Get get = new Get(url: "${root}/serviceOrder",client:client)
        get.execute()
        this.body = get.responseBody
        this.key = get.queryString.tokenize('=')[1]
    }

    void persistServiceOrder(){
        def params = new NameValuePair("_flowExecutionKey", key)
        Post post = new Post(url:"${root}/serviceOrder",client:client, params: params)
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1]
    }

    void authenticate(String username, String password){
        NameValuePair[] params = [
        new NameValuePair("action", "/CDR/auth/signIn"),
        new NameValuePair("username", username),
        new NameValuePair("password", password)
]
        Post post = new Post(client: client, url:"${root}/auth/signIn", params:params)
        post.execute()
        this.body = post.responseBody
    }

    void signOut(){
        NameValuePair[] params = [
        new NameValuePair("action", "/CDR/auth/signOut"),
]
        Post post = new Post(client: client, url:"${root}/auth/signOut", params:params)
        post.execute()
        this.body = post.responseBody
    }

    void cancelServiceOrder(){
        //Delete
    }

    void createConfigurationItem(ConfigurationItem ci){
        def post = new Post(client: client, url:"${root}/serviceOrder/configurationItem", params:(ci.params << new NameValuePair("_flowExecutionKey", key)))
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1]
    }

    void createConfigurationItemDocumentType(ConfigurationItem ci){
        def post = new MultipartPost(client: client, url:"${root}/serviceOrder/configurationItem", parts:(ci.parts << new StringPart("_flowExecutionKey", key)))
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1]
    }

    void addConfigurationItem(ConfigurationItem ci){
        //
    }

    void createRelation(Relation relation, def ciListId){
        def post = new Post(client: client, url:"${root}/serviceOrder/configurationItem/$ciListId/this", params:(relation.params << new NameValuePair("_flowExecutionKey", key)))
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1]
    }
	
	void createRelation(Relation relation){
        def post = new Post(client: client, url:"${root}/serviceOrder/configurationItem/0/this", params:(relation.params << new NameValuePair("_flowExecutionKey", key)))
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1]
    }

    void createStatus(Status status, def ciListId){
        def post = new Post(client: client, url:"${root}/serviceOrder/configurationItem/$ciListId/status", params:(status.params << new NameValuePair("_flowExecutionKey", key)))
        post.execute()
        this.body = post.responseBody
        this.key = post.queryString.tokenize('=')[1] 
    }

    void deleteRelation(Relation relation){
        //
    }

    def getConfigurationItem(def ci, String environmentName, String projectName, String status, String typeName){
        Get get = new Get(url: "${root}/configurationItem/${ci.category}?name=${ci.name}&environment.name=${environmentName}&project.name=${projectName}&status.reference.name=${status}&ciType.name=${typeName}",client:client)
        get.execute()
        this.body = get.responseBody
        this.key = get.queryString.tokenize('=')[1]
    }

    def getConfigurationItemType(def ciType){
        //  
    }

    RelationReference getRelationReference(RelationReference relationReference){
        //
    }

    StatusReference getStatusReference(StatusReference statusReference){
        //
    }
}