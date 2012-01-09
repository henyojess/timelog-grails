<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="user" />
  </head>

  <body>
        <div >
            <h2>Time Entry Form</h2>
            <g:form name="entryForm" action="saveEntry" method="POST">
                <g:hiddenField name="id" value="${timeEntry.id}"/>
                <h4>Description:</h4>
                <g:textArea name="description" placeholder="Description" class="input-xxlarge" value="${timeEntry.description}"/>
                <h4>Duration:</h4>
                <g:textField name="duration" class="mini" value="${timeEntry.duration}"/>
                <g:each in="${(8..1)}" var="i">
                    <button class="btn" type="button" onclick="entryForm.duration.value=${i}">${i}</button>
                </g:each>
                <h4>Entry Date:</h4>
                <g:datePicker name="entryDate" value="${timeEntry.entryDate}"  noSelection="['':'--']" precision="day" relativeYears="[-1..0]" class="mini"/>
                <h4>&nbsp;</h4>
                <button class="btn" type="submit">Save</button>&nbsp;&nbsp;&nbsp;
                <g:link action="index">Cancel</g:link>
            </g:form>
        </div>
  </body>
</html>
