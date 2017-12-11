import UIKit

extension UIWindow: Window {
    var rootView: ViewController? {
        get {
            return self.rootViewController
        }
        set {
            rootViewController = newValue as? UIViewController
        }
    }
}
