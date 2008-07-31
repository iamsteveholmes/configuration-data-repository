import com.delegata.cdr.client.util.*
import com.delegata.cdr.client.domain.*

/**
 * User: sholmes
 * Date: Jul 8, 2008
 * Time: 11:38:40 AM
 */
def root = "http://solutions.delegata.com:8086/CDR"

def username = "admin"
def password = "changeit"

def projectName = "APS"
def environmentName = "Testing"


def buildCiName = "build"
def buildCiCategory = "software"
def buildCiType = "Application"
def buildCiStatusName = "Active"

def requirementCiName = "Requirements Document"
def requirementCiAuthor = "Steve the man"
def requirementCiType = "Requirements"
def requirementFileAddress = "/export/home/tomcat/tools/CDRClient/requirements.txt"
def requirementStatus = "Active"

def relationType = "baselines"

CDRClient client = new CDRClient(root:root)
client.authenticate(username,password)
client.getConfigurationItem(new Software(name:buildCiName, category:buildCiCategory),environmentName,projectName,buildCiStatusName, buildCiType)
println client.body
def build = new XmlSlurper().parseText(client.body)
client.startServiceOrder()
client.createConfigurationItemDocumentType(new ChangeRequest(requestType: new RequestType(description:requirementCiType), name:requirementCiName,author:requirementCiAuthor,document: new File(requirementFileAddress)))
println client.body
client.createRelation(new Relation(thatCI: new ConfigurationItem(id:"${build.@id}"), reference: new RelationReference(name:relationType, description:relationType)),0)
println client.body
client.createStatus(new Status( reference: new StatusReference(name:requirementStatus, description:requirementStatus)),0)
client.persistServiceOrder()
