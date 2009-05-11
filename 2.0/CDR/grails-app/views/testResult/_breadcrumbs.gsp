<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myTestResult = testResult
        while (myTestResult?.parent) {
            hierarchy += myTestResult.parent
            myTestResult = myTestResult.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="testResult" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>