<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Environment List</title>
    </head>
    <body>
        <div class="body">
            <h1>Environment List</h1>
            <div class="nav">
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="Name"/>
                            <g:sortableColumn property="description" title="Description"/>
                            <g:sortableColumn property="ownerName" title="Owner Name"/>
                            <g:sortableColumn property="ownerEmail" title="Owner Email"/>
                            <th>Application</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${environmentList}" status="i" var="environment">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td><g:link action="show" id="${environment.id}">${environment.name?.encodeAsHTML()}</g:link></td>
                                <td>${environment.description?.encodeAsHTML()}</td>
                                <td>${environment.ownerName?.encodeAsHTML()}</td>
                                <td>${environment.ownerEmail?.encodeAsHTML()}</td>
                                <td>${environment.project?.encodeAsHTML()}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Environment.count()}"/>
            </div>
        </div>
    </body>
</html>
