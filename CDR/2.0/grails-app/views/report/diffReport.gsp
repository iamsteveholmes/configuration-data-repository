<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Project Environment Difference Report</title>
</head>
<body>
<div class="body">
    <h1>Environment Difference Report</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors>
        <div class="errors">
            <g:renderErrors as="list"/>
        </div>
    </g:hasErrors>
    <div class="report">
        <g:jasperReport jasper="diff_report" format="PDF,HTML,XML,CSV,XLS,RTF,TEXT" name="Diff-report-${new Date()}" priorAction="diffReport">
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
                    <label class="report" for="startDate_day">Start Date</label>
                    <g:datePicker id="startDate" name="STATUS_DATE_START" value="${new Date()}" precision="day" years="${2008..2020}"/>
                </div>
                <div>
                    <label class="report" for="endDate_day">End Date</label>
                    <g:datePicker id="endDate" name="STATUS_DATE_END" value="${new Date()}" precision="day" years="${2008..2020}"/>
                </div>
            </fieldset>
        </g:jasperReport>
    </div>
</div>
</body>
</html>
