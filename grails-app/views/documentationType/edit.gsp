<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Documentation Type</title>
</head>
<body>
<div class="body">
    <h1>Edit Documentation Type</h1>
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
    <g:form controller="documentationType" method="post">
        <input type="hidden" name="id" value="${documentationType?.id}"/>
        <input type="hidden" name="version" value="${documentationType?.version}"/>
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
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='documents'>Documents:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentationType, field: 'documents', 'errors')}'>
                            <ul>
                                <g:each var='d' in='${documentationType?.documents?}'>
                                    <li><g:link controller='documentation' action='show' id='${d.id}'>${d}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller='documentation' params='["documentationType.id":documentationType?.id]' action='create'>Add Documentation</g:link>
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
