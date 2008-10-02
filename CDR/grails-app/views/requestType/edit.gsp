<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Request Type</title>
</head>
<body>
<div class="body">
    <h1>Edit Request Type</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Request Type List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${requestType}">
        <div class="errors">
            <g:renderErrors bean="${requestType}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="requestType" method="post">
        <input type="hidden" name="id" value="${requestType?.id}"/>
        <input type="hidden" name="version" value="${requestType?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: requestType, field: 'description', 'errors')}'>
                            <input type="text" id='description' name='description' value="${fieldValue(bean: requestType, field: 'description')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='requests'>Requests:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: requestType, field: 'requests', 'errors')}'>

                            <ul>
                                <g:each var='r' in='${requestType?.requests?}'>
                                    <li><g:link controller='changeRequest' action='show' id='${r.id}'>${r}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller='changeRequest' params='["requestType.id":requestType?.id]' action='create'>Add ChangeRequest</g:link>

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
