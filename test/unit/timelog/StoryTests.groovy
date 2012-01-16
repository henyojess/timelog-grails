package timelog

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Story)
class StoryTests {
    
    def story
    
    @Before
    void before() {
        story = new Story() 
    }
    
    void testShouldHaveDescription() {
        assertNull 'description initially null',story.description
        assertFalse 'description should not be null',story.validate()
        assertEquals 'nullable',story.errors['description'].code

        story.description = ''
        assertFalse 'description should not be blank',story.validate()
        assertEquals 'blank',story.errors['description'].code       
        
        story.description = 'description'
        story.validate()
        assertNull story.errors['description']
    }
    
    void testShouldHaveReleaseTarget() {
        assertEquals 'releaseTarget initially set','future',story.releaseTarget
        
        story.releaseTarget = null
        assertFalse 'releaseTarget should not be null',story.validate()
        assertEquals 'nullable',story.errors['releaseTarget'].code

        story.releaseTarget = ''
        assertFalse 'releaseTarget should not be blank',story.validate()
        assertEquals 'blank',story.errors['releaseTarget'].code       
        
        story.releaseTarget = 'releaseTarget'
        story.validate()
        assertNull story.errors['releaseTarget']
    }
    
    void testShouldHaveStatus() {
        assertEquals 'status initially set','No Tasks',story.status
        
        story.status = null
        assertFalse 'status should not be null',story.validate()
        assertEquals 'nullable',story.errors['status'].code

        story.status = ''
        assertFalse 'status should not be blank',story.validate()
        assertEquals 'blank',story.errors['status'].code       
        
        story.status = 'status'
        story.validate()
        assertNull story.errors['status']
    }
    
    void testShouldHaveActive() {
        assertTrue 'active initially true',story.active                
    }
    
    void testShouldHaveCreatedBy() {
        assertNull 'createdBy initially null',story.createdBy
        assertFalse 'createdBy should not be null',story.validate()
        assertEquals 'nullable',story.errors['createdBy'].code

        story.createdBy = ''
        assertFalse 'createdBy should not be blank',story.validate()
        assertEquals 'blank',story.errors['createdBy'].code       
        
        story.createdBy = 'createdBy'
        story.validate()
        assertNull 'there should be no errors',story.errors['createdBy']
    }
    
    void testShouldHaveUpdatedBy() {
        assertNull 'updatedBy initially null',story.updatedBy
        assertFalse 'updatedBy can be null',story.validate()                
        assertNull 'updatedBy should have no errors',story.errors['updatedBy']
        
        story.updatedBy = ''
        assertFalse 'updatedBy should not be blank',story.validate()
        assertEquals 'blank',story.errors['updatedBy'].code
        
        story.updatedBy = 'updatedBy'
        story.validate()
        assertNull 'updatedBy should have no errors',story.errors['updatedBy']
    }
    
    
}
