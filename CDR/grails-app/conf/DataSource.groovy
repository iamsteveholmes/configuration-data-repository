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
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
        }
    }

    test {
        dataSource {
            /*pooled = false
            dbCreate = "create-drop"
            driverClassName = "oracle.jdbc.OracleDriver"
            jndiName = "java:comp/env/jdbc/cdr"
*/
            pooled = false
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
        }
    }

    production {
        dataSource {
            dbCreate = "update"
            driverClassName = "oracle.jdbc.OracleDriver"
            jndiName = "java:comp/env/jdbc/cdr"
        }
    }
}