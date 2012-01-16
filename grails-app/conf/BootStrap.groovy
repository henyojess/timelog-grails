import timelog.*
class BootStrap {
    def bootstrapService
    def init = { servletContext ->
        bootstrapService.doBootStrapUsers()
        bootstrapService.doBootStrapRoles()
        bootstrapService.doBootStrapProjects()
    }
    def destroy = {
    }
}
