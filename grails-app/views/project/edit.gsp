<%@ page import="timelog.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript library="jquery"/>
		<g:javascript src="jquery.asmselect.js" />		
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jquery.asmselect.css')}" />
        <script>
            $(document).ready(function() {
                $("select[multiple]").asmSelect();                
            }); 
        </script>
	</head>
	<body>
		<div id="edit-project" class="content scaffold-edit" role="main">
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
			<g:form method="post" class="form-stacked">
				<g:hiddenField name="id" value="${projectInstance?.id}" />
				<g:hiddenField name="version" value="${projectInstance?.version}" />
				<fieldset class="form" class="stacked-form">
				    <legend>
				        <g:message code="default.edit.label" args="[entityName]" />
				    </legend>
					<g:render template="form"/>
					<g:actionSubmit class="primary btn save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link controller="project" action="show" id="${projectInstance?.id}" class="btn" >
                        <g:message code="default.button.cancel.label" default="Cancel" />
    	            </g:link>
    	            <sec:ifAllGranted roles="ROLE_ADMIN">
					    <g:actionSubmit class="btn delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>					    
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
