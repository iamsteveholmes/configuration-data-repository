<%--
  Created by IntelliJ IDEA.
  User: sholmes
  Date: Oct 25, 2007
  Time: 5:23:57 PM
  To change this template use File | Settings | File Templates.
--%>

<div id="main_nav">
    <ul>
        <li><g:link controller="project" action="list">Application</g:link></li>
        <li><g:link controller="environment" action="list">Environment</g:link></li>
        <li><g:link controller="hardware" action="list">Hardware</g:link></li>
        <li><g:link controller="software" action="list">Software</g:link></li>
        <li><g:link controller="network" action="list">Network</g:link></li>
        <li id="current"><g:link controller="documentation" action="list">Documentation</g:link></li>
        <li><g:link controller="changeRequest" action="list">Request</g:link></li>
        <li><g:link controller="testResult" action="list">Test Result</g:link></li>
    </ul>
</div>