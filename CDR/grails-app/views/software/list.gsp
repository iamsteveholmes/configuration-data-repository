<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Software List</title>
  %{--<gui:resources components="['dataTable']"/>--}%
</head>
<body>
<div class="body">
  <h1>Software List</h1>
  <div class="nav">
    <span class="menuButton"><g:link class="create" action="create">New Software</g:link></span>
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div>
    <g:form action="list">
      <%
        def environments = Environment.createCriteria().listDistinct {
          configurationItems {
            isNotNull "softwareType"
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
    %{--<gui:dataTable

            controller="software" action="dataTableJSON"
            columnDefs="[

            [key:'name', label:'Name', sortable: true, resizeable: true],
            [key:'status', label:'Status', resizeable: true],
            [key:'projectEnvironment', label:'Project Environment', resizeable: true],
            [key:'versionNum', label:'Version', resizeable: true],
            [key:'description', label:'Description', sortable: true, resizeable: true],
            [key:'lastUpdated', label:'Last Updated', sortable: true, resizeable: true]
            ]"

            sortedBy="name"
            draggableColumns="true"
    />--}%
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="name" title="Name"/>
        <th class="sortable">Status</th>
        <th class="sortable">Project Environment</th>
        <g:sortableColumn property="version" title="Version"/>
        <g:sortableColumn property="description" title="Description"/>
        <g:sortableColumn property="lastUpdated" title="Last Updated"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${softwareList}" status="i" var="software">
        <% def status = software.statuses?.find {it.endDate > new Date()} %>
        <% def environment = software.environments?.find {it} %>
        <% def projectEnvironment = "${environment?.project?.name ? environment?.project?.name : ''} ${environment?.name ? environment?.name : ''}" %>

        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="show" id="${software.id}">${software.name?.encodeAsHTML()}</g:link></td>
          <td>${status?.encodeAsHTML()}</td>
          <td>${projectEnvironment?.encodeAsHTML()}</td>
          <td>${software.versionNum?.encodeAsHTML()}</td>
          <td>${software.description?.encodeAsHTML()}</td>
          <td><g:formatDate format="MM-dd-yyyy" date="${software.lastUpdated}"/></td>
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
