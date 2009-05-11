%{--<% def ciType = ciList[0].class.name %>--}%
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Add Configuration Item</title>
    <g:javascript library="prototype" />
</head>
<body>
<div class="body">
    <h1>Add Configuration Item</h1>
    <div class="nav">
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="remoteField">
        Name: <g:remoteField id="${environment?.id}" action="relationForm" update="sub_form" paramName="name"  name="name" value="${params?.name}"/>
    </div>
<div id="configuration_list">
    <g:form action="saveRelation" method="post">
        <div id="sub_form">
        <input type="hidden" name="id" value="${environment?.id}"/>
        <div class="list">
            <table>
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <g:sortableColumn property="name" title="Name"/>
                        <g:sortableColumn property="description" title="Description"/>
                        <g:sortableColumn property="author" title="Author"/>
                        <g:sortableColumn property="ownerName" title="Owner Name"/>
                        <g:sortableColumn property="ownerEmail" title="Owner Email"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${ciList}" status="i" var="ci">

                        <tr class="odd">
                            <td><g:radio name="ciId" value="${ci.id}"/></td>

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


        <div class="paginateButtons">
            <g:paginate id="${environment?.id}" action="addRelation" total="${ciListSize}" params="[name:params?.name]"/>
        </div>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Add"/></span>
        </div>
        </div>
    </g:form>
    </div>
</div>
</body>
</html>
