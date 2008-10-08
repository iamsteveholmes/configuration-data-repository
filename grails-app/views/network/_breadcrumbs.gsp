<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myNetwork = network
        while (myNetwork?.parent) {
            hierarchy += myNetwork.parent
            myNetwork = myNetwork.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="network" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>
</div>