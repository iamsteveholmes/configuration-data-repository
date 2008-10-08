<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myChangeRequest = changeRequest
        while (myChangeRequest?.parent) {
            hierarchy += myChangeRequest.parent
            myChangeRequest = myChangeRequest.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="changeRequest" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>