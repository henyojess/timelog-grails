<%@ page import="timelog.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-task" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${taskInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${taskInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" class="form-stacked">
				<g:hiddenField name="id" value="${taskInstance?.id}" />
				<g:hiddenField name="version" value="${taskInstance?.version}" />
				<fieldset class="form">
				    <legend>
                        <g:message code="default.edit.label" args="[entityName]" />
				    </legend>
					<g:render template="form"/>
					<g:actionSubmit class="primary btn save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link controller="project" action="show" id="${taskInstance?.story?.project?.id}" class="btn" >
                        <g:message code="task.button.cancel.label" default="Cancel" />
    	            </g:link>
    	            <g:if test="${taskInstance.timeEntries && taskInstance.status in ['Pending','Incomplete'] }">
    	                <g:actionSubmit class="btn save" action="complete" value="${message(code: 'task.button.complete.label', default: 'Complete')}" />    	            
    	            </g:if>
    	            <g:if test="${taskInstance.status == 'Completed'}">
    	                <g:actionSubmit class="btn save" action="incomplete" value="${message(code: 'task.button.incomplete.label', default: 'Incomplete')}" />
                    </g:if>
                    <sec:ifAllGranted roles="ROLE_ADMIN">    	                
					    <g:actionSubmit class="btn delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </sec:ifAllGranted>					    
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
