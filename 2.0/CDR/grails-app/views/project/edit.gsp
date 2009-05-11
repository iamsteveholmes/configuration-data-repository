<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Edit Project</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Project</h1>
			<!-- New Location of nav menu - Tab specific functions go here --> 
			<div class="nav">
                <span class="menuButton"><g:link class="list" action="list">Project List</g:link></span>
        	</div>
            
			<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>   
            </g:if>
            <g:hasErrors bean="${project}">
                <div class="errors">
                    <g:renderErrors bean="${project}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form controller="project" method="post">
                <input type="hidden" name="id" value="${project?.id}"/>
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Name:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: project, field: 'name', 'errors')}'>
                                    <input type="text" id='name' name='name' value="${fieldValue(bean: project, field: 'name')}"/>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: project, field: 'description', 'errors')}'>
                                    <textarea rows='5' cols='40' name='description'>${project?.description?.encodeAsHTML()}</textarea>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerName'>Owner Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: project, field: 'ownerName', 'errors')}'>
                                    <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: project, field: 'ownerName')}"/>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerEmail'>Owner Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: project, field: 'ownerEmail', 'errors')}'>
                                    <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: project, field: 'ownerEmail')}"/>
                                </td>
                            </tr>

                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='environments'>Environments:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:project,field:'environments','errors')}'>

       <ul>
       <g:each var='e' in='${project?.environments?}'>
       <li><g:link controller='environment' action='show' id='${e.id}'>${e}</g:link></li>
       </g:each>
       </ul>
       <g:link controller='environment' params='["project.id":project?.id]' action='create'>Add Environment</g:link>

                                </td>
                            </tr>--}%

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update"/></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
