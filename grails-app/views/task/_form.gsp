<%@ page import="timelog.Task" %>
<g:hiddenField name="story.id" value="${taskInstance?.story?.id}"/>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea class="xxlarge" name="description" required="" value="${taskInstance?.description}"/>
</div>
<g:if test="${taskInstance.status == 'Estimate'}">
    <div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'estimate', 'error')} required">
	    <label for="estimate">
		    <g:message code="task.estimate.label" default="Estimate number of hours to complete" />
	    </label>
	    <g:field class="mini" type="number" name="estimate" min="1" max="16" required="" value="${fieldValue(bean: taskInstance, field: 'estimate')}"/>
	    <g:each in="${[16,12,8,4,2,1]}" var="i">
            <button class="btn" type="button" onclick="document.forms[1].estimate.value=${i}">${i}</button>
        </g:each>
    </div>
</g:if>
<g:else>
    <div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'estimate', 'error')} required clearfix">
	    <label for="estimate">
		    <g:message code="task.estimate.label" default="Estimate" />
		    <span class="required-indicator">*</span>
	    </label>
	    <input disabled="true" value="${taskInstance.estimate}"/>
    </div>
</g:else>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} required clearfix">
	<label for="status">
		<g:message code="task.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<input disabled="true" value="${taskInstance.status}"/>
</div>
