import UIKit

public enum AppStoryboard : String {
    
    case main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, customIdentifier: String? = nil, function : String = #function, line : Int = #line, file : String = #file) -> T {
        var storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        if let identifier = customIdentifier, !identifier.isEmpty {
            storyboardID = identifier
        }
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
    
}

public extension UIViewController {

    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard, withCustomIdentifier : String? = nil) -> Self {
        return appStoryboard.viewController(viewControllerClass: self, customIdentifier: withCustomIdentifier)
    }
}
