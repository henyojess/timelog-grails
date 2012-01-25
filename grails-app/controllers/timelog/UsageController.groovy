package timelog

class UsageController {

    def index() { 
        def model = [:]
        def today = TimeEntry.today()     
        model.today = today   
        def all_users = User.findAllByEnabled(true).collect{ it.username.split('@')[0] }
        model.users_with_entry = []
        model.users_without_entry = []
        (0..7).each{
            def users_with_entry
            model.users_with_entry[it] = listUsersWithEntry(today - (it))
            model.users_without_entry[it] = all_users - model.users_with_entry[it]
        }
        return model    
    }
    
    private def listUsersWithEntry = { date ->
	    def time_entries = TimeEntry.withCriteria{
            ge('entryDate',date)
            lt('entryDate',date+1)
            order('id','desc')
        }
	    def users_with_entry = []
        time_entries.each{
            def name = it.createdBy.split('@')[0]
            if(!users_with_entry.contains(name)){
                users_with_entry.add(name)
            }
        }
        return users_with_entry
	}
}
