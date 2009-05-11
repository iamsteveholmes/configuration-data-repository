<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Status Reference</title>
</head>
<body>
<div class="body">
    <h1>Show Status Reference</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New Status Reference</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name">Name:</td>
                    <td valign="top" class="value">${statusReference.name}</td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${statusReference.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${statusReference.statuses}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s.configurationItem.name}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="statusReference">
            <input type="hidden" name="id" value="${statusReference?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
