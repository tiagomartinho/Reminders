@testable import RemindersCore

class SpyRouter: Router {
    var routeWasCalled = false
    var lastRoute: Route?

    func route(to route: Route) {
        routeWasCalled = true
        lastRoute = route
    }
}
