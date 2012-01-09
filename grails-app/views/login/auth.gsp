<html>
<head>
	<meta name='layout' content='user'/>
	
</head>

<body>
    <div class="page-header">
        <h3>Todays entries: <g:formatDate date="${new Date()}" type="date" style="FULL"/></h3>
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
                    </li>
                </g:each>            
            </ul>
        </g:if>
        <g:else>
            <div class="alert-message warning span9">
                <p>No entries yet for today.</p>
            </div>
        </g:else>
    </div>
    <div class="row">       
        <div class="span14"> 
        <h3>Previous tasks: <g:formatDate date="${new Date() - 1}" type="date" style="FULL"/></h3>
        <g:if test="${time_entries_previous}">
        <ul class="entries">
            <g:each in="${time_entries_previous}" var="t">
                <li>
                    <span class="header">
                        ${t.createdBy}
                        <span class="duration">${t.duration} hour(s)</span>
                    </span>
                    <span class="description">
                        ${t.description}                        
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
    </div>
<script type='text/javascript'>

	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
