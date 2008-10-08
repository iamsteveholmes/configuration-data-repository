<%--
  Created by IntelliJ IDEA.
  User: sholmes
  Date: Oct 25, 2007
  Time: 5:23:57 PM
  To change this template use File | Settings | File Templates.
--%>

<div id="main_nav">
    <ul>
        <li><g:link controller="relationReference" action="list">Relation</g:link></li>
        <li><g:link controller="statusReference" action="list">Status</g:link></li>
        <li><g:link controller="hardwareType" action="list">Hardware</g:link></li>
        <li><g:link controller="softwareType" action="list">Software</g:link></li>
        <li><g:link controller="networkType" action="list">Network</g:link></li>
        <li id="current"><g:link controller="documentationType" action="list">Documentation</g:link></li>
        <li><g:link controller="requestType" action="list">Request</g:link></li>
        <li><g:link controller="testResultType" action="list">Test Result</g:link></li>
        <li><g:link controller="jsecUser" action="list">User</g:link></li>
        <li><g:link controller="jsecUserRoleRel" action="list">Role</g:link></li>
    </ul>
</div>