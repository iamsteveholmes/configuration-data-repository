  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Network List</title>
    </head>
    <body>
        <div class="body">
            <h1>Network List</h1>
            <div class="nav">%{----}%
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                <span class="menuButton"><g:link class="create" action="create">New Network</g:link></span>
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
                        
                   	        <g:sortableColumn property="author" title="Author" />
                        
                   	        <g:sortableColumn property="ownerName" title="Owner Name" />
                        
                   	        <g:sortableColumn property="ownerEmail" title="Owner Email" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${networkList}" status="i" var="network">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td><g:link action="show" id="${network.id}">${network.id?.encodeAsHTML()}</g:link></td>--}%
                        
                            <td><g:link action="show" id="${network.id}">${network.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${network.description?.encodeAsHTML()}</td>
                        
                            <td>${network.author?.encodeAsHTML()}</td>
                        
                            <td>${network.ownerName?.encodeAsHTML()}</td>
                        
                            <td>${network.ownerEmail?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Network.count()}" />
            </div>
        </div>
    </body>
</html>
