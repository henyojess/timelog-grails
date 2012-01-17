
<%@ page import="timelog.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
			    <g:if test="${taskInstance?.story}">
				<li class="fieldcontain">
					<span id="story-label" class="property-label"><g:message code="task.story.label" default="Story" /></span>
					
						<span class="property-value" aria-labelledby="story-label"><g:link controller="story" action="show" id="${taskInstance?.story?.id}">${taskInstance?.story?.description?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="task.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${taskInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="task.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${taskInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.estimate}">
				<li class="fieldcontain">
					<span id="estimate-label" class="property-label"><g:message code="task.estimate.label" default="Estimate" /></span>
					
						<span class="property-value" aria-labelledby="estimate-label"><g:fieldValue bean="${taskInstance}" field="estimate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="task.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${taskInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="task.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue bean="${taskInstance}" field="updatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="task.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${taskInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="task.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${taskInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.timeEntries}">
				<li class="fieldcontain">
					<span id="timeEntries-label" class="property-label"><g:message code="task.timeEntries.label" default="Time Entries" /></span>
					
						<g:each in="${taskInstance.timeEntries}" var="t">
						<span class="property-value" aria-labelledby="timeEntries-label"><g:link controller="timeEntry" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
