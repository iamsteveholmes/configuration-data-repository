import org.apache.commons.httpclient.*
import com.delegata.cdr.client.util.*
import com.delegata.cdr.client.domain.*
import org.apache.commons.httpclient.methods.multipart.StringPart

/**
 * User: sholmes
 * Date: Jun 11, 2008
 * Time: 2:47:22 PM
 */
HttpClient client = new HttpClient();
NameValuePair[] params = [
        new NameValuePair("action", "/CDR/auth/signIn/loginform"),
        new NameValuePair("username", "admin"),
        new NameValuePair("password", "changeit")
]
new Post(client: client, url:'http://localhost:8080/CDR/auth/signIn', params:params).execute()

def get = new Get(client: client, url:'http://localhost:8080/CDR/serviceOrder')
get.execute()
key = get.queryString.tokenize('=')[1]
//Hardware hardware = new Hardware(hardwareType: new HardwareType(id:"1"), name:"dopey",author:"sneezy")
//def data = hardware.params << new NameValuePair("_flowExecutionKey", key)
//params = data as NameValuePair[]
Documentation document = new Documentation(documentationType: new DocumentationType(id:"11"), name:"dopey",author:"sneezy",document: new File("CDRClient.ipr"))
def post = new MultipartPost(client: client, url:'http://localhost:8080/CDR/serviceOrder/configurationItem', parts:(document.parts << new StringPart("_flowExecutionKey", key)))
post.execute()
key = post.queryString.tokenize('=')[1]

params = [new NameValuePair("_flowExecutionKey", key)]
post = new Post(client: client, url:'http://localhost:8080/CDR/serviceOrder', params:params)
post.execute()
println post.responseBody
