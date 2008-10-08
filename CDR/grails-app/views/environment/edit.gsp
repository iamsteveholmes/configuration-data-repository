<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Edit Environment</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Environment</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="list" action="list">Environment List</g:link></span>
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${environment}">
                <div class="errors">
                    <g:renderErrors bean="${environment}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form controller="environment" method="post">
                <input type="hidden" name="id" value="${environment?.id}"/>
                <input type="hidden" name="version" value="${environment?.version}"/>
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Name:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'name', 'errors')}'>
                                    <input type="text" id='name' name='name' value="${fieldValue(bean: environment, field: 'name')}"/>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'description', 'errors')}'>
                                    <textarea rows='5' cols='40' name='description'>${environment?.description?.encodeAsHTML()}</textarea>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerName'>Owner Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'ownerName', 'errors')}'>
                                    <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: environment, field: 'ownerName')}"/>
                                </td>
                            </tr>

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerEmail'>Owner Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'ownerEmail', 'errors')}'>
                                    <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: environment, field: 'ownerEmail')}"/>
                                </td>
                            </tr>

                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='project'>Project:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'project', 'errors')}'>
                                    <g:select optionKey="id" from="${Project.list()}" name='project.id' value="${environment?.project?.id}"></g:select>
                                </td>
                            </tr>--}%

                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='configurationItems'>Configuration Items:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'configurationItems', 'errors')}'>

                                    <ul>
                                        <g:each var='c' in='${environment?.configurationItems?}'>
                                            <li><g:link controller='configurationItem' action='show' id='${c.id}'>${c}</g:link></li>
                                        </g:each>
                                    </ul>
                                    <g:link controller='configurationItem' params='["environment.id":environment?.id]' action='create'>Add ConfigurationItem</g:link>

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
