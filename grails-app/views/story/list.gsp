
<%@ page import="timelog.Story" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-story" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-story" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

                        <g:sortableColumn property="project" title="${message(code: 'story.project.label', default: 'Project')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'story.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="releaseTarget" title="${message(code: 'story.releaseTarget.label', default: 'Release Target')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'story.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'story.active.label', default: 'Active')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storyInstanceList}" status="i" var="storyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					    <td>${fieldValue(bean: storyInstance.project, field: "name")}</td>
					
						<td><g:link action="show" id="${storyInstance.id}">${fieldValue(bean: storyInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: storyInstance, field: "releaseTarget")}</td>
					
						<td>${fieldValue(bean: storyInstance, field: "status")}</td>						
					
						<td><g:formatBoolean boolean="${storyInstance.active}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
