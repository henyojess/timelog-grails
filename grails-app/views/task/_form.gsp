<%@ page import="timelog.Task" %>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'story', 'error')} required">
	<label for="story">
		<g:message code="task.story.label" default="Story" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="story" name="story.id" from="${timelog.Story.list()}" 
	optionKey="id" optionValue="description" required="" value="${taskInstance?.story?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${taskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="task.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${taskInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'estimate', 'error')} required">
	<label for="estimate">
		<g:message code="task.estimate.label" default="Estimate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estimate" min="1" max="16" required="" value="${fieldValue(bean: taskInstance, field: 'estimate')}"/>
</div>

