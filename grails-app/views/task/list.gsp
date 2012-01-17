
<%@ page import="timelog.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-task" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'task.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="estimate" title="${message(code: 'task.estimate.label', default: 'Estimate')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'task.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="updatedBy" title="${message(code: 'task.updatedBy.label', default: 'Updated By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'task.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "estimate")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "updatedBy")}</td>
					
						<td><g:formatDate date="${taskInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
