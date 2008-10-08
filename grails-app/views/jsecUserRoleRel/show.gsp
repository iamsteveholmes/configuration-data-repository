<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Role Assignment</title>
</head>
<body>
<div class="body">
    <h1>Show Role Assignment</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">Assign Role</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name">User:</td>
                    <td valign="top" class="value"><g:link controller="jsecUser" action="show" id="${jsecUserRoleRel?.user?.id}">${jsecUserRoleRel?.user?.username}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Role:</td>
                    <td valign="top" class="value"><g:link controller="jsecRole" action="show" id="${jsecUserRoleRel?.role?.id}">${jsecUserRoleRel?.role?.name}</g:link></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="jsecUserRoleRel">
            <input type="hidden" name="id" value="${jsecUserRoleRel?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
