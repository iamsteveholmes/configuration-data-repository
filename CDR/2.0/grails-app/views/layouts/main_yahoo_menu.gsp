<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>

    <title>Application Name | <g:layoutTitle default="Grails"/></title>

    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'menu.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <!-- Core + Skin CSS -->
    <!--<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.4.1/build/menu/assets/skins/sam/menu.css">-->

    <!-- Dependencies -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.4.1/build/container/container_core-min.js"></script>

    <!-- Source File -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.4.1/build/menu/menu-min.js"></script>
    <g:layoutHead/>
    <g:javascript library="application"/>
</head>
<body>
<!--100% Top Nav Wrapper-->
<div id="top_nav_wrapper">
    <!--Fixed Width Navigation Container-->
    <div id="top_nav_container">
        <!--Navigation Items List-->
        <ul class="top_nav">
            <li><a href="#" title="Help">Help</a></li> |
            <!--<li><g:link controller="project" action="list">Home</g:link></li> |-->
            <!--<jsec:hasRole name="Administrator">-->
                <!--<li><g:link controller="relationReference" action="list">Admin</g:link></li> |-->
            <!--</jsec:hasRole>-->
            <li><a href="#maincontent" title="Click here to skip to main content">Skip to main content</a></li>
        </ul>
    </div>
</div>
<!-- End of Top Navigation-->

<!-- Main Wrapper Contains all content in a centered fixed column of 760px -->
<div id="main_wrapper">
    <!-- Container with BG image of Company Header, Application, Name, etc. with space for Hello User -->
    <div id="logo_container">Logged in as <jsec:userName/> | <g:link controller="auth" action="signOut">Logout</g:link></div>
    <!-- Main sliding doors tabbed navigation --><!-- Main sliding doors tabbed navigation -->
    <g:render template="tabs"/>
    <g:render template="breadcrumbs"/>
    <!-- Contains main content area -->
    <div id="body_container">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
        </div>
        <a name="maincontent"></a><g:layoutBody/>
    </div>
    <div id="footer">
    &copy; 2007 Delegata Corporation. All Rights Reserved. | <a href="http://www.delegata.com/contact_us/inquiry_form.php?a=6" title="Contact Us">Contact Us</a>
    </div>
</div>
</body>
</html>