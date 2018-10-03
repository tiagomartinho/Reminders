import UIKit

extension UIWindow: Window {
    var rootView: ViewController? {
        get {
            return rootViewController
        }
        set {
            rootViewController = newValue as? UIViewController
        }
    }
}
