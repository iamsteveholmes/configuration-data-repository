<%--
  This Source Code is the sole property of Delegata, Inc.  All rights reserved.
  User: sholmes
  Date: Mar 11, 2008
  Time: 2:43:25 PM
--%>
%{--<g:form action="saveRelation" method="post">--}%
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
    </div>

    <div class="paginateButtons">
        <g:paginate id="${environment?.id}" total="${ciListSize}" action="addRelation" params="[name:params.name]"/>
    </div>
    <div class="buttons">
        <span class="button"><input class="save" type="submit" value="Add"/></span>
    </div>
%{--</g:form>--}%
