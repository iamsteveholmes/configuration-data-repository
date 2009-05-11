<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Hardware List</title>
    </head>
    <body>
        <div class="body">
            <h1>Hardware List</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="create" action="create">New Hardware</g:link></span>
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

                            <g:sortableColumn property="author" title="Author"/>

                            <g:sortableColumn property="ownerName" title="Owner Name"/>

                            <g:sortableColumn property="ownerEmail" title="Owner Email"/>

                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${hardwareList}" status="i" var="hardware">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${hardware.id}">${hardware.name?.encodeAsHTML()}</g:link></td>

                                <td>${hardware.description?.encodeAsHTML()}</td>

                                <td>${hardware.author?.encodeAsHTML()}</td>

                                <td>${hardware.ownerName?.encodeAsHTML()}</td>

                                <td>${hardware.ownerEmail?.encodeAsHTML()}</td>

                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Hardware.count()}"/>
            </div>
        </div>
    </body>
</html>
