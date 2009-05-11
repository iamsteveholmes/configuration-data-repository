  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Hardware Type</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Hardware Type</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="list" action="list">Hardware Type List</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${hardwareType}">
            <div class="errors">
                <g:renderErrors bean="${hardwareType}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="hardwareType" method="post" >
                <input type="hidden" name="id" value="${hardwareType?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:hardwareType,field:'description','errors')}'>
                                    <input type="text" id='description' name='description' value="${fieldValue(bean:hardwareType,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='hardwares'>Hardwares:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:hardwareType,field:'hardwares','errors')}'>
                                    
<ul>
<g:each var='h' in='${hardwareType?.hardwares?}'>
    <li><g:link controller='hardware' action='show' id='${h.id}'>${h}</g:link></li>
</g:each>
</ul>
<g:link controller='hardware' params='["hardwareType.id":hardwareType?.id]' action='create'>Add Hardware</g:link>

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
