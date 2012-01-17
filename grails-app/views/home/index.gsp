<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="user" />
    <meta name="menu" content="Home"/>
  </head>
  <body>
        <div class="page-header">
            <h4>Type in your entry for today: <g:formatDate date="${new Date()}" type="date" style="FULL"/></h4>
            <g:form action="addEntry" method="POST">
                <g:textField name="textInput" placeholder="Description" class="input-xxlarge"/>
            </g:form>
            Example: Started adding foo functionality to bar. 8h
        </div>
        <div class="row">
            <div class="span10">
                <h3>Todays entries</h3>    
                <g:if test="${time_entries_today}">
                    <ul class="entries">
                        <g:each in="${time_entries_today}" var="t">
                            <li>
                                <span class="header">
                                    ${t.createdBy}
                                    <span class="duration">${t.duration} hour(s)</span>
                                </span>
                                <span class="description">
                                    ${t.description}                        
                                </span>
                                <span class="links">
                                    <g:link action="editEntry" id="${t.id}">Edit</g:link>
                                    &nbsp;|&nbsp;
                                    <g:link action="deleteEntry" id="${t.id}" onclick="return confirm('Are you sure you wish to delete this entry?')">Delete</g:link>
                                </span>
                            </li>
                        </g:each>            
                    </ul>
                </g:if>
                <g:else>
                    <div class="alert-message warning span9">
                        <p>No entries yet for today.</p>
                    </div>
                </g:else>
                <h3>Previous entries</h3>
                <g:if test="${time_entries_previous}">
                    <ul class="entries">
                        <g:each in="${time_entries_previous}" var="t">
                            <li>
                                <span class="header">
                                    ${t.createdBy}
                                    <span class="duration">
                                    <g:formatDate date="${t.entryDate}" type="date" style="FULL"/>
                                    - ${t.duration} hour(s)
                                    </span>
                                </span>
                                <span class="description">
                                    ${t.description}                        
                                </span>
                                <span class="links">
                                    <g:link action="editEntry" id="${t.id}">Edit</g:link>
                                </span>
                            </li>
                        </g:each>            
                    </ul>
                </g:if>
                <g:else>
                    <div class="alert-message warning span9">
                        <p>No entries from previous days</p>
                    </div>
                </g:else>
            </div>          
            <div class="span4" style="text-align:center">
                <h3>Your Hours Today </h3>
                <h1>${score}</h1>
            </div>
        </div>
  </body>
</html>
