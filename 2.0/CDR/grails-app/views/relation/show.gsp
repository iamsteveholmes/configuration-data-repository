
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main"/>
        <title>Show Relation</title>
    </head>
    <body>
        <div class="body">
            <h1>Show Relation</h1>
            <div class="nav">
            </div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        
                        


                        <tr class="prop">
                            <!--<td valign="top" class="name">This CI:</td>-->
                            
                            <td valign="top" class="value">
                                <g:link controller="${relation?.thisCI?.class.name.toString().toLowerCase()}" action="show" id="${relation?.thisCI?.id}">${relation?.thisCI}</g:link>
                                <g:link controller="relationReference" action="show" id="${relation?.reference?.id}">${relation?.reference}</g:link>
                                <g:link controller="${relation?.thatCI?.class.name.toString().toLowerCase()}" action="show" id="${relation?.thatCI?.id}">${relation?.thatCI}</g:link>
                            </td>
                        </tr>
                        


                       %{-- <tr class="prop">
                            <!--<td valign="top" class="name">Reference:</td>-->

                            <td valign="top" class="value"><g:link controller="relationReference" action="show" id="${relation?.reference?.id}">${relation?.reference}</g:link></td>

                        </tr>



                        <tr class="prop">
                            <!--<td valign="top" class="name">That CI:</td>-->

                            <td valign="top" class="value"><g:link controller="${relation?.thatCI?.class.name.toString().toLowerCase()}" action="show" id="${relation?.thatCI?.id}">${relation?.thatCI}</g:link></td>

                        </tr>--}%
                        
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="relation">
                    <input type="hidden" name="id" value="${relation?.id}"/>
                    %{--<span class="button"><g:actionSubmit class="edit" value="Edit"/></span>--}%
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
