<%@ page import="timelog.User" %>
<html>
<head>
	<meta name='layout' content='user'/>	
</head>

<body>
    <div class="page-header">
        <h3><g:formatDate date="${new Date()}" type="date" style="FULL"/></h3>
        <div class="row">
            <div class="span7">
                <h3>People with entries</h3>
                <g:if test="${users_with_entry[0]}">        
                    <div class="unstyled alert-message block-message success">
                        <g:each in="${users_with_entry[0]}" var="u">
                            ${u} 
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <div class="unstyled alert-message block-message error">
                        <p>No one has recorded an entry</p>
                    </div>
                </g:else>
            </div>
            <div class="span7">            
                <h3>People without entries</h3>
                <g:if test="${users_without_entry[0]}">
                    <div class="unstyled alert-message block-message error">
                        <g:each in="${users_without_entry[0]}" var="u">
                            <strong>${u}</strong>
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <div class="unstyled alert-message block-message success">
                        <p>Everyone has recorded an entry</p>
                    </div>
                </g:else>
            </div>
        </div>                
    </div>
    <g:each in="${(1..3)}" var="i">
        <h3><g:formatDate date="${today - i}" type="date" style="FULL"/></h3>
            <div class="row">
                <div class="span7">
                    <g:if test="${users_with_entry[i]}">        
                        <div class="unstyled alert-message block-message success">
                            <g:each in="${users_with_entry[i]}" var="u">
                                ${u} 
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="unstyled alert-message block-message error">
                            <p>No one has recorded an entry</p>
                        </div>
                    </g:else>
                </div>
                <div class="span7">            
                    <g:if test="${users_without_entry[i]}">
                        <div class="unstyled alert-message block-message error">
                            <g:each in="${users_without_entry[i]}" var="u">
                                <strong>${u}</strong>
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="unstyled alert-message block-message success">
                            <p>Everyone has recorded an entry</p>
                        </div>
                    </g:else>
                </div>
            </div>
            <hr class="span14"/>
    </g:each>
       
<script type='text/javascript'>

	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
