<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Hardware</title>
</head>
<body>
<div class="body">
    <h1>Show Hardware</h1>
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
                    <td valign="top" class="value">${hardware.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${hardware.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Author:</td>
                    <td valign="top" class="value">${hardware.author}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${hardware.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${hardware.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Type:</td>
                    <td valign="top" class="value"><g:link controller="hardwareType" action="show" id="${hardware?.hardwareType?.id}">${hardware?.hardwareType}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Parent:</td>
                    <td valign="top" class="value"><g:link controller="${hardware?.parent ? cdr.className(name:hardware?.parent?.class?.name) : 'blah'}" action="show" id="${hardware?.parent?.id}">${hardware?.parent}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Children:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="c" in="${hardware.configurationItems}">
                                <li><g:link controller="${cdr.className(name:c.class.name)}" action="show" id="${c.id}">${c}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="e" in="${hardware.environments}">
                                <li><g:link controller="environment" action="show" id="${e.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="s" in="${hardware.statuses}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s}</g:link> Start: ${s?.startDate} End: ${s?.endDate}</li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">This Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="t" in="${hardware.thisRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">That Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul class="subItems">
                            <g:each var="t" in="${hardware.thatRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Mac Address:</td>
                    <td valign="top" class="value">${hardware.macAddress}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Host Name:</td>
                    <td valign="top" class="value">${hardware.hostName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">IP Address:</td>
                    <td valign="top" class="value">${hardware.internetProtocolAddress}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Purchase Date:</td>
                    <td valign="top" class="value">${hardware.purchaseDate}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="hardware">
            <input type="hidden" name="id" value="${hardware?.id}"/>
            <input type="hidden" name="parent.id" value="${hardware?.parent?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
