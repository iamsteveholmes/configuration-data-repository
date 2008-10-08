<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Application List</title>
    </head>
    <body>
        <div class="body">
            <h1>Application List</h1>
			<div class="nav">    
                <span class="menuButton"><g:link class="create" action="create">New Application</g:link></span>
   			</div>

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="Name"/>
                            <g:sortableColumn property="description" title="Description"/>
                            <g:sortableColumn property="ownerName" title="Owner Name"/>
                            <g:sortableColumn property="ownerEmail" title="Owner Email"/>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${projectList}" status="i" var="project">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                %{--<td><g:link action="show" id="${project.id}">${project.id?.encodeAsHTML()}</g:link></td>--}%

                                <td><g:link action="show" id="${project.id}">${project.name?.encodeAsHTML()}</g:link></td>

                                <td>${project.description?.encodeAsHTML()}</td>

                                <td>${project.ownerName?.encodeAsHTML()}</td>

                                <td>${project.ownerEmail?.encodeAsHTML()}</td>

                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Project.count()}"/>
            </div>
        </div>
    </body>
</html>
