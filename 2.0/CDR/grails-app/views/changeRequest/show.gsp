<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Change Request</title>
</head>
<body>
<div class="body">
    <h1>Show Change Request</h1>
    <div class="nav">
        <span class="menuButton">
            <g:link controller="status" params='["configurationItem.id":params.id]' class="create" action="create">New Status</g:link>
        </span>
        <span class="menuButton">
            <g:link controller="relation" params='["thisCI.id":params.id]' class="create" action="create">New Relation</g:link>
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
                    <td valign="top" class="value">${changeRequest.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${changeRequest.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Author:</td>
                    <td valign="top" class="value">${changeRequest.author}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${changeRequest.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${changeRequest.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Parent:</td>
                    <td valign="top" class="value"><g:link controller="${changeRequest?.parent ? cdr.className(name:changeRequest?.parent?.class?.name) : 'blah'}" action="show" id="${changeRequest?.parent?.id}">${changeRequest?.parent}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Configuration Items:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="c" in="${changeRequest.configurationItems}">
                                <li><g:link controller="${cdr.className(name:c.class.name)}" action="show" id="${c.id}">${c}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="e" in="${changeRequest.environments}">
                                <li><g:link controller="environment" action="show" id="${e.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${changeRequest.statuses}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">This Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${changeRequest.thisRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">That Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${changeRequest.thatRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">File Type:</td>
                    <td valign="top" class="value">${changeRequest.fileType}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">File Name:</td>
                    <td valign="top" class="value"><g:link action="downloadDocument" id="${changeRequest?.id}">${changeRequest.fileName}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Request Type:</td>
                    <td valign="top" class="value"><g:link controller="requestType" action="show" id="${changeRequest?.requestType?.id}">${changeRequest?.requestType}</g:link></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="changeRequest">
            <input type="hidden" name="id" value="${changeRequest?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
