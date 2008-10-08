  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Relation List</title>
    </head>
    <body>
        <div class="body">
            <h1>Relation List</h1>
            <div class="nav">
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <th>This CI</th>
                   	    
                   	        <th>Reference</th>
                   	    
                   	        <th>That CI</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${relationList}" status="i" var="relation">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${relation.id}">${relation.thisCI?.encodeAsHTML()}</g:link></td>
                        
                            <td>${relation.reference?.encodeAsHTML()}</td>
                        
                            <td>${relation.thatCI?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Relation.count()}" />
            </div>
        </div>
    </body>
</html>
