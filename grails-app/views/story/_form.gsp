<%@ page import="timelog.Story" %>
<g:hiddenField name="project.id" value="${storyInstance?.project?.id}"/>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'description', 'error')} required clearfix">
	<label for="description">
		<g:message code="story.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" required="" value="${storyInstance?.description}" class="xxlarge"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'releaseTarget', 'error')} required clearfix">
	<label for="status">
		<g:message code="story.releaseTarget.label" default="Release Target" />
		<span class="required-indicator">*</span>
	</label>
	<input disabled="true" value="${storyInstance.releaseTarget}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'status', 'error')} required clearfix">
	<label for="status">
		<g:message code="story.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<input disabled="true" value="${storyInstance.status}"/>
</div>
