<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Environment Report</title>
</head>
<body>
<div class="body">
    <h1>Environment Report</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors>
        <div class="errors">
            <g:renderErrors as="list"/>
        </div>
    </g:hasErrors>
    <div class="report">
        <g:jasperReport id="1" jasper="Environment_Report" format="PDF,HTML,XML,CSV,XLS,RTF,TEXT" name="Environment Report-${new Date()}" priorAction="environmentReport">
            <fieldset id="reportForm">
                <legend>Report Builder</legend>
                <div>
                    <label class="report" for="projects">Project</label>
                    <select id="projects" name="project.id" onchange="${remoteFunction(action: 'environmentSelect', update: "environmentSelect", params: '\'project.id=\' + this.value')}">
                        <option value="">--none--</option>
                        <g:each in="${projects}">
                            <option value="${it.id}">${it.name}</option>
                        </g:each>
                    </select>
                </div>
                <div id="environmentSelect" class="value ${hasErrors(field: 'ENVIRONMENT_ID', 'errors')}">
                    <label class="report" for="environments">Environment</label>
                    <select id="environments" name="ENVIRONMENT_ID">
                        <option value="">--none--</option>
                        <g:each in="${environments}">
                            <option value="${it.id}">${it.name}</option>
                        </g:each>
                    </select>
                </div>
                <div>
                    <label class="report" for="statustDate_day">Start Date</label>
                    <g:datePicker id="statusDate" name="STATUS_DATE" value="${new Date()}" precision="day" years="${2008..2020}"/>
                </div>
            </fieldset>
        </g:jasperReport>
    </div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

</div>
</body>
</html>
