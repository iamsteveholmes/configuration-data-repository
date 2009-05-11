  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Status</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list">Status List</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Status</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${status}">
            <div class="errors">
                <g:renderErrors bean="${status}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="status" method="post" >
                <input type="hidden" name="id" value="${status?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='startDate'>Start Date:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:status,field:'startDate','errors')}'>
                                    <g:datePicker name='startDate' value="${status?.startDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='endDate'>End Date:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:status,field:'endDate','errors')}'>
                                    <g:datePicker name='endDate' value="${status?.endDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='configurationItem'>Configuration Item:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:status,field:'configurationItem','errors')}'>
                                    <g:select optionKey="id" from="${ConfigurationItem.list()}" name='configurationItem.id' value="${status?.configurationItem?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='reference'>Status:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:status,field:'reference','errors')}'>
                                    <g:select optionKey="id" from="${StatusReference.list()}" name='reference.id' value="${status?.reference?.id}" ></g:select>
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
