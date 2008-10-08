<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Status Reference</title>
</head>
<body>
<div class="body">
    <h1>Edit Status Reference</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Status Reference List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${statusReference}">
        <div class="errors">
            <g:renderErrors bean="${statusReference}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="statusReference" method="post">
        <input type="hidden" name="id" value="${statusReference?.id}"/>
        <input type="hidden" name="version" value="${statusReference?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='name'>Name:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: statusReference, field: 'name', 'errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean: statusReference, field: 'name')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: statusReference, field: 'description', 'errors')}'>
                            <input type="text" id='description' name='description' value="${fieldValue(bean: statusReference, field: 'description')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='statuses'>Statuses:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: statusReference, field: 'statuses', 'errors')}'>
                            <ul>
                                <g:each var='s' in='${statusReference?.statuses?}'>
                                    <li><g:link controller='status' action='show' id='${s.id}'>${s}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller='status' params='["statusReference.id":statusReference?.id]' action='create'>Add Status</g:link>
                        </td>
                    </tr>

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
