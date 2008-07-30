
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Create User</title>
    </head>
    <body>
        <div class="body">
            <h1>Create User</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jsecUser}">
                <div class="errors">
                    <g:renderErrors bean="${jsecUser}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='username'>Username:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:jsecUser,field:'username','errors')}'>
                            <input type="text" id='username' name='username' value="${fieldValue(bean:jsecUser,field:'username')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='passwordHash'>Password:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:jsecUser,field:'passwordHash','errors')}'>
                            <input type="text" id='passwordHash' name='passwordHash' value="${fieldValue(bean:jsecUser,field:'passwordHash')}"/>
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
