<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show Environment</title>
</head>
<body>
<div class="body">
    <h1>Show Environment</h1>
    <div class="nav">
        <span class="menuButton">
            <g:link id="${environment.id}" class="create" action="addRelation">Add Configuration Item</g:link>
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
                    <td valign="top" class="value">${environment.name}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Description:</td>
                    <td valign="top" class="value">${environment.description}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Name:</td>
                    <td valign="top" class="value">${environment.ownerName}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Owner Email:</td>
                    <td valign="top" class="value">${environment.ownerEmail}</td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Application:</td>
                    <td valign="top" class="value"><g:link controller="project" action="show" id="${environment.project?.id}">${environment.project}</g:link></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Hardware:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <div>
                        <ul class="subItems">
                            <g:each var="item" in="${Hardware.getAll(environment.configurationItems.collect{it.id})?.findAll{it?.id}.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="hardware" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </div>
                        </g:if>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Software:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <ul class="subItems">
                            <g:each var="item" in="${Software.getAll(environment.configurationItems.collect{it.id})?.findAll{it?.id}?.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="software" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </g:if>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Network:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <ul class="subItems">
                            <g:each var="item" in="${Network.getAll(environment.configurationItems.collect{it.id})?.findAll{it?.id}?.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="network" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </g:if>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Documentation:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <ul class="subItems">
                            <g:each var="item" in="${Documentation.getAll(environment.configurationItems.collect{it.id})?.findAll{it?.id}?.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="documentation" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </g:if>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Change Request:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <ul class="subItems">
                            <g:each var="item" in="${ChangeRequest.getAll(environment.configurationItems?.collect{it.id})?.findAll{it?.id}?.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="changeRequest" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </g:if>
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Test Result:</td>
                    <td valign="top" class=value>
                        <g:if test="${environment.configurationItems?.collect{it.id}}">
                        <ul class="subItems">
                            <g:each var="item" in="${TestResult.getAll(environment.configurationItems?.collect{it.id})?.findAll{it?.id}?.sort{ a, b -> a?.name?.compareToIgnoreCase b?.name }}">
                                <li><span class="ciLink"><g:link controller="testResult" action="show" params='["environment.id":params.id]' id="${item?.id}">${item}</g:link></span> <g:link action="removeCI" params='["ciID":item?.id]' id="${params.id}" onclick="return confirm('Are you sure?');">remove</g:link></li>
                            </g:each>
                        </ul>
                        </g:if>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form controller="environment">
            <input type="hidden" name="id" value="${environment?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
