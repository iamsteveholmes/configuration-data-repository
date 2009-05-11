  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Relation Reference List</title>
    </head>
    <body>
        <div class="body">
            <h1>Relation Reference List</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="create" action="create">New Relation Reference</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${relationReferenceList}" status="i" var="relationReference">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${relationReference.id}">${relationReference.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${relationReference.description?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${RelationReference.count()}" />
            </div>
        </div>
    </body>
</html>
