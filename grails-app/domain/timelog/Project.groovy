package timelog

class Project {

    String name
    String createdBy
    String updatedBy
    boolean active = true
    Date dateCreated
    Date lastUpdated
    String nextRelease = '0.99.0'
    
    static hasMany = [ members:User, stories:Story ]

    static constraints = {
        name blank:false
        createdBy blank:false
        updatedBy nullable:true,blank:false
        nextRelease blank:false
    }
}
