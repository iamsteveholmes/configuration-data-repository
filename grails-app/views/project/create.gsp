<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Create Application</title>
    </head>
    <body>
        <div class="body">
            <h1>Create Application</h1>
			<!-- New Location of nav menu - Tab specific functions go here --> 
			<div class="nav">
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${project}">
                <div class="errors">
                    <g:renderErrors bean="${project}" as="list"/>
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
