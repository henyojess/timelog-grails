<%@ page import="timelog.Story" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-story" class="content scaffold-create" role="main">			
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${storyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${storyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" class="form-stacked">
				<fieldset class="form">
				    <legend>
                        <g:message code="default.create.label" args="[entityName]" /> 
                        for ${storyInstance?.project?.name}
                    </legend>
					<g:render template="form"/>
					<g:submitButton name="create" class="btn primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<g:link controller="project" action="show" id="${storyInstance?.project?.id}" class="btn small" >
                        <g:message code="story.button.cancel.label" default="Cancel" />
    	            </g:link>
				</fieldset>					
			</g:form>
		</div>
	</body>
</html>
