
<%@ page import="timelog.Project" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="user"/>
		<meta name="menu" content="My Projects"/>
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
            ul.stories {

            }
            ul.stories li.story {
                padding:0;
                margin:0;
                margin-bottom:1.5em;
            }
            ul.stories span {
                padding-left:0.5em;
                padding-right:0.5em;
            }
            ul.stories span.header {
                display:block;            
                background:#C0E0F0;
                padding-top:0.3em;
                padding-bottom:0.8em;
            }        
            ul.stories span.description {
                display:block;
            }
            ul.stories span.footer {
                display:block;
                text-align:right;
                padding-bottom:0.3em;
            }
            
            ul.stories table {
                background-color:#fff;
            }
            table.tasks {
                //display:none;
            }
            table.tasks thead th{
                text-align:center;
            }            
        </style>
        <script>
            function toggleTaskTable(id){
                var task_table = $('#'+id);
                task_table.toggle();
                if(task_table.is(':visible'))
                    $('#'+id+'_toggle').html('Hide Tasks');
                else
                    $('#'+id+'_toggle').html('Show Tasks');
                return false;
            }
        </script>
	</head>
	<body>
	    <div class="page-header" style="padding-top:5px">
	        <h4>
	            <g:fieldValue bean="${projectInstance}" field="name"/>	            
	            <div style="float:right">		            
                    <g:link controller="story" action="create" 
                        params="${[project_id:projectInstance?.id]}"
                        class="success btn small">
                        New Story
                    </g:link>
                    <sec:ifAllGranted roles="ROLE_ADMIN">                    
                        <g:link class="btn small" action="edit" id="${projectInstance?.id}">
                            <g:message code="project.button.edit.label" default="Edit Project" />
	                    </g:link>
                    </sec:ifAllGranted>
                </div>
	        </h4>	        		

		    <div class="row">
	            <div class="span3">
        	        <span id="nextRelease-label" class="property-label">
		                <g:message code="project.nextRelease.label" default="Next Release:"/>
		            </span>
		            <strong id="nextRelease-value" class="property-value">
			            <g:fieldValue bean="${projectInstance}" field="nextRelease"/>
		            </strong>		            
	            </div>
	            <div class="span11">
	                <span id="Members-label" class="property-label">
		                ${members.size()}
		                <g:message code="project.members.label" default="Member(s):"/>		        
		            </span>
		            <strong id="members-value" class="property-value">
		                ${members.join(', ')}
		            </strong>
	            </div>       
	        </div>	
		    
		    <g:if test="${flash.message}">
			    <span class="label ${flash.error?'important':'success'}" role="status">${flash.message}</span>
			</g:if>			
	    </div>
	    <div class="row">
	        <div class="span14">
	            <ul class="unstyled stories">
    	            <g:each in="${projectInstance.stories}" var="s">
	                    <li class="alert-message block-message info story">
	                        <span class="header">
	                            Status: <strong>${s.status}</strong>( <strong>${s.releaseTarget}</strong> ) &nbsp;
	                            #Task(s): <strong>${s.completedTasks().size()}/${s.tasks?.size()}</strong>	                            
	                            <g:if test="${s.workedOnBy()}">
    	                            &nbsp; Worked on by: <strong>${s.workedOnBy().join(',')}</strong>
	                            </g:if>        	                                
                                <g:link controller="story" action="edit" 
                                    id="${s?.id}" class="mini btn" style="float:right">
                                    Edit Story
                                </g:link>	                            
	                        </span>
	                        <span class="description">
	                            ${s.description}	                                                        
	                        </span>
	                        <span class="footer">
	                            <g:link controller="task" action="create" 
	                                params="${[story_id:s?.id]}"
	                                class="mini btn success">
	                                New Task
	                            </g:link>
	                            <g:if test="${s.tasks}">
	                            <a id="tasks_for_story_${s?.id}_toggle" 
	                                href="#ShowTasks" class="mini btn" 
	                                onclick="toggleTaskTable('tasks_for_story_${s?.id}')">
	                            Hide Tasks</a>
	                            </g:if>
	                            
	                        </span>
	                        <g:if test="${s.tasks}">
	                        <table id="tasks_for_story_${s?.id}" class="condensed-table bordered-table zebra-striped tasks">
                                <thead>
                                    <tr>
                                        <th>Description</th>
                                        <th width="55px">Status</th>
                                        <th width="21px">E</th>
                                        <th width="21px">A</th>
                                        <th width="80px">Actions</th>
                                    </tr>    
                                </thead>
                                <tbody>
                                    <g:each in="${s.tasks}" var="t" status="i">
                                        <tr>
                                            <td>${t?.description}</td>
                                            <td>${t?.status}</td>
                                            <td style="text-align:center;">${t?.estimate}</td>
                                            <td style="text-align:center;">${t?.actualHours()}</td>
                                            <td>
                                                <g:link controller="task" action="edit" 
            	                                id="${t?.id}" class="mini btn">
	                                                Edit
	                                            </g:link>
                                                <g:if test="${t?.status in ['Pending','Incomplete']}">
                                                    <g:link controller="task" action="addEntry" 
                	                                params="${[task_id:t?.id]}"
	                                                    class="mini btn success">
	                                                    Time
	                                                </g:link>
	                                            </g:if>
	                                            
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                            </g:if>
	                    </li>
	                </g:each>
	            </ul>
	        </div>
	    </div>
	    
	</body>
</html>
