<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def mySoftware = software
        while (mySoftware?.parent) {
            hierarchy += mySoftware.parent
            mySoftware = mySoftware.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="software" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>