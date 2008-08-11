<html>
  <head>
    <title>Welcome to Jasper-Grails</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <h1 style="margin-left:20px;">Jasper Plugin Administrator Page</h1>
    <div class="dialog" style="margin-left:20px;width:60%;">
      <br/>
      Click the link below to test your installation.
      <br/><br/>
      <g:jasperReport jasper="sample-jasper-plugin" format="PDF,HTML,XML,CSV,XLS,RTF,TEXT" name="Report name" delimiter="|">
        Your name: <input type="text" name="name" />
      </g:jasperReport>
      <br/>
      It is generated by the following code:<br/><br/>
      &lt;g:jasperReport jasper="sample-jasper-plugin" format="PDF,HTML,XML,CSV,XML,RTF,TEXT" name="Report name" delimiter="|"&gt;<br/>
      Your name: &lt;input type="text" name="name"/&gt;<br/>
      &lt;/g:jasperReport&gt;<br/>
    </div><br/>
    <div class="dialog" style="margin-left:20px;width:60%;">
      <h2>Tags description</h2>
      <h3>g:jasperReport</h3>
      <div>
        jasperReport tag creates a link to the jasper report defined by the developer.
        It must be in "%PROJECT_HOME%/web-app${pluginContextPath}/reports/" folder.
        That path is configurable and can be defined in <i>Config.groovy</i> file in the variable <i>jasper.dir.reports</i>.
        If it starts with a slash ("/") it is an absolute location.
        Otherwise it is relative to the "%PROJECT_HOME%/web-app${pluginContextPath}/" path.
        <br/><br/>
        The following attributes can be defined in this tag:
        <br/>
        <ul><b>name</b> The name shown to the user.</ul>
        <ul><b>jasper</b> The name of the report file, without the .jasper or .jrxml extension.
        jasperReports first looks for a file ending in .jasper, and if not found, it tries with .jrxml.</ul>
        <ul><b>format</b> A list of output formats for the report, separated by commas.
        This version supports PDF, HTML, XML, CSV, XML, RTF and TEXT formats.
        The button for each format is created by the tag.</ul>
        <ul><b>delimiter</b> Delimiter between icons.
        If you don't want any delimiter, use a single space (" ") instead of an empty sting
        (""), as an empty string will use the default ("|").</ul>
        <ul><b>from</b> List to be used by the report.
        A list of domain objects that will be used to generate the report. In the report the developer has to set the 
        field names with the same of the domain object.</ul>
        <br/>
        The body of the tag: All html input elemens defined in the body of the tag is sent as report parameters.</ul>
      </div>
    </div>
  </body>
</html>
