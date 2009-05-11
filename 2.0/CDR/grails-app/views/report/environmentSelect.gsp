<label class="report" for="environments">Environment</label>
<select id="environments" name="ENVIRONMENT_ID">
    <option value="">--none--</option>
    <g:each in="${environments}">
        <option value="${it.id}" ${}>${it.name}</option>
    </g:each>
</select>