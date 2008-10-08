<%--
  This Source Code is the sole property of Delegata, Inc.  All rights reserved.
  User: sholmes
  Date: Mar 18, 2008
  Time: 5:50:06 PM
--%>

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