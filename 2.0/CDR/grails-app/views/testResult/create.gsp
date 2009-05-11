
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Create Test Result</title>
    </head>
    <body>
        <div class="body">
            <h1>Create Test Result</h1>
            <div class="nav">
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
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
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Name:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'name','errors')}'>
                            <input type="text" id='name' name='name' value="${fieldValue(bean:testResult,field:'name')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'description','errors')}'>
                            <textarea rows='5' cols='40' name='description'>${testResult?.description?.encodeAsHTML()}</textarea>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='author'>Author:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'author','errors')}'>
                            <input type="text" id='author' name='author' value="${fieldValue(bean:testResult,field:'author')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerName'>Owner Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'ownerName','errors')}'>
                            <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean:testResult,field:'ownerName')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerEmail'>Owner Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'ownerEmail','errors')}'>
                            <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean:testResult,field:'ownerEmail')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='parent'>Parent:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'parent','errors')}'>
                            <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${testResult?.parent?.id}" noSelection="['null':'']"></g:select>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='document'>Document:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'document','errors')}'>
                            <input type='file' id='document' name='document' />
                            </td>
                            </tr>
                            
                            %{--<tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='fileType'>File Type:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'fileType','errors')}'>
                            <input type="text" id='fileType' name='fileType' value="${fieldValue(bean:testResult,field:'fileType')}"/>
                            </td>
                            </tr>
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='fileName'>File Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'fileName','errors')}'>
                            <input type="text" id='fileName' name='fileName' value="${fieldValue(bean:testResult,field:'fileName')}"/>
                            </td>
                            </tr>--}%
                            
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='testResultType'>Test Result Type:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:testResult,field:'testResultType','errors')}'>
                            <g:select optionKey="id" from="${TestResultType.findAllByType('Test Result')}" name='testResultType.id' value="${testResult?.testResultType?.id}" ></g:select>
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
