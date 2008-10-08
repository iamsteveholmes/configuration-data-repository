<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myHardware = hardware
        while (myHardware?.parent) {
            hierarchy += myHardware.parent
            myHardware = myHardware.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="hardware" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>