package timelog



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Task)
class TaskTests {

    def task
    
    @Before
    void before() {
        task = new Task()
    }

    void testShouldHaveDescription() {
        assertNull 'description initially null',task.description
        assertFalse 'description should not be null',task.validate()
        assertEquals 'nullable',task.errors['description'].code

        task.description = ''
        assertFalse 'description should not be blank',task.validate()
        assertEquals 'blank',task.errors['description'].code       
        
        task.description = 'description'
        task.validate()
        assertNull task.errors['description']
    }
    
    void testShouldHaveStatus() {
        assertEquals 'status initially set','Incomplete',task.status
        
        task.status = null
        assertFalse 'status should not be null',task.validate()
        assertEquals 'nullable',task.errors['status'].code

        task.status = ''
        assertFalse 'status should not be blank',task.validate()
        assertEquals 'blank',task.errors['status'].code       
        
        task.status = 'status'
        task.validate()
        assertNull task.errors['status']
    }
    
    void testShouldHaveEstimate() {
        assertNull 'estimate initially null',task.estimate
        assertFalse 'estimate should not be null',task.validate()
        assertEquals 'nullable',task.errors['estimate'].code

        task.estimate = 0
        assertFalse 'description should have a minimum of 0',task.validate()
        assertEquals 'min.notmet',task.errors['estimate'].code       
        
        task.estimate = 17
        assertFalse 'description should be max 16',task.validate()
        assertEquals 'max.exceeded',task.errors['estimate'].code
        
        task.estimate = 16
        task.validate()
        assertNull task.errors['estimate']
    }
}
