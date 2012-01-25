package timelog

@grails.plugins.springsecurity.Secured('IS_AUTHENTICATED_FULLY')
class HomeController {

    def index() {
        def model = [:]        
        def today = TimeEntry.today()
        model.time_entries_today = TimeEntry.withCriteria{
            ge('entryDate',today)
            eq('createdBy',authenticatedUser.username)
            order('id','desc')
        }
        model.score = 0
        model.time_entries_today.each{ model.score += it.duration }
        model.time_entries_previous = TimeEntry.withCriteria{
            lt('entryDate',today)
            eq('createdBy',authenticatedUser.username)
            and{
                order('entryDate','desc')
                order('id','desc')
            }
            maxResults(8)
        }
        return model
    }
    
    private def parseTextInput(String textInput){
        def result = [:] 
        def matches = textInput =~ /(.*)([0-9])h/
        if(matches){
            result.description = matches[0][1].trim()
            result.duration = matches[0][2].trim()
        }else{
            result.description = textInput
        }       
        return result
    }
    
    def editEntry(){
        def timeEntry = TimeEntry.get(params.id)
        if(timeEntry)
            render(view:'timeEntryForm',model:[timeEntry:timeEntry])
        else
            redirect(action:'index')
    }
    
    def saveEntry(){
        TimeEntry timeEntry = TimeEntry.get(params.id)
        if(timeEntry){
            timeEntry.properties = params
            timeEntry.createdBy = authenticatedUser.username
            if(timeEntry.save(flush:true)){
                flash.message = 'Entry saved successfully'
                redirect(action:'index')
            }else
                render(view:'timeEntryForm',model:[timeEntry:timeEntry])                
        }else{
            timeEntry = new TimeEntry(params)
            timeEntry.createdBy = authenticatedUser.username
            if(timeEntry.save(flush:true)){
                flash.message = 'Entry saved successfully'
                redirect(action:'index')
            }else
                render(view:'timeEntryForm',model:[timeEntry:timeEntry])            
        }
    }
    
    def addEntry(){        
        TimeEntry timeEntry = new TimeEntry(parseTextInput(params.textInput))
        timeEntry.entryDate = new Date()
        timeEntry.createdBy = authenticatedUser.username
        if(params.task_id)
            timeEntry.task = Task.get(params.task_id)
        if(timeEntry.save(flush:true))
            redirect(action:'index')
        else
            render(view:'timeEntryForm',model:[timeEntry:timeEntry])
    }
    
    def deleteEntry(){
        TimeEntry timeEntry = TimeEntry.get(params.id)
        if(timeEntry){
            timeEntry.delete(flush:true)
        }
        redirect(action:'index')
    }
}
