<%--
  Created by IntelliJ IDEA.
  User: sholmes
  Date: Oct 25, 2007
  Time: 5:23:57 PM
  To change this template use File | Settings | File Templates.
--%>

<!--<div id="main_nav">-->
<ul>
    <li><a href="#configuration">Configuration</a>
        <ul>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="project" action="list">Application</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="environment" action="list">Environment</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="hardware" action="list">Hardware</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="software" action="list">Software</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="network" action="list">Network</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="documentation" action="list">Documentation</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="changeRequest" action="list">Change Request</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="testResult" action="list">Test Result</g:link></li>
        </ul>
    </li>
    <li><a href="#reports">Reports</a>
        <ul>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="project" action="list">Application</g:link></li>
            <li class="yuimenuitem"><g:link class="main_sub_item" controller="environment" action="list">Configuration Item</g:link></li>
        </ul>
    </li>
    <li><a href="#administration">Administration</a>
        <ul>

        </ul>
    </li>


                <li class="yuimenubaritem first-of-type">
                    <a class="yuimenubaritemlabel" href="#administration">Administration</a>
                    <div id="administration" class="yuimenu">
                        <div class="bd">
                            <ul>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="relationReference" action="list">Relation Reference</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="statusReference" action="list">Status Reference</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="hardwareType" action="list">Hardware Type</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="softwareType" action="list">Software Type</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="networkType" action="list">Network Type</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="documentationType" action="list">Documentation Type</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="requestType" action="list">Change Request Type</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="testResultType" action="list">Test Result Type</g:link></li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li class="yuimenubaritem first-of-type">
                    <a class="yuimenubaritemlabel" href="#security">Security</a>
                    <div id="security" class="yuimenu">
                        <div class="bd">
                            <ul>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="jsecUser" action="list">User</g:link></li>
                                <li class="yuimenuitem"><g:link class="yuimenuitemlabel" controller="jsecUserRoleRel" action="list">User Roles</g:link></li>
                            </ul>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function () {

/*
     Instantiate a MenuBar, passing in the id of the HTML element
     representing the MenuBar.
*/

var oMenuBar = new YAHOO.widget.MenuBar("mymenubar", { autosubmenudisplay: true }, { position: "dynamic" });


// Render the MenuBar instance

oMenuBar.render();

});
/*YAHOO.util.Event.onContentReady("basicmenu", function () {

*//*
             Instantiate a Menu.  The first argument passed to the
             constructor is the id of the element in the DOM that represents
             the Menu instance; the second is an object literal representing a set
             of configuration properties.
        *//*

var oMenu = new YAHOO.widget.Menu("basicmenu");


*//*
             Call the "render" method with no arguments since the markup for
             this Menu instance already exists in the DOM.
        *//*

oMenu.render();

// Show the Menu instance

oMenu.show();


});*/
</script>
