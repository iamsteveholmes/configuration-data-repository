
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Create Documentation</title>
    </head>
    <body>
        <div class="body">
            <h1>Create Documentation</h1>
            <div class="nav">
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
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
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Name:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'name','errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean:documentation,field:'name')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'description','errors')}'>
                            <textarea rows='5' cols='40' name='description'>${documentation?.description?.encodeAsHTML()}</textarea>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='author'>Author:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'author','errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean:documentation,field:'author')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerName'>Owner Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'ownerName','errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean:documentation,field:'ownerName')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerEmail'>Owner Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'ownerEmail','errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean:documentation,field:'ownerEmail')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='parent'>Parent:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'parent','errors')}'>
                            <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${documentation?.parent?.id}" noSelection="['null':'']"></g:select>
                            </td>
                            </tr>
                            
                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='docVersion'>Doc Version:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'docVersion','errors')}'>
                            <input type='text' id='docVersion' name='docVersion' value="${fieldValue(bean:documentation,field:'docVersion')}" />
                            </td>
                            </tr>--}%
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='document'>Document:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'document','errors')}'>
                            <input type='file' id='document' name='document' />
                            </td>
                            </tr>
                            
                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='fileType'>File Type:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'fileType','errors')}'>
                            <input type="text" id='fileType' name='fileType' value="${fieldValue(bean:documentation,field:'fileType')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='fileName'>File Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'fileName','errors')}'>
                            <input type="text" id='fileName' name='fileName' value="${fieldValue(bean:documentation,field:'fileName')}"/>
                            </td>
                            </tr>--}%
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='title'>Title:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'title','errors')}'>
                            <input type="text" id='title' name='title' value="${fieldValue(bean:documentation,field:'title')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='abstraction'>Abstraction:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'abstraction','errors')}'>
                            <input type="text" id='abstraction' name='abstraction' value="${fieldValue(bean:documentation,field:'abstraction')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='documentationType'>Documentation Type:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:documentation,field:'documentationType','errors')}'>
                            <g:select optionKey="id" from="${DocumentationType.findAllByType('Documentation')}" name='documentationType.id' value="${documentation?.documentationType?.id}" ></g:select>
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
