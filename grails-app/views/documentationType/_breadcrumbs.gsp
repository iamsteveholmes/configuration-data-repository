<div id="breadcrumbs">
    %{--<ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
    <%
        List hierarchy = []
        def myDocumentationType = documentationType
        while (myDocumentationType?.parent) {
            hierarchy += myDocumentationType.parent
            myDocumentationType = myDocumentationType.parent
        }
        hierarchy.reverseEach {item ->
    %>
    &raquo; <li><g:link controller="documentationType" class="show" action="show" id="${item?.id}">${item?.name}</g:link></li>
        <% } %>
    </ul>--}%
</div>