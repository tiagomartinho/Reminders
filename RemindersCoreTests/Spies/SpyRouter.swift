@testable import RemindersCore

class SpyRouter: Router {

    var routeWasCalled = false
    var lastView: View?
    
    func route(to view: View) {
        routeWasCalled = true
        lastView = view
    }
}
