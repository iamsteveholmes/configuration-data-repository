<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Assign Role</title>
</head>
<body>
<div class="body">
    <h1>Assign Role</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Role List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${jsecUserRoleRel}">
        <div class="errors">
            <g:renderErrors bean="${jsecUserRoleRel}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save" method="post">
        <div class="dialog">
            <table>
                <tbody>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='user'>User:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: jsecUserRoleRel, field: 'user', 'errors')}'>
                            <g:select optionKey="id" optionValue="username" from="${JsecUser.list()}" name='user.id' value="${jsecUserRoleRel?.user?.id}"></g:select>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='role'>Role:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: jsecUserRoleRel, field: 'role', 'errors')}'>
                            <g:select optionKey="id" optionValue="name" from="${JsecRole.list()}" name='role.id' value="${jsecUserRoleRel?.role?.id}"></g:select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Create"></input></span>
        </div>
    </g:form>
</div>
</body>
</html>
