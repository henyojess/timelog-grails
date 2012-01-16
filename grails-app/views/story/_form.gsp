<%@ page import="timelog.Story" %>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="story.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${timelog.Project.list()}" optionKey="id" optionValue="name" required="" value="${storyInstance?.project?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="story.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${storyInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'releaseTarget', 'error')} required">
	<label for="releaseTarget">
		<g:message code="story.releaseTarget.label" default="Release Target" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="releaseTarget" required="" value="${storyInstance?.releaseTarget}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="story.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${storyInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="story.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${storyInstance?.active}" />
</div>


