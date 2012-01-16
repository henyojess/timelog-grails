package timelog

import grails.test.mixin.*
import org.junit.*

@TestFor(BootstrapService)
@Mock([User,Role,UserRole,Project])
class BootstrapServiceTests {
    
    void testDoBootStrapRoles() {        
        service.doBootStrapRoles()
        assertTrue 'role should have been added', Role.count() > 0
        assertNotNull 'admin role should have been created',Role.findByAuthority('ROLE_ADMIN')
        assertNotNull 'user role should have been created',Role.findByAuthority('ROLE_USER')
    }
    
    void testDoBootStrapUsers(){
        //do nothing when encodePassword is called
        User.metaClass.encodePassword = {->}
        service.doBootStrapUsers()
        assertTrue 'user should have been added', User.count() > 0        
        assertNotNull 'admin should have been created',User.findByUsername('admin@henyo.com')
        assertNotNull 'user should have been created',User.findByUsername('user@henyo.com')
    }
    
    void testDoBootStrapProjects(){
        service.doBootStrapProjects()
    }
    
}
