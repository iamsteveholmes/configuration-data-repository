<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Software List</title>
</head>
<body>
<div class="body">
    <h1>Software List</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New Software</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
                <tr>
                    <g:sortableColumn property="name" title="Name"/>
                    <th class="sortable">Status</th>
                    <th class="sortable">Project Environment</th>
                    <g:sortableColumn property="version" title="Version"/>
                    <g:sortableColumn property="description" title="Description"/>
                    <g:sortableColumn property="ownerName" title="Owner Name"/>
                    <g:sortableColumn property="lastUpdated" title="Last Updated"/>
                </tr>
            </thead>
            <tbody>

                <g:each in="${softwareList}" status="i" var="software">
                    <% def status = software.statuses?.find {it.endDate > new Date()} %>
                    <% def projectEnvironment = "${environment?.project?.name ? environment?.project?.name : ''} ${environment?.name ? environment?.name : ''}" %>
                    <% def environment = software.environments?.find {it} %>
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${software.id}">${software.name?.encodeAsHTML()}</g:link></td>
                        <td>${status?.encodeAsHTML()}</td>
                        <td>${projectEnvironment?.encodeAsHTML()}</td>
                        <td>${software.version?.encodeAsHTML()}</td>
                        <td>${software.description?.encodeAsHTML()}</td>
                        <td>${software.ownerName?.encodeAsHTML()}</td>
                        <td><g:formatDate format="MM-dd-yyyy" date="${software.lastUpdated}"/></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${Software.count()}"/>
    </div>
</div>
</body>
</html>
