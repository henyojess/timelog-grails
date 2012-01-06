package timelog

class BootstrapService {

    def doBootStrapRoles(){
        if(Role.count())
            return
        def role_admin = new Role(authority:'ROLE_ADMIN')
        role_admin.save(failOnError:true,flush:true)
        def admin = User.findByUsername('admin@henyo.com')
        UserRole.create(admin,role_admin,true)
        
        def role_user = new Role(authority:'ROLE_USER')
        role_user.save(failOnError:true,flush:true)
        def user = User.findByUsername('user@henyo.com')
        UserRole.create(user,role_user,true)
    }
    def doBootStrapUsers(){        
        if(User.count())
            return
        def usernames = [
            'admin@henyo.com',
            'user@henyo.com'
        ]
        usernames.each{ username ->
            def user = new User(username:username,password:username,createdBy:username)
            user.save(failOnError:true,flush:true)
        }        
    }
}
