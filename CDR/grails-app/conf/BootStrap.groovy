//import org.apache.commons.codec.digest.DigestUtils

class BootStrap {

    def init = {servletContext ->
        def adminRole = JsecRole.findByName("Administrator")
        if (!adminRole) {
            adminRole = new JsecRole(name: 'Administrator')
            adminRole.save()
        }

        def observerRole = JsecRole.findByName('Observer')
        if (!observerRole) {
            observerRole = new JsecRole(name: 'Observer')
            observerRole.save()
        }

        // Create some users
        // Note that we store a hash of the user's password,
        // not the password itself.
        def admin = JsecUser.findByUsername('admin')
        if (!admin) {
            //admin = new JsecUser(username: 'admin', passwordHash: DigestUtils.shaHex('changeit'))
            admin = new JsecUser(username: 'admin', passwordHash: new org.jsecurity.crypto.hash.Sha1Hash('changeit').toHex())
            admin.save()
            new JsecUserRoleRel(user: admin, role: adminRole).save()
            new JsecUserRoleRel(user: admin, role: observerRole).save()
        }

        def tarzan = JsecUser.findByUsername("tarzan")
        if (!tarzan) {
            tarzan = new JsecUser(username: 'tarzan', passwordHash: new org.jsecurity.crypto.hash.Sha1Hash('password').toHex())
            //tarzan = new JsecUser(username: 'tarzan', passwordHash: DigestUtils.shaHex('password'))
            tarzan.save()
            new JsecUserRoleRel(user: tarzan, role: observerRole).save()
        }

        def references = RelationReference.findByName("depends on")
        if (!references) {
            new RelationReference(name: "depends on", description: "depends on").save()
            new RelationReference(name: "exists in", description: "exists in").save()
            new RelationReference(name: "documents", description: "is documented by").save()
            new RelationReference(name: "BOM", description: "exclusively owned by").save()
            new RelationReference(name: "is installed on", description: "is installed on").save()
            new RelationReference(name: "baselines", description: "baselines").save()
            new RelationReference(name: "certifies", description: "certifies").save()
            new RelationReference(name: "is prepared by", description: "is prepared by").save()
            new RelationReference(name: "is configured by", description: "is configured by").save()
            new RelationReference(name: "tests", description: "tests").save()

            new StatusReference(name: "Planned", description: "Planned").save()
            new StatusReference(name: "Implemented", description: "Implemented").save()
            def active = new StatusReference(name: "Active", description: "Active").save()
            new StatusReference(name: "Inactive", description: "Inactive").save()
            new StatusReference(name: "Removed", description: "Removed").save()
            new StatusReference(name: "Retired", description: "Retired").save()

            Project aps = new Project(name: "APS").save()

            def testing = new Environment(name: "Testing", project: aps).save()
            def staging = new Environment(name: "Staging", project: aps).save()
            def production = new Environment(name: "Production", project: aps).save()


            def server = new HardwareType(description: 'Server').save(flush: true)
            def os = new SoftwareType(description: 'Operating System').save(flush: true)
            new SoftwareType(description: 'Patch Level').save(flush: true)
            new SoftwareType(description: 'Database Server').save(flush: true)
            new SoftwareType(description: 'Application Server').save(flush: true)
            new SoftwareType(description: 'Web Server').save(flush: true)
            def application = new SoftwareType(description: 'Application').save(flush: true)
            new SoftwareType(description: 'Database Schema').save(flush: true)
            new SoftwareType(description: 'Script').save(flush: true)
            def networkType = new NetworkType(description: 'Network').save(flush: true)
            def documentationType = new DocumentationType(description: 'asdfasdf').save(flush: true)
            new RequestType(description: 'Requirements').save(flush: true)
            new TestResultType(description: 'Unit').save(flush: true)
            new TestResultType(description: 'Acceptance').save(flush: true)
            new TestResultType(description: 'Functional').save(flush: true)

            new Hardware(
                    name: "Solutions",
                    author: "Steve Holmes",
                    purchaseDate: new Date(),
                    hardwareType: server).save(flush: true)
            new Hardware(
                    name: "Isis",
                    author: "Steve Holmes",
                    purchaseDate: new Date(),
                    hardwareType: server).save(flush: true)

            def startDate = new Date() - 10
            (1..10).each {element ->
                new Status(
                        startDate: startDate,
                        endDate: startDate + 10000,
                        configurationItem: new Hardware(
                                name: "hardware${element}",
                                author: "Steve Holmes",
                                purchaseDate: new Date(),
                                hardwareType: server).save(flush: true),
                        reference: active).save(flush: true)
            }

            testing.configurationItems = Hardware.getAll()
            testing.save(flush: true)
            def hardwares = Hardware.getAll()
            hardwares.each {hardware ->
                (11..15).each {element ->
                    new Status(
                            startDate: startDate,
                            endDate: startDate + 10000,
                            configurationItem: new Hardware(
                                    name: "hardware ${element} ${hardware.id}",
                                    author: "Steve Holmes",
                                    purchaseDate: new Date(),
                                    hardwareType: server,
                                    parent: hardware).save(flush: true),
                            reference: active).save(flush: true)
                }
            }

            def windows = new Software(
                    name: "Windows XP Professional",
                    author: "Steve Holmes",
                    softwareType: os)
            if (!windows.save(flush: true)) {
                windows.errors.each {error -> log.debug error}
            }

            def build = new Software(
                    name: "build",
                    author: "Steve Holmes",
                    softwareType: application)
            if (!build.save(flush: true)) {
                build.errors.each {error -> log.debug error}
            }

            testing.configurationItems << build
            testing.save(flush:true)

            def stagingBuild = new Software(
                    name: "build",
                    description: "Staging Build",
                    author: "Steve Holmes",
                    softwareType: application)
            if (!build.save(flush: true)) {
                build.errors.each {error -> log.debug error}
            }
            staging.configurationItems = [stagingBuild]
            staging.save(flush:true)

            def productionBuild = new Software(
                    name: "build",
                    description: "Production Build",
                    author: "Steve Holmes",
                    softwareType: application)
            if (!build.save(flush: true)) {
                build.errors.each {error -> log.debug error}
            }

            production.configurationItems = [productionBuild]
            production.save(flush:true)

            new Status(startDate: startDate,endDate: startDate + 10000, configurationItem: build, reference:active).save(flush:true)
            new Status(startDate: startDate,endDate: startDate + 10000, configurationItem: stagingBuild, reference:active).save(flush:true)
            new Status(startDate: startDate,endDate: startDate + 10000, configurationItem: productionBuild, reference:active).save(flush:true)


            new Network(name: 'network 1', author: "Steve Holmes", networkType: networkType).save(flush: true)

            new Documentation(
                    name: 'Document 1',
                    author: 'Steve Holmes',
                    version: 1,
                    fileType: 'what',
                    fileName: 'ever',
                    documentationType: documentationType).save(flush: true)
        }
    }

    def destroy = {
    }
} 