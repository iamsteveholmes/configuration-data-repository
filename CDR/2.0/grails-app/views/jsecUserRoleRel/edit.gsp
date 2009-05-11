  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Role</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Role</h1>
            <div class="nav">
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                %{--<span class="menuButton"><g:link class="list" action="list">JsecUserRoleRel List</g:link></span>--}%
                <span class="menuButton"><g:link class="create" action="create">New Role</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jsecUserRoleRel}">
            <div class="errors">
                <g:renderErrors bean="${jsecUserRoleRel}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="jsecUserRoleRel" method="post" >
                <input type="hidden" name="id" value="${jsecUserRoleRel?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='user'>User:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:jsecUserRoleRel,field:'user','errors')}'>
                                    <g:hiddenField name='user.id' value="${jsecUserRoleRel?.user?.id}"/>
                                    ${jsecUserRoleRel?.user?.username}
                                    %{--<g:select optionKey="id" from="${JsecUser.list()}" name='user.id' value="${jsecUserRoleRel?.user?.id}" ></g:select>--}%
                                </td>
                            </tr>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='role'>Role:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:jsecUserRoleRel,field:'role','errors')}'>
                                    <g:select optionKey="id" optionValue="name" from="${JsecRole.list()}" name='role.id' value="${jsecUserRoleRel?.role?.id}"/>
                                </td>
                            </tr> 
                        

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
