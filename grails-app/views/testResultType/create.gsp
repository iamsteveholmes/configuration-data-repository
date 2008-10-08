<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Create Test Result Type</title>
</head>
<body>
<div class="body">
    <h1>Create Test Result Type</h1>
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
    <g:form action="save" method="post">
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
