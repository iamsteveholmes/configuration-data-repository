<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Test Result Type</title>
</head>
<body>
<div class="body">
    <h1>Edit Test Result Type</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Test Result Type List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${testResultType}">
        <div class="errors">
            <g:renderErrors bean="${testResultType}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="testResultType" method="post">
        <input type="hidden" name="id" value="${testResultType?.id}"/>
        <input type="hidden" name="version" value="${testResultType?.version}"/>
        <div class="dialog">
            <table>
                <tbody>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResultType, field: 'description', 'errors')}'>
                            <input type="text" id='description' name='description' value="${fieldValue(bean: testResultType, field: 'description')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='results'>Results:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResultType, field: 'results', 'errors')}'>
                            <ul>
                                <g:each var='r' in='${testResultType?.results?}'>
                                    <li><g:link controller='changeRequest' action='show' id='${r.id}'>${r}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller='changeRequest' params='["testResultType.id":testResultType?.id]' action='create'>Add ChangeRequest</g:link>
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
