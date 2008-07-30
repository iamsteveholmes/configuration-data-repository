  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Hardware Type List</title>
    </head>
    <body>
        <div class="body">
            <h1>Hardware Type List</h1>
            <div class="nav">%{----}%
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                <span class="menuButton"><g:link class="create" action="create">New Hardware Type</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${hardwareTypeList}" status="i" var="hardwareType">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${hardwareType.id}">${hardwareType.description?.encodeAsHTML()}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${HardwareType.countByType('Hardware')}" />
            </div>
        </div>
    </body>
</html>
