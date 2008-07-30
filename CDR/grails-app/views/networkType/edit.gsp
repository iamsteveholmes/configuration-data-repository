  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Network Type</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Network Type</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="list" action="list">Network Type List</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${networkType}">
            <div class="errors">
                <g:renderErrors bean="${networkType}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="networkType" method="post" >
                <input type="hidden" name="id" value="${networkType?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:networkType,field:'description','errors')}'>
                                    <input type="text" id='description' name='description' value="${fieldValue(bean:networkType,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='networks'>Networks:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:networkType,field:'networks','errors')}'>
                                    
<ul>
<g:each var='n' in='${networkType?.networks?}'>
    <li><g:link controller='network' action='show' id='${n.id}'>${n}</g:link></li>
</g:each>
</ul>
<g:link controller='network' params='["networkType.id":networkType?.id]' action='create'>Add Network</g:link>

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
