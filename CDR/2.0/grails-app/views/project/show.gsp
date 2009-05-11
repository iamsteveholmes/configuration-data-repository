<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Project</title>
</head>
<body>
<div class="body">
    <h1>Show Project</h1>
    <div class="nav">
        <span class="menuButton">
            <g:link controller="environment" params='["project.id":params.id]' class="create" action="create">New Environment</g:link>
        </span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name">Name:</td>
                    <td valign="top" class="value">${project.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${project.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${project.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${project.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="e" in="${project.environments}">
                                <li><g:link controller="environment" action="show" id="${e?.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="project">
            <input type="hidden" name="id" value="${project?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
