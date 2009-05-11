<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Hardware</title>
</head>
<body>
<div class="body">
    <div class="nav">
    </div>
    <h1>Edit Hardware</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Hardware List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${hardware}">
        <div class="errors">
            <g:renderErrors bean="${hardware}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="hardware" method="post">
        <input type="hidden" name="id" value="${hardware?.id}"/>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='name'>Name:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'name', 'errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean: hardware, field: 'name')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'description', 'errors')}'>
                            <textarea rows='5' cols='40' name='description'>${hardware?.description?.encodeAsHTML()}</textarea>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='author'>Author:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'author', 'errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean: hardware, field: 'author')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerName'>Owner Name:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'ownerName', 'errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: hardware, field: 'ownerName')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerEmail'>Owner Email:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'ownerEmail', 'errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: hardware, field: 'ownerEmail')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='hardwareType'>Type</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'hardwareType', 'errors')}'>
                            <g:select optionKey="id" from="${HardwareType.findAllByType('Hardware')}" name='hardwareType.id' value="${hardware?.hardwareType?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='parent'>Parent:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'parent', 'errors')}'>
                            <g:select optionKey="id" from="${Hardware.list()}" name='parent.id' value="${hardware?.parent?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='macAddress'>Mac Address:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'macAddress', 'errors')}'>
                            <input type="text" maxlength='50' id='macAddress' name='macAddress' value="${fieldValue(bean: hardware, field: 'macAddress')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='hostName'>Host Name:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'hostName', 'errors')}'>
                            <input type="text" maxlength='50' id='hostName' name='hostName' value="${fieldValue(bean: hardware, field: 'hostName')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='internetProtocolAddress'>IP Address:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'internetProtocolAddress', 'errors')}'>
                            <input type="text" id='internetProtocolAddress' name='internetProtocolAddress' value="${fieldValue(bean: hardware, field: 'internetProtocolAddress')}"/>
                        </td>
                    </tr>

                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='purchaseDate'>Purchase Date:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: hardware, field: 'purchaseDate', 'errors')}'>
                            <g:datePicker name='purchaseDate' value="${hardware?.purchaseDate}"></g:datePicker>
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
