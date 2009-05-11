  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>User List</title>
    </head>
    <body>
        <div class="body">
            <h1>User List</h1>
            <div class="nav">%{----}%
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="username" title="Username" />
                        
                   	        %{--<g:sortableColumn property="passwordHash" title="Password Hash" />--}%
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jsecUserList}" status="i" var="jsecUser">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td><g:link action="show" id="${jsecUser.id}">${jsecUser.id?.encodeAsHTML()}</g:link></td>--}%
                        
                            <td><g:link action="show" id="${jsecUser.id}">${jsecUser.username?.encodeAsHTML()}</g:link></td>
                        
                            %{--<td>${jsecUser.passwordHash?.encodeAsHTML()}</td>--}%
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${JsecUser.count()}" />
            </div>
        </div>
    </body>
</html>
