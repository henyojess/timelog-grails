<%@ page import="timelog.Story" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-story" class="content scaffold-edit" role="main">
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
			<g:form method="post" class="form-stacked">
				<g:hiddenField name="id" value="${storyInstance?.id}" />
				<g:hiddenField name="version" value="${storyInstance?.version}" />
				<fieldset class="form">
				    <legend>
                        <g:message code="default.edit.label" args="[entityName]" />
                        for ${storyInstance?.project?.name}
                    </legend>
					<g:render template="form"/>
                    <g:actionSubmit class="primary btn save " action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:if test="${storyInstance.status != 'Planned' && storyInstance.tasks && !storyInstance.unestimatedTasks()}">
                            <g:actionSubmit class="btn" action="addToNextRelease" value="${message(code: 'story.button.AddToNextRelease.label', default: 'Next Release')}"/>
                        </g:if>
                        <g:if test="${storyInstance.status == 'Planned'}">
                            <g:actionSubmit class="btn" action="removeFromNextRelease" value="${message(code: 'story.button.RemoveFromNextRelease.label', default: 'Future Release')}"/>
                        </g:if>
                    </sec:ifAllGranted>
                    <g:link controller="project" action="show" id="${storyInstance?.project?.id}" class="btn" >
                        <g:message code="story.button.cancel.label" default="Cancel" />
	                </g:link>
	                <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:actionSubmit class="delete btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </sec:ifAllGranted>
                </fieldset>
			</g:form>
		</div>
	</body>
</html>
