package timelog

class Story {
    String description
    String releaseTarget = 'future'
    String status = 'No Tasks'
    boolean active = true
    String createdBy
    String updatedBy    
    Date dateCreated
    Date lastUpdated
    Project project
    
    static belongsTo = Project
    
    static hasMany = [ tasks: Task ]
    
    static constraints = {
        description blank:false
        releaseTarget blank:false
        status blank:false
        createdBy blank:false
        updatedBy nullable:true,blank:false
    }
}
