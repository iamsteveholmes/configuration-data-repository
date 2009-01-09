<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Change Request List</title>
</head>
<body>
<div class="body">
  <h1>Change Request List</h1>
  <div class="nav">
    <span class="menuButton"><g:link class="create" action="create">New Change Request</g:link></span>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div>
    <g:form action="list">
      <%
        def environments = Environment.createCriteria().list {
          configurationItems {
            isNotNull "requestType"
          }
        }
      %>
      <select name="environmentId" onchange="submit()">
        <option value="">All Application Environments</option>
        <g:each var="environment" in="${environments}">
          <option ${(environment.id.toString() == environmentId) ? "selected='true'" : ''} value="${environment.id}">${environment.project?.name} ${environment.name}</option>
        </g:each>
      </select>
      Active <g:checkBox name="active" value="${params.active ? true : false}" onchange="submit()"/>
      </select>
    </g:form>
  </div>
  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="name" title="Name"/>
        <th class="sortable">Status</th>
        <th class="sortable">Application Environment</th>
        <g:sortableColumn property="description" title="Description"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${changeRequestList}" status="i" var="changeRequest">
        <% def status = changeRequest.statuses?.find {it.endDate > new Date()} %>
        <% def environment = changeRequest.environments?.find {it} %>
        <% def projectEnvironment = "${environment?.project?.name ? environment?.project?.name : ''} ${environment?.name ? environment?.name : ''}" %>
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="show" id="${changeRequest.id}">${changeRequest.name?.encodeAsHTML()}</g:link></td>
          <td>${status?.encodeAsHTML()}</td>
          <td>${projectEnvironment?.encodeAsHTML()}</td>
          <td>${changeRequest.description?.encodeAsHTML()}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${count}" params="${params}"/>
  </div>
</div>
</body>
</html>
