<%@ page import="timelog.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript src="jquery.asmselect.js" />		
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jquery.asmselect.css')}" />
        <script>
            $(document).ready(function() {
                $("select[multiple]").asmSelect();                
            }); 
        </script>
	</head>
	<body>
		<div id="create-project" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${projectInstance}">
			    <ul class="errors" role="alert">
				    <g:eachError bean="${projectInstance}" var="error">
				    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				    </g:eachError>
			    </ul>
			</g:hasErrors>
			<g:form action="save" class="form-stacked">
				<fieldset class="form">
				    <legend>
				        <g:message code="default.create.label" args="[entityName]" />
				    </legend>
					<g:render template="form"/>
					<g:submitButton name="create" class="primary btn save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:link controller="home" class="btn" >
                        <g:message code="default.button.cancel.label" default="Cancel" />
    	            </g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
