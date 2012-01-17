package timelog

class Task {
    
    String description
    String status = 'Incomplete'
    Integer estimate
    String estimatedBy
    Story story
    
    String createdBy
    String updatedBy    
    Date dateCreated
    Date lastUpdated
        
    static belongsTo = Story
    
    static hasMany = [ timeEntries:TimeEntry ]
    
    static constraints = {
        description blank:false
        status blank:false
        estimate nullable:true, min:1 ,max:16
        estimatedBy nullable:true, blank:false
        createdBy blank:false
        updatedBy nullable:true,blank:false       
    }
}
