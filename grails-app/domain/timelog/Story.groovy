package timelog

class Story {
    String description
    String releaseTarget = 'future'
    String status = 'Unplanned'
    boolean active = true
    String createdBy
    String updatedBy    
    Date dateCreated
    Date lastUpdated
    Project project
    List tasks
    
    static statusList = ['Unplanned','Planned','In Progress','Completed']
    
    static belongsTo = Project
    
    static hasMany = [ tasks: Task ]
    
    static constraints = {
        description blank:false
        releaseTarget blank:false
        status blank:false, inList: statusList
        createdBy blank:false
        updatedBy nullable:true,blank:false
    }
    
    def addToNextRelease(){
        def result = 'SUCCESS'
        if(tasks){
            def tasks_with_no_estimates = unestimatedTasks()
            if(tasks_with_no_estimates){
                result = 'Some tasks have no estimates'
            }else{            
                status = 'Planned'
                releaseTarget = project.nextRelease
            }
        }else{
            result = 'No tasks added'
        }
        return result
    }
    
    def removeFromNextRelease(){
        status = 'Unplanned'
        releaseTarget = 'future'
    }
    
    def completedTasks(){
        return tasks.findAll{t->
            t.status == 'Completed'
        }
    }
    
    def unestimatedTasks(){
        return tasks.findAll{t->
            t.estimate == null
        }
    }
    
    def workedOnBy(){
        def workers = [] as Set
        tasks.each{ t->
            t.timeEntries.each{e->
                workers.add(e.createdBy.split('@')[0])
            }
        }
        return workers
    }
}
