  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Test Result List</title>
    </head>
    <body>
        <div class="body">
            <h1>Test Result List</h1>
            <div class="nav">%{----}%
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                <span class="menuButton"><g:link class="create" action="create">New Test Result</g:link></span>
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
                    <g:each in="${testResultList}" status="i" var="testResult">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td><g:link action="show" id="${testResult.id}">${testResult.id?.encodeAsHTML()}</g:link></td>--}%
                        
                            <td><g:link action="show" id="${testResult.id}">${testResult.name?.encodeAsHTML()}</g:link></td>
                        
                            <td>${testResult.description?.encodeAsHTML()}</td>
                        
                            <td>${testResult.author?.encodeAsHTML()}</td>
                        
                            <td>${testResult.ownerName?.encodeAsHTML()}</td>
                        
                            <td>${testResult.ownerEmail?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${TestResult.count()}" />
            </div>
        </div>
    </body>
</html>
