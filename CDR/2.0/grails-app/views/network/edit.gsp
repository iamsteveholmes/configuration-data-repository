<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit Network</title>
</head>
<body>
<div class="body">
    <h1>Edit Network</h1>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Network List</g:link></span>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${network}">
        <div class="errors">
            <g:renderErrors bean="${network}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form controller="network" method="post">
        <input type="hidden" name="id" value="${network?.id}"/>
        <div class="dialog">
            <table>
                <tbody>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='name'>Name:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'name', 'errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean: network, field: 'name')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='description'>Description:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'description', 'errors')}'>
                            <textarea rows='5' cols='40' name='description'>${network?.description?.encodeAsHTML()}</textarea>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='author'>Author:<span class="required">*</span></label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'author', 'errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean: network, field: 'author')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerName'>Owner Name:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'ownerName', 'errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean: network, field: 'ownerName')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='ownerEmail'>Owner Email:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'ownerEmail', 'errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean: network, field: 'ownerEmail')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='parent'>Parent:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'parent', 'errors')}'>
                            <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${network?.parent?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='internetProtocolAddress'>Internet Protocol Address:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'internetProtocolAddress', 'errors')}'>
                            <input type="text" id='internetProtocolAddress' name='internetProtocolAddress' value="${fieldValue(bean: network, field: 'internetProtocolAddress')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='macAddress'>Mac Address:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'macAddress', 'errors')}'>
                            <input type="text" id='macAddress' name='macAddress' value="${fieldValue(bean: network, field: 'macAddress')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='element'>Element:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'element', 'errors')}'>
                            <input type="text" id='element' name='element' value="${fieldValue(bean: network, field: 'element')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='location'>Location:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'location', 'errors')}'>
                            <input type="text" id='location' name='location' value="${fieldValue(bean: network, field: 'location')}"/>
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='networkType'>Network Type:</label>
                        </td>
                        <td valign='top' class='value ${hasErrors(bean: network, field: 'networkType', 'errors')}'>
                            <g:select optionKey="id" from="${NetworkType.findAllByType('Network')}" name='networkType.id' value="${network?.networkType?.id}"></g:select>
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
