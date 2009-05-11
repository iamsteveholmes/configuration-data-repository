<%--
  This Source Code is the sole property of Delegata, Inc.  All rights reserved.
  User: sholmes
  Date: Jun 25, 2008
  Time: 5:49:15 PM
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head><title>Service Order</title></head>
<body>
<ul class="configurationItems">
    <g:each var="ci" in="${serviceOrder?.configurationItems}">
        <li><span class="id">${ci.id}</span> <span class="name">${ci.name}</span></li>
    </g:each>
</ul>
<ul class="relations">
    <g:each var="relation" in="${serviceOrder?.relations}">
        <li><span class="id">${relation.id}</span> <span class="thisCI">${relation?.thisCI?.id}</span> <span class="referenceId">${relation.reference?.id}</span> <span class="referenceName">${relation.reference?.name}</span> <span class="thatCI">${relation.thatCI}</span></li>
    </g:each>
</ul>
<ul class="statusus">
    <g:each var="status" in="${serviceOrder?.statusus}">
        <li><span class="id">${status.id}</span> <span class="startDate">${status.startDate}</span> <span class="endDate">${status.startDate}</span> <span class="ciId">${status?.configurationItem?.id}</span> <span class="ciName">${status?.configurationItem?.name}</span> <span class="referenceId">${status?.reference?.id}</span> <span class="referenceName">${status?.reference?.name}</span></li>
    </g:each>
</ul>
<form action="serviceOrder/configurationItem" method="POST">
    <g:hiddenField name="_flowExecutionKey" value="${params._flowExecutionKey}"/>
    <g:hiddenField name="name" value="joyjoy"/>
    <g:hiddenField name="category" value="hardware"/>
    <g:hiddenField name="hardwareType.id" value="1"/>
    <g:hiddenField name="author" value="dude"/>
    %{--<g:submitButton name="createConfigurationItem" value="createConfigurationItem"></g:submitButton> --}%
    <input type="submit" name="createy" value="createy"/>
</form>
<form action="serviceOrder" method="POST">
    <g:hiddenField name="_flowExecutionKey" value="${params._flowExecutionKey}"/>
    <g:hiddenField name="name" value="joyjoy"/>
    <g:hiddenField name="category" value="hardware"/>
    <g:hiddenField name="hardwareType.id" value="1"/>
    <g:hiddenField name="author" value="dude"/>
    <input type="submit" name="persisty" value="persisty"/>
</form>
</body>
</html>