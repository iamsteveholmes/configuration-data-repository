<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Documentation</title>
</head>
<body>
<div class="body">
    <h1>Edit Documentation</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Documentation List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${documentation}">
        <div class="errors">
            <g:renderErrors bean="${documentation}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="documentation" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${documentation?.id}"/>
        <input type="hidden" name="version" value="${documentation?.version}"/>
        <div class="dialog">
            <table>
                <tbody>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='name'>Name:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'name', 'errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean: documentation, field: 'name')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'description', 'errors')}'>
                            <textarea rows='5' cols='40' name='description'>${documentation?.description?.encodeAsHTML()}</textarea>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='author'>Author:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'author', 'errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean: documentation, field: 'author')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerName'>Owner Name:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'ownerName', 'errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: documentation, field: 'ownerName')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerEmail'>Owner Email:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'ownerEmail', 'errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: documentation, field: 'ownerEmail')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='parent'>Parent:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'parent', 'errors')}'>
                            <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${documentation?.parent?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='document'>Document:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'document', 'errors')}'>
                            <input type='file' id='document' name='document'/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='title'>Title:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'title', 'errors')}'>
                            <input type="text" id='title' name='title' value="${fieldValue(bean: documentation, field: 'title')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='abstraction'>Abstraction:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'abstraction', 'errors')}'>
                            <input type="text" id='abstraction' name='abstraction' value="${fieldValue(bean: documentation, field: 'abstraction')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='documentationType'>Documentation Type:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: documentation, field: 'documentationType', 'errors')}'>
                            <g:select optionKey="id" from="${DocumentationType.findAllByType('Documentation')}" name='documentationType.id' value="${documentation?.documentationType?.id}"></g:select>
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
