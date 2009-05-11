<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Create Documentation Type</title>
</head>
<body>
<div class="body">
    <h1>Create Documentation Type</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Documentation Type List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${documentationType}">
        <div class="errors">
            <g:renderErrors bean="${documentationType}" as="list"/>
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
                        <td valign='top' class='value ${hasErrors(bean: documentationType, field: 'description', 'errors')}'>
                            <input type="text" id='description' name='description' value="${fieldValue(bean: documentationType, field: 'description')}"/>
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
