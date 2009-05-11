<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Network</title>
</head>
<body>
<div class="body">
    <h1>Show Network</h1>
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
                    <td valign="top" class="value">${network.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${network.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Author:</td>
                    <td valign="top" class="value">${network.author}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${network.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${network.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Parent:</td>
                    <td valign="top" class="value"><g:link controller="${network?.parent ? cdr.className(name:network?.parent?.class?.name) : 'blah'}" action="show" id="${network?.parent?.id}">${network?.parent}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Configuration Items:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="c" in="${network.configurationItems}">
                                <li><g:link controller="${cdr.className(name:c.class.name)}" action="show" id="${c.id}">${c}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Environments:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="e" in="${network.environments}">
                                <li><g:link controller="environment" action="show" id="${e.id}">${e}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Statuses:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${network.statuses}">
                                <li><g:link controller="status" action="show" id="${s.id}">${s}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">This Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${network.thisRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">That Relations:</td>
                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="t" in="${network.thatRelations}">
                                <li><g:link controller="relation" action="show" id="${t.id}">${t}</g:link></li>
                            </g:each>
                        </ul>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Internet Protocol Address:</td>
                    <td valign="top" class="value">${network.internetProtocolAddress}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Mac Address:</td>
                    <td valign="top" class="value">${network.macAddress}</td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Element:</td>
                    <td valign="top" class="value">${network.element}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Location:</td>
                    <td valign="top" class="value">${network.location}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Network Type:</td>
                    <td valign="top" class="value"><g:link controller="networkType" action="show" id="${network?.networkType?.id}">${network?.networkType}</g:link></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="network">
            <input type="hidden" name="id" value="${network?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
