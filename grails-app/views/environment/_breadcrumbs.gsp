<div id="breadcrumbs">
    <ul class="breadcrumbs">
        <li><g:link controller="project" class="list" action="list">Home</g:link></li>
        <g:if test="${environment?.project?.id}">
            &raquo; <li><g:link controller="project" class="show" action="show" id="${environment.project.id}">${environment.project.name}</g:link></li>
        </g:if>
    </ul>
</div>