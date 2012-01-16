<%@ page import="timelog.Project" %>

<g:javascript>
    $(document).ready(function() {
        $("select[multiple]").asmSelect();
    }); 
</g:javascript>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'nextRelease', 'error')} required">
	<label for="nextRelease">
		<g:message code="project.nextRelease.label" default="Next Release" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nextRelease" required="" value="${projectInstance?.nextRelease}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="project.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${projectInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'members', 'error')} ">	
	<g:select name="members" from="${timelog.User.list()}" multiple="multiple" 
	optionKey="id" optionValue="username" size="5" value="${projectInstance?.members*.id}" 
	class="many-to-many" title="Please select members"/>
</div>

