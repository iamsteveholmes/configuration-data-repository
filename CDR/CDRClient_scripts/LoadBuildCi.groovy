import com.delegata.cdr.client.util.*
import com.delegata.cdr.client.domain.*
import groovy.util.slurpersupport.GPathResult

/**
 * User: sholmes
 * Date: Jul 9, 2008
 * Time: 10:06:54 AM
 */
def root = "http://solutions.delegata.com:8085/CDR"

def username = "admin"
def password = "changeit"

def projectName = "APS"
def environmentName = "Production"

def buildCiName = "build"
def buildCiCategory = "software"
def buildCiType = "Application"
def buildCiStatusName = "Active"
def buildCiRetiringStatusName = "Retired"

CDRClient client = new CDRClient(root: root)

client.authenticate(username, password)
client.getConfigurationItem(new Software(name: buildCiName, category: buildCiCategory), environmentName, projectName, buildCiStatusName, buildCiType)
println client.body
GPathResult build = new XmlSlurper().parseText(client.body)
client.startServiceOrder()
println client.body
client.createStatus(new Status(configurationItem: new Software(id: build.@id), reference: new StatusReference(name: buildCiRetiringStatusName, description: buildCiRetiringStatusName)), 0)
println client.body
def newBuild = new Software(name: build['name'].toString(),
        description: build.description,
        author: build.author,
        ownerName: build.ownerName,
        ownerEmail: build.ownerEmail,
        parent: new ConfigurationItem(id: build['parent'].@id),
        versionNum: build.versionNum,
        port: build.port,
        releaseNum: build.releaseNum,
        softwareType: new SoftwareType(id: build.softwareType.@id),
        environmentName: environmentName,
        projectName: projectName)
client.createConfigurationItem(newBuild)
println client.body
println "build.thisRelations.size(): ${build.thisRelations.size()}"
build.thisRelations.relation.each {
    println "this relation: $it"
    client.createRelation(new Relation(thatCI: new ConfigurationItem(id: "${it.thatCI.@id}"), reference: new RelationReference(name: it.reference.name)), 0)
    println client.body
}
println "build.thatRelations.size(): ${build.thatRelations.size()}"
build.thatRelations.relation.each {
    println "that relation: $it"
    client.createRelation(new Relation(thisCI: new ConfigurationItem(id: "${it.thisCI.@id}"), reference: new RelationReference(name: it.reference.name)), 0)
    println client.body
}
client.createStatus(new Status(reference: new StatusReference(name: buildCiStatusName, description: buildCiStatusName)), 0)
println client.body
client.persistServiceOrder()
println client.body

