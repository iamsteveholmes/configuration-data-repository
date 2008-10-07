<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Software</title>
</head>
<body>
<div class="body">
    <h1>Show Software</h1>
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
                    <td valign="top" class="value">${software.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${software.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Author:</td>
                    <td valign="top" class="value">${software.author}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${software.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${software.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Parent:</td>
                    <td valign="top" class="value"><g:link controller="${software?.parent ? cdr.className(name:software?.parent?.class?.name) : 'blah'}" action="show" id="${software?.parent?.id}">${software?.parent}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Configuration Items:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="c" in="${software.configurationItems}">
                                <li><g:link controller="${cdr.className(name:c.class.name)}" action="show" id="${c.id}">${c}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="e" in="${software.environments}">
                                <li><g:link controller="environment" action="show" id="${e.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${software.statuses.sort{a,b -> b.endDate <=> a.endDate}}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">This Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${software.thisRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">That Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${software.thatRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Version Num:</td>
                    <td valign="top" class="value">${software.versionNum}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Port:</td>
                    <td valign="top" class="value">${software.port}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Release:</td>
                    <td valign="top" class="value">${software.releaseNum}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Software Type:</td>
                    <td valign="top" class="value"><g:link controller="softwareType" action="show" id="${software?.softwareType?.id}">${software?.softwareType}</g:link></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="software">
            <input type="hidden" name="id" value="${software?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
