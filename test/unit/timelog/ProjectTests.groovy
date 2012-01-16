package timelog



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Project)
class ProjectTests {

    def project

    @Before
    void before() {
        project = new Project() 
    }

    void testShouldHaveName() {
        assertNull 'name initially null',project.name       
        assertFalse 'name should not be null',project.validate()
        assertEquals 'nullable',project.errors['name'].code

        project.name = ''
        assertFalse 'name should not be blank',project.validate()
        assertEquals 'blank',project.errors['name'].code       
        
        project.name = 'name'
        project.validate()
        assertNull project.errors['name']        
    }
    
    void testShouldHaveCreatedBy() {
        assertNull 'createdBy initially null',project.createdBy
        assertFalse 'createdBy should not be null',project.validate()
        assertEquals 'nullable',project.errors['createdBy'].code

        project.createdBy = ''
        assertFalse 'createdBy should not be blank',project.validate()
        assertEquals 'blank',project.errors['createdBy'].code       
        
        project.createdBy = 'createdBy'
        project.validate()
        assertNull 'there should be no errors',project.errors['createdBy']
    }
    
    void testShouldHaveUpdatedBy() {
        assertNull 'updatedBy initially null',project.updatedBy
        assertFalse 'updatedBy can be null',project.validate()                
        assertNull 'updatedBy should have no errors',project.errors['updatedBy']
        
        project.updatedBy = ''
        assertFalse 'updatedBy should not be blank',project.validate()
        assertEquals 'blank',project.errors['updatedBy'].code
        
        project.updatedBy = 'updatedBy'
        project.validate()
        assertNull 'updatedBy should have no errors',project.errors['updatedBy']
    }
    
    void testShouldHaveActive() {
        assertTrue 'active initially true',project.active                
    }
    
    void testShouldHaveNextRelease() {
        assertEquals 'nextRelease initially set','0.99.0',project.nextRelease
        
        project.nextRelease = null
        assertFalse 'nextRelease should not be null',project.validate()
        assertEquals 'nullable',project.errors['nextRelease'].code

        project.nextRelease = ''
        assertFalse 'nextRelease should not be blank',project.validate()
        assertEquals 'blank',project.errors['nextRelease'].code       
        
        project.nextRelease = 'nextRelease'
        project.validate()
        assertNull 'there should be no errors',project.errors['nextRelease']
    }
    
}
