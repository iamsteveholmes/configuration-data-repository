  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Status Reference List</title>
    </head>
    <body>
        <div class="body">
            <h1>Status Reference List</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="create" action="create">New Status Reference</g:link></span>
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
                    <g:each in="${statusReferenceList}" status="i" var="statusReference">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${statusReference.id}">${statusReference.name?.encodeAsHTML()}</g:link></td>
                            <td>${statusReference.description?.encodeAsHTML()}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${StatusReference.count()}" />
            </div>
        </div>
    </body>
</html>
