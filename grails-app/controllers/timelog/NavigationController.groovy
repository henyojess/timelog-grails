package timelog

class NavigationController {

    def springSecurityService

    def index() { 
        def model = [:]
        if(isLoggedIn()){
            def all_active_projects = Project.findAllByActive(true,[sort:'name'])
            model.projects = all_active_projects.findAll{ p ->            
                p.members.collect{it.username}.contains(authenticatedUser.username)
            }
        }
        return model
    }
}
