
class JasperGrailsPlugin {
    def version = "0.7.6.1"
    def author = "Marcos Pereira"
    def authorEmail = "mfpereira@gmail.com"
    def title = "This plugin adds easy support for jasper format reports."
    def description = '''
	With Jasper Plugin the developer can easily put jasper reports into an application.
    '''
    //def documentation = "http://grails.org/Jasper+plugin"
    def dependsOn = [:]
	
    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }
   
    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)		
    }

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional)
    }
	                                      
    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }
	
    def onChange = { event ->
        // TODO Implement code that is executed when this class plugin class is changed  
        // the event contains: event.application and event.applicationContext objects
    }
                                                                                  
    def onApplicationChange = { event ->
        // TODO Implement code that is executed when any class in a GrailsApplication changes
        // the event contain: event.source, event.application and event.applicationContext objects
    }
}
