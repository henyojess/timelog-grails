package timelog
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(TimeEntry)
class TimeEntryTests {

    def timeEntry
    
    @Before
    void before(){
        timeEntry = new TimeEntry()
    }
    
    void testShouldHaveDescription() {
        assertNull 'description initially null',timeEntry.description       
        assertFalse 'description should not be null',timeEntry.validate()
        assertEquals 'nullable',timeEntry.errors['description'].code

        timeEntry.description = ''
        assertFalse 'description should not be blank',timeEntry.validate()
        assertEquals 'blank',timeEntry.errors['description'].code
    }
    
    void testShouldHaveDuration() {        
        assertNull 'duration initially null',timeEntry.duration
        assertFalse 'duration should not be null',timeEntry.validate()
        assertEquals 'nullable',timeEntry.errors['duration']?.code
        
        timeEntry.duration = 0
        assertFalse 'duration must be more than zero',timeEntry.validate()
        assertEquals 'min.notmet',timeEntry.errors['duration']?.code
    }
    
    void testShouldHaveEntryDate() {        
        assertNull 'entryDate initially null',timeEntry.entryDate
        assertFalse 'entryDate should not be null',timeEntry.validate()
        assertEquals 'nullable',timeEntry.errors['entryDate']?.code        
    }
    
    void testShouldHaveCreatedBy() {
        assertNull 'createdBy initially null',timeEntry.createdBy       
        assertFalse 'createdBy should not be null',timeEntry.validate()
        assertEquals 'nullable',timeEntry.errors['createdBy'].code

        timeEntry.createdBy = ''
        assertFalse 'createdBy should not be blank',timeEntry.validate()
        assertEquals 'blank',timeEntry.errors['createdBy'].code
    }
    
    void testValidTask() {
        timeEntry.description = 'description'
        timeEntry.duration = 4
        timeEntry.entryDate = new Date()
        timeEntry.createdBy = 'jessie@apollo.com.ph'      
        assertTrue "timeEntry should be valid:${timeEntry.errors}",timeEntry.validate()
        timeEntry.save(flush:true)
        assertNotNull 'save should be successful',timeEntry.id
    }

}
