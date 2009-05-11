<%--
  Created by IntelliJ IDEA.
  User: sholmes
  Date: Feb 26, 2008
  Time: 4:06:38 PM
  To change this template use File | Settings | File Templates.
--%>

<!--Main Navigation-->
<div id="navmenu">
<ul id="navmenu-h">
    <li><a href="#configuration">Configuration</a>
        <ul>
            <li><g:link controller="project" action="list">Project</g:link></li>
            <li><g:link controller="environment" action="list">Environment</g:link></li>
            <li><g:link controller="hardware" action="list">Hardware</g:link></li>
            <li><g:link controller="software" action="list">Software</g:link></li>
            <li><g:link controller="network" action="list">Network</g:link></li>
            <li><g:link controller="documentation" action="list">Documentation</g:link></li>
            <li><g:link controller="changeRequest" action="list">Change Request</g:link></li>
            <li><g:link controller="testResult" action="list">Test Result</g:link></li>
        </ul>
    </li>
    <li>|</li>
    <li><a href="#reports">Reports</a>
        <ul>
            <li><g:link controller="project" action="list">Project</g:link></li>
            <li><g:link controller="environment" action="list">Configuration Item</g:link></li>
        </ul>
    </li>
    <li>|</li>
    <li><a href="#administration">Administration</a>
        <ul>
            <li><g:link controller="relationReference" action="list">Relation Reference</g:link></li>
            <li><g:link controller="statusReference" action="list">Status Reference</g:link></li>
            <li><g:link controller="hardwareType" action="list">Hardware Type</g:link></li>
            <li><g:link controller="softwareType" action="list">Software Type</g:link></li>
            <li><g:link controller="networkType" action="list">Network Type</g:link></li>
            <li><g:link controller="documentationType" action="list">Documentation Type</g:link></li>
            <li><g:link controller="requestType" action="list">Change Request Type</g:link></li>
            <li><g:link controller="testResultType" action="list">Test Result Type</g:link></li>
        </ul>
    </li>
    <li>|</li>
    <li><a href="#security">Security</a>
        <ul>
            <li><g:link controller="jsecUser" action="list">User</g:link></li>
            <li><g:link controller="jsecUserRoleRel" action="list">User Roles</g:link></li>
        </ul>
    </li>
</ul>
</div>