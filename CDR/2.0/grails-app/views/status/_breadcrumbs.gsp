<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
        <g:if test="${status?.configurationItem}">
            &raquo; <li><g:link controller="${status?.configurationItem?.class.name.toString().toLowerCase()}" class="show" action="show" id="${status?.configurationItem?.id}">${status?.configurationItem?.name}</g:link></li>
        </g:if>
    </ul>
</div>