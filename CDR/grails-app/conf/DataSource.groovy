hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            pooled = false
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
        }
    }

  integration {
        dataSource {
            pooled = false
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            driverClassName = "oracle.jdbc.OracleDriver"
            username = System.getProperty("ds.username")
            password = System.getProperty("ds.password")
            if(!password){
                password = ""
            }
            if(!username){
                username = ""
            }
            url = System.getProperty("ds.url")
            dialect="org.hibernate.dialect.Oracle10gDialect"
        }
    }

    test {
        dataSource {
            pooled = false
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            driverClassName = "oracle.jdbc.OracleDriver"
            username = System.getProperty("ds.username")
            password = System.getProperty("ds.password")
            if(!password){
                password = ""
            }
            if(!username){
                username = ""
            }
            url = System.getProperty("ds.url")
            dialect="org.hibernate.dialect.Oracle10gDialect"
        }
    }

    production {
        dataSource {
            pooled = false
            dbCreate = "update"
            driverClassName = "oracle.jdbc.OracleDriver"
            username = System.getProperty("ds.username")
            password = System.getProperty("ds.password")
            if(!password){
                password = ""
            }
            if(!username){
                username = ""
            }
            url = System.getProperty("ds.url")
            dialect="org.hibernate.dialect.Oracle10gDialect"
        }
    }
}