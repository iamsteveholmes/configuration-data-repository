<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Documentation</title>
</head>
<body>
<div class="body">
    <h1>Show Documentation</h1>
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
                    <td valign="top" class="value">${documentation.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${documentation.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Author:</td>
                    <td valign="top" class="value">${documentation.author}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${documentation.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${documentation.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Parent:</td>
                    <td valign="top" class="value"><g:link controller="${documentation?.parent ? cdr.className(name:documentation?.parent?.class?.name) : 'blah'}" action="show" id="${documentation?.parent?.id}">${documentation?.parent}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Configuration Items:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="c" in="${documentation.configurationItems}">
                                <li><g:link controller="${cdr.className(name:c.class.name)}" action="show" id="${c.id}">${c}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="e" in="${documentation.environments}">
                                <li><g:link controller="environment" action="show" id="${e.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${documentation.statuses}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">This Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${documentation.thisRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">That Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${documentation.thatRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Doc Version:</td>
                    <td valign="top" class="value">${documentation.docVersion}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">File Type:</td>
                    <td valign="top" class="value">${documentation.fileType}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">File Name:</td>
                    <td valign="top" class="value"><g:link action="downloadDocument" id="${documentation?.id}">${documentation.fileName}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Title:</td>
                    <td valign="top" class="value">${documentation.title}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Abstraction:</td>
                    <td valign="top" class="value">${documentation.abstraction}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Documentation Type:</td>
                    <td valign="top" class="value"><g:link controller="documentationType" action="show" id="${documentation?.documentationType?.id}">${documentation?.documentationType}</g:link></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="documentation">
            <input type="hidden" name="id" value="${documentation?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
