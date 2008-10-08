<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Test Result</title>
</head>
<body>
<div class="body">
    <h1>Edit Test Result</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Test Result List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${testResult}">
        <div class="errors">
            <g:renderErrors bean="${testResult}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="testResult" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${testResult?.id}"/>
        <input type="hidden" name="version" value="${testResult?.version}"/>
        <div class="dialog">
            <table>
                <tbody>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='name'>Name:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'name', 'errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean: testResult, field: 'name')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'description', 'errors')}'>
                            <textarea rows='5' cols='40' name='description'>${testResult?.description?.encodeAsHTML()}</textarea>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='author'>Author:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'author', 'errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean: testResult, field: 'author')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerName'>Owner Name:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'ownerName', 'errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: testResult, field: 'ownerName')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerEmail'>Owner Email:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'ownerEmail', 'errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: testResult, field: 'ownerEmail')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='parent'>Parent:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'parent', 'errors')}'>
                            <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${testResult?.parent?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='document'>Document:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'document', 'errors')}'>
                            <input type='file' id='document' name='document'/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='testResultType'>Test Result Type:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: testResult, field: 'testResultType', 'errors')}'>
                            <g:select optionKey="id" from="${HardwareType.findAllByType('Test Result')}" name='testResultType.id' value="${testResult?.testResultType?.id}"></g:select>
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
