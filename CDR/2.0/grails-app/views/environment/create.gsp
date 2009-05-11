<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Create Environment</title>
    </head>
    <body>
        <div class="body">
            <h1>Create Environment</h1>
            <div class="nav">
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${environment}">
                <div class="errors">
                    <g:renderErrors bean="${environment}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form action="save" method="post">
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

                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='project'>Project:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean: environment, field: 'project', 'errors')}'>
                                    <g:select optionKey="id" from="${Project.list()}" name='project.id' value="${environment?.project?.id}"></g:select>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create"></input></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
