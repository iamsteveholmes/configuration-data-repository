  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Relation</title>
    </head>
    <body>
        <div class="body">
            <h1>Edit Relation</h1>
            <div class="nav">
                <span class="menuButton"><g:link class="list" action="list">Relation List</g:link></span>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${relation}">
            <div class="errors">
                <g:renderErrors bean="${relation}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="relation" method="post" >
                <input type="hidden" name="id" value="${relation?.id}" />
                <input type="hidden" name="version" value="${relation?.version}"/>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='thisCI'>This CI:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:relation,field:'thisCI','errors')}'>
                                    <g:select optionKey="id" from="${ConfigurationItem.list()}" name='thisCI.id' value="${relation?.thisCI?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='reference'>Reference:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:relation,field:'reference','errors')}'>
                                    <g:select optionKey="id" from="${RelationReference.list()}" name='reference.id' value="${relation?.reference?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class='prop'>
                                <td valign='top' class='name'>
                                    <label for='thatCI'>That CI:</label>
                                </td>
                                <td valign='top' class='value ${hasErrors(bean:relation,field:'thatCI','errors')}'>
                                    <g:select optionKey="id" from="${ConfigurationItem.list()}" name='thatCI.id' value="${relation?.thatCI?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
