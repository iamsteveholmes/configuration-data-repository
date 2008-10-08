<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myDocumentation = documentation
        while (myDocumentation?.parent) {
            hierarchy += myDocumentation.parent
            myDocumentation = myDocumentation.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="documentation" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>