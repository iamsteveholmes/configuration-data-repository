<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Software Type</title>
</head>
<body>
<div class="body">
    <h1>Edit Software Type</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Software Type List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${softwareType}">
        <div class="errors">
            <g:renderErrors bean="${softwareType}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="softwareType" method="post">
        <input type="hidden" name="id" value="${softwareType?.id}"/>
        <input type="hidden" name="version" value="${softwareType?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: softwareType, field: 'description', 'errors')}'>
                            <input type="text" id='description' name='description' value="${fieldValue(bean: softwareType, field: 'description')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='softwares'>Softwares:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: softwareType, field: 'softwares', 'errors')}'>

                            <ul>
                                <g:each var='s' in='${softwareType?.softwares?}'>
                                    <li><g:link controller='software' action='show' id='${s.id}'>${s}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller='software' params='["softwareType.id":softwareType?.id]' action='create'>Add Software</g:link>

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
