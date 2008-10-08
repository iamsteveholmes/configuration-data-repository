  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Software</title>         
    </head>
    <body>
        <div class="body">
            <h1>Create Software</h1>
            <div class="nav">
                %{--<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>--}%
                <span class="menuButton"><g:link class="list" action="list">Software List</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${software}">
            <div class="errors">
                <g:renderErrors bean="${software}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='name'>Name:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'name','errors')}'>
                                    <input type="text" id='name' name='name' value="${fieldValue(bean:software,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='description'>Description:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'description','errors')}'>
                                    <textarea rows='5' cols='40' name='description'>${software?.description?.encodeAsHTML()}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='author'>Author:<span class="required">*</span></label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'author','errors')}'>
                                    <input type="text" id='author' name='author' value="${fieldValue(bean:software,field:'author')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerName'>Owner Name:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'ownerName','errors')}'>
                                    <input type="text" id='ownerName' name='ownerName' value="${fieldValue(bean:software,field:'ownerName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='ownerEmail'>Owner Email:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'ownerEmail','errors')}'>
                                    <input type="text" id='ownerEmail' name='ownerEmail' value="${fieldValue(bean:software,field:'ownerEmail')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='parent'>Parent:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'parent','errors')}'>
                                    <g:select optionKey="id" from="${ConfigurationItem.list()}" name='parent.id' value="${software?.parent?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='versionNum'>Version Num:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'versionNum','errors')}'>
                                    <input type="text" id='versionNum' name='versionNum' value="${fieldValue(bean:software,field:'versionNum')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='port'>Port:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'port','errors')}'>
                                    <input type="text" id='port' name='port' value="${fieldValue(bean:software,field:'port')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='release'>Release:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'releaseNum','errors')}'>
                                    <input type="text" id='releaseNum' name='release' value="${fieldValue(bean:software,field:'releaseNum')}"/>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='softwareType'>Software Type:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:software,field:'softwareType','errors')}'>
                                    <g:select optionKey="id" from="${SoftwareType.findAllByType('Software')}" name='softwareType.id' value="${software?.softwareType?.id}" ></g:select>
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
