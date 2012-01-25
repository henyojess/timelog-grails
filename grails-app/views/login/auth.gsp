<%@ page import="timelog.User" %>
<html>
<head>
	<meta name='layout' content='user'/>
    <meta name='menu' content='Home'/>
</head>

<body>
    <div class="page-header">
        <div class="row">
            <h3 class="span7">People with entries</h3>
            <h3 class="span7">People without entries</h3>
        </div>
        <div class="row">
            <p class="span14">
                <strong>
                <g:formatDate date="${today}" type="date" style="FULL"/>
                </strong>
            </p>
        </div>
        <div class="row">
            <div class="span7">                                
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
    <g:each in="${(1..7)}" var="i">
        <g:if test="${users_with_entry[i]}">
            <div class="row">
                <p class="span14">
                    <strong>
                    <g:formatDate date="${today - i}" type="date" style="FULL"/>
                    </strong>
                </p>
            </div>
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
        </g:if>
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
