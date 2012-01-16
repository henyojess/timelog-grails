
<%@ page import="timelog.Story" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-story" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-story" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list story">
			
			    <g:if test="${storyInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="story.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="show" id="${storyInstance?.project?.id}">${storyInstance?.project?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="story.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${storyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.releaseTarget}">
				<li class="fieldcontain">
					<span id="releaseTarget-label" class="property-label"><g:message code="story.releaseTarget.label" default="Release Target" /></span>
					
						<span class="property-value" aria-labelledby="releaseTarget-label"><g:fieldValue bean="${storyInstance}" field="releaseTarget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="story.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${storyInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="story.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${storyInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="story.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue bean="${storyInstance}" field="updatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="story.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${storyInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="story.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${storyInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${storyInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="story.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${storyInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${storyInstance?.id}" />
					<g:link class="edit" action="edit" id="${storyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
