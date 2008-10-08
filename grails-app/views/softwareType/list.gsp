<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Software Type List</title>
</head>
<body>
<div class="body">
    <h1>Software Type List</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="create" action="create">New Software Type</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
                <tr>
                    <g:sortableColumn property="description" title="Description"/>
                </tr>
            </thead>
            <tbody>
                <g:each in="${softwareTypeList}" status="i" var="softwareType">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td><g:link action="show" id="${softwareType.id}">${softwareType.description?.encodeAsHTML()}</g:link></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${SoftwareType.countByType('Software')}"/>
    </div>
</div>
</body>
</html>
