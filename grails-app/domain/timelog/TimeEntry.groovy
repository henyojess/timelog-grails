package timelog

class TimeEntry {

    String description
    Integer duration
    Date entryDate
    String createdBy
    String updatedBy
    Date dateCreated
    Date lastUpdated
    Task task
    
    static belongsTo = Task
    
    static constraints = {
        description blank:false
        duration nullable:false, min:1
        entryDate nullable:false
        createdBy blank:false
        updatedBy nullable:true
        task nullable:true
    }
    
    static Date today(){
        def formatter = new java.text.SimpleDateFormat('MMddyyyy')
        return formatter.parse(formatter.format(new Date()))
    }
}
