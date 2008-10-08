<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Role List</title>
</head>
<body>
<div class="body">
    <h1>Role List</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">Assign Role</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
                <tr>
                    <th>Role</th>
                    <th>User</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${jsecUserRoleRelList}" status="i" var="jsecUserRoleRel">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${jsecUserRoleRel.id}">${jsecUserRoleRel.role?.name?.encodeAsHTML()}</g:link></td>

                        <td>${jsecUserRoleRel.user?.username?.encodeAsHTML()}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${JsecUserRoleRel.count()}"/>
    </div>
</div>
</body>
</html>
