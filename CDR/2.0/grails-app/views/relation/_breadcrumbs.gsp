<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
        <g:if test="${relation?.thisCI}">
            &raquo; <li><g:link controller="${relation?.thisCI?.class.name.toString().toLowerCase()}" class="show" action="show" id="${relation?.thisCI?.id}">${relation?.thisCI?.name}</g:link></li>
        </g:if>
    </ul>
</div>