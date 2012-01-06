package timelog

import org.junit.*
import grails.test.mixin.*
import grails.plugins.springsecurity.SpringSecurityService

@TestFor(UserController)
@Mock([User,Role,UserRole])
class UserControllerTests {

    @Before
    void prepare(){
        //setup fake principal
        SpringSecurityService.metaClass.getPrincipal = {-> return [username:'jessie@apollo.com.ph']}
        //do nothing when encodePassword is called
        User.metaClass.encodePassword = {->}
        //override isDirty
        User.metaClass.isDirty = {s-> return true}
        
        defineBeans{
            springSecurityService(SpringSecurityService)
        }
    }

    def populateValidParams(params) {
      assert params != null
      params.username = 'jessie@apollo.com.ph'
      params.password = 'jessie@apollo.com.ph'
      params.createdBy = 'jessie@apollo.com.ph'      
    }

    void testIndex() {
        controller.index()
        assert "/user/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userInstanceList.size() == 0
        assert model.userInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.userInstance != null
    }

    void testSave() {                
        controller.save()

        assert model.userInstance != null
        assert view == '/user/create'

        response.reset()

        populateValidParams(params)
        
        controller.save()

        assert response.redirectedUrl == '/user/show/1'
        assert controller.flash.message != null
        assert User.count() == 1
    }

    void testShow() {           
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'


        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null

        params.id = user.id

        def model = controller.show()

        assert model.userInstance == user
    }

    void testEdit() {        
        controller.edit()        

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null

        params.id = user.id

        def model = controller.edit()

        assert model.userInstance == user
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        response.reset()

        //setup fake principal
        //SpringSecurityService.metaClass.getPrincipal = {-> return 'jessie@apollo.com.ph'}
        //do nothing when encodePassword is called
        //User.metaClass.encodePassword = {->}
        //User.metaClass.isDirty = {s-> return true}

        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null

        // test invalid parameters in update
        params.id = user.id
        params.username = 'foo'

        controller.update()

        assert view == "/user/edit"
        assert model.userInstance != null

        user.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/user/show/$user.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        user.clearErrors()

        populateValidParams(params)
        params.id = user.id
        params.version = -1
        controller.update()

        assert view == "/user/edit"
        assert model.userInstance != null
        assert model.userInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/user/list'

        response.reset()        
        
        populateValidParams(params)
        def user = new User(params)

        assert user.save() != null
        assert User.count() == 1

        params.id = user.id

        controller.delete()

        assert User.count() == 0
        assert User.get(user.id) == null
        assert response.redirectedUrl == '/user/list'
    }
}
