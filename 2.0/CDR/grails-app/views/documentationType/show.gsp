<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Documentation Type</title>
</head>
<body>
<div class="body">
    <h1>Show Documentation Type</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New Documentation Type</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${documentationType.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Documents:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="d" in="${documentationType.documents}">
                                <li><g:link controller="documentation" action="show" id="${d.id}">${d}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="documentationType">
            <input type="hidden" name="id" value="${documentationType?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
