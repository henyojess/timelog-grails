<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="user" />
    <meta name="menu" content="Home"/>
  </head>

  <body>
        <div >
            <h4>
                Time Entry
                <g:if test="${timeEntry?.task}">
                    for Task#${timeEntry?.task.id}
                </g:if>
            </h4>
            <g:if test="${timeEntry?.task}">
                <em>${timeEntry?.task.description}</em>
            </g:if>
            <g:form name="entryForm" action="saveEntry" method="POST">
                <g:hiddenField name="id" value="${timeEntry.id}"/>
                <g:hiddenField name="task.id" value="${timeEntry?.task?.id}"/>
                <h4>Description:</h4>
                <g:textArea name="description" placeholder="Description" class="input-xxlarge" value="${timeEntry.description}"/>
                <h4>Duration:</h4>
                <g:textField name="duration" class="mini" value="${timeEntry.duration}"/>
                <g:each in="${(8..1)}" var="i">
                    <button class="btn" type="button" onclick="entryForm.duration.value=${i}">${i}</button>
                </g:each>
                <h4>Entry Date:</h4>
                <g:datePicker name="entryDate" value="${timeEntry.entryDate}"  noSelection="['':'--']" precision="day" relativeYears="[-1..0]" class="mini"/>
                <h4>Complete Task: <g:checkBox name="taskComplete"/> </h4>                
                <button class="primary btn" type="submit">Save</button>
                <g:link controller="project" action="show" id="${timeEntry.task?.story?.project?.id}" class="btn" >
                    <g:message code="task.button.cancel.label" default="Cancel" />
	            </g:link>
            </g:form>
        </div>
  </body>
</html>
