<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=ISO-8859-1"/>

    <title>Application Name | <g:layoutTitle default="Grails"/></title>

    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <style type="text/css">
    @import "${createLinkTo(dir: 'css', file: 'main_menu.css')}";
    </style>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

    <!-- Source File -->
    <g:layoutHead/>
    <g:javascript library="prototype"/>
    <g:javascript src="application.js"/>
    <!--[if gte IE 5.5]>
    <g:javascript library="menu"/>
    <![endif]-->
</head>
<body>
<!--100% Top Nav Wrapper-->
<div id="top_nav_wrapper">

    <!--Fixed Width Navigation Container-->
    <div id="top_nav_container">
        <!--Navigation Items List-->
        <ul class="top_nav">
            <li><a title="Help" href="${createLinkTo(dir: 'static_files', file: 'CDR_User_Manual.pdf')}">Help</a></li>
            <li><a href="#maincontent" style="display:none">Skip to main content</a></li>
        </ul>
    </div>
</div>
<!-- End of Top Navigation-->

<!-- Main Wrapper Contains all content in a centered fixed column of 760px -->
<div id="main_wrapper">
    <!-- Container with BG image of Company Header, Application, Name, etc. with space for Hello User -->
    <div id="logo_container">Logged in as <jsec:principal/> | <g:link controller="auth" action="signOut">Logout</g:link></div>
    <!-- Main Dropdown Navigation -->
    <g:render template="/shared/tabs"/>
    <g:render template="breadcrumbs"/>
    <!-- Contains main content area -->
    <div id="body_container">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
        </div>
        <a name="maincontent"></a><g:layoutBody/>
    </div>
    <div id="footer">
    &nbsp;
    </div>
</div>
</body>
</html>
