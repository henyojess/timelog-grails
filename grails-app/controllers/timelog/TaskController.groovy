package timelog

import org.springframework.dao.DataIntegrityViolationException

@grails.plugins.springsecurity.Secured('IS_AUTHENTICATED_FULLY')
class TaskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taskInstanceList: Task.list(params), taskInstanceTotal: Task.count()]
    }

    def create() {
        def taskInstance = new Task(params)
        taskInstance.story = Story.get(params.story_id)
        [taskInstance: taskInstance ]
    }

    def save() {
        def taskInstance = new Task(params)
        taskInstance.createdBy = springSecurityService.getPrincipal().username
        if (!taskInstance.save(flush: true)) {
            render(view: "create", model: [taskInstance: taskInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(controller:"project", action: "show", id: taskInstance?.story?.project?.id)
    }

    def show() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def edit() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def complete(){
        params.complete = true
        forward(action:'update')
    }
    
    def incomplete(){
        params.incomplete = true
        forward(action:'update')
    }

    def update() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (taskInstance.version > version) {
                taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'task.label', default: 'Task')] as Object[],
                          "Another user has updated this Task while you were editing")
                render(view: "edit", model: [taskInstance: taskInstance])
                return
            }
        }

        taskInstance.properties = params
        if(params.complete)
            taskInstance.status = 'Completed'
        if(params.incomplete)
            taskInstance.status = 'Incomplete'
        taskInstance.updatedBy = springSecurityService.getPrincipal().username
        if (!taskInstance.save(flush: true)) {
            render(view: "edit", model: [taskInstance: taskInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(controller:'project',action: "show", id: taskInstance?.story?.project.id)
    }

    @grails.plugins.springsecurity.Secured('ROLE_ADMIN')
    def delete() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "list")
            return
        }

        try {
            def story = taskInstance.story
            def project = story.project            
            taskInstance.timeEntries.each{te->
                te.task = null
            }
            story.removeFromTasks(taskInstance)
            taskInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(controller:'project',action: "show", id: project?.id)
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def addEntry(){        
        TimeEntry timeEntry = new TimeEntry()
        timeEntry.entryDate = new Date()
        timeEntry.createdBy = authenticatedUser.username
        timeEntry.task = Task.get(params.task_id)
        timeEntry.description = 'worked on ' + timeEntry.task.description
        render(view:'timeEntryForm',model:[timeEntry:timeEntry])
    }
    
    def saveEntry(){
        def timeEntry = new TimeEntry(params)
        timeEntry.createdBy = authenticatedUser.username
        if(timeEntry.save(flush:true)){
            if(params.taskComplete)
                timeEntry.task.status = 'Completed'
            else{
                if(timeEntry.task.status == 'Pending'){
                    timeEntry.task.status = 'Incomplete'
                }
            }
            flash.message = 'Entry saved successfully'
            redirect(controller:'project',action: "show", id: timeEntry.task?.story?.project?.id)
        }else{            
            render(view:'timeEntryForm',model:[timeEntry:timeEntry])
        }
    }    
}
