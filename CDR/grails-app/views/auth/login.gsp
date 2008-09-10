<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Configuration Data Repository | Login</title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <style type="text/css">
    @import "${createLinkTo(dir: 'css', file: 'main_menu.css')}";
    </style>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
</head>
<body>
<!--Main wrapper for login page which contains the login form in a centered fixed column of 458px wide-->
<div id="login_wrapper">
    <!-- Top Container which has Application Logo as well as "Login" Text-->
    <div id="login_top_container">Login</div>
    <!-- Container for login form -->
    <div id="login_container">

        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
        </div>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:form action="signIn">
            <input type="hidden" name="targetUri" value="${targetUri}"/>
            <p>
                <label>Username:<br/>
                    <input name="username" id="user_login" class="input" value="${username}" size="30" tabindex="10" type="text"/></label>
            </p>
            <p>
                <label>Password:<br/>
                    <input name="password" id="user_pass" class="input" value="" size="30" tabindex="20" type="password"/></label>
            </p>
            <p>
                <label>Remember me?:</label>
                <g:checkBox name="rememberMe" value="${rememberMe}"/>
            </p>
            <p class="submit">
                <a href="#">Trouble with login?</a>
                <input value="Login >" id="login_submit" tabindex="100" type="submit"/>
            </p>
        </g:form>
    </div>

    <!-- Centered Login Page Footer -->
    <div id="login_footer">
        &nbsp;
    </div>
</div>
</body>
</html>

