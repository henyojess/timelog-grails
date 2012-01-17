package timelog

import org.springframework.dao.DataIntegrityViolationException

@grails.plugins.springsecurity.Secured('IS_AUTHENTICATED_FULLY')
class StoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [storyInstanceList: Story.list(params), storyInstanceTotal: Story.count()]
    }

    def create() {
        def storyInstance = new Story(params)
        storyInstance.project = Project.get(params.project_id)
        [storyInstance:storyInstance]
    }

    def save() {
        def storyInstance = new Story(params)
        storyInstance.createdBy = springSecurityService.getPrincipal().username
        if (!storyInstance.save(flush: true)) {
            render(view: "create", model: [storyInstance: storyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])
        redirect(controller:'project',action: "show", id: storyInstance.project.id)
    }

    def show() {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(action: "list")
            return
        }

        [storyInstance: storyInstance]
    }

    def edit() {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(action: "list")
            return
        }

        [storyInstance: storyInstance]
    }    

    def update() {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (storyInstance.version > version) {
                storyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'story.label', default: 'Story')] as Object[],
                          "Another user has updated this Story while you were editing")
                render(view: "edit", model: [storyInstance: storyInstance])
                return
            }
        }

        storyInstance.properties = params
        storyInstance.updatedBy = springSecurityService.getPrincipal().username

        if (!storyInstance.save(flush: true)) {
            render(view: "edit", model: [storyInstance: storyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])
        redirect(controller:'project',action: "show", id: storyInstance?.project?.id)
    }

    @grails.plugins.springsecurity.Secured('ROLE_ADMIN')
    def delete() {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(action: "list")
            return
        }

        try {
            def project = storyInstance.project
            storyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(controller:'project',action: "show", id: project?.id)
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def addToNextRelease() {
        def storyInstance = Story.get(params.id)
        if(storyInstance){
            flash.message = storyInstance.addToNextRelease()
            flash.error = true                
            if(flash.message == 'SUCCESS'){
                flash.message = message(code: 'default.updated.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])
                flash.error = false
            }                
                
        }else{
            flash.message = message(code: 'default.notfound.message', args: [message(code: 'story.label', default: 'Story'), params.id])
        }
        redirect(controller:'project',action: "show", id: storyInstance?.project?.id)                   
    }
    
    def removeFromNextRelease(){
        def storyInstance = Story.get(params.id)
        if(storyInstance){
            storyInstance.removeFromNextRelease()
            flash.message = message(code: 'default.updated.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])            
        }
        redirect(controller:'project',action: "show", id: storyInstance?.project?.id)       
    }
}
