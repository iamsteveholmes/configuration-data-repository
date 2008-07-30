<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Software List</title>
</head>
<body>
<div class="body">
    <h1>Software List</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New Software</g:link></span>
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
                <g:each in="${softwareList}" status="i" var="software">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${software.id}">${software.name?.encodeAsHTML()}</g:link></td>
                        <td>${software.description?.encodeAsHTML()}</td>
                        <td>${software.author?.encodeAsHTML()}</td>
                        <td>${software.ownerName?.encodeAsHTML()}</td>
                        <td>${software.ownerEmail?.encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${Software.count()}"/>
    </div>
</div>
</body>
</html>
