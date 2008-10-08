<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Create Relation</title>
    <g:javascript library="prototype" />
</head>
<body>

<div class="body">
<h1>Create Relation</h1>
<div class="nav">
</div>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${relation}">
    <div class="errors">
        <g:renderErrors bean="${relation}" as="list"/>
    </div>
</g:hasErrors>
<div class="remoteField">
    Name: <g:remoteField id="${relation?.thisCI?.id}" action="relationForm" update="ci_list" paramName="name"  name="name" value="${params?.name}"/>
</div>
<g:form action="save" method="post">
    <input type="hidden" name="thisCI.id" value="${relation?.thisCI?.id}"/>
    <div class="dialog">
        <table>
            <tbody>

                <tr class='prop'>
                    <td valign='top' class='value ${hasErrors(bean: relation, field: 'reference', 'errors')}'>
                        <span class="ci_name">${relation?.thisCI?.name} <g:select optionKey="id" from="${RelationReference?.list()}" name='reference.id' value="${relation?.reference?.id}"></g:select> :</span>
                    </td>
                </tr>

            </tbody>
        </table>

        <div id="ci_list">
            <table class="scrollTable">
                <thead class="fixedHeader">
                    <tr>
                        <th>&nbsp;</th>
                        <g:sortableColumn property="name" title="Name"/>
                        <g:sortableColumn property="description" title="Description"/>
                        <g:sortableColumn property="author" title="Author"/>
                        <g:sortableColumn property="ownerName" title="Owner Name"/>
                        <g:sortableColumn property="ownerEmail" title="Owner Email"/>
                    </tr>
                </thead>
                <tbody class="scrollContent">
                    <g:each in="${ciList}" status="i" var="ci">

                        <tr class="odd">
                            <td><g:radio name="thatCI.id" value="${ci.id}"/></td>

                            <td>${ci.name}</td>

                            <td>${ci.description?.encodeAsHTML()}</td>

                            <td>${ci.author?.encodeAsHTML()}</td>

                            <td>${ci.ownerName?.encodeAsHTML()}</td>

                            <td>${ci.ownerEmail?.encodeAsHTML()}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Create"></input></span>
        </div>
        </g:form>
    </div>

    </div>
</body>
</html>
