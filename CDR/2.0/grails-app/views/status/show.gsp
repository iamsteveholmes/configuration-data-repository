  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Status</title>
    </head>
    <body>
        <div class="nav">
        </div>
        <div class="body">
            <h1>Show Status</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            <td valign="top" class="value">${status.startDate}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">End Date:</td>
                            <td valign="top" class="value">${status.endDate}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Configuration Item:</td>
                            
                            <td valign="top" class="value"><g:link controller="${status?.configurationItem?.class.name.toString()[0].toLowerCase() + status?.configurationItem?.class.name.toString()[1..status?.configurationItem?.class.name.toString().length() - 1]}" action="show" id="${status?.configurationItem?.id}">${status?.configurationItem}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Status:</td>
                            <td valign="top" class="value">${status?.reference}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="status">
                    <input type="hidden" name="id" value="${status?.id}" />
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
