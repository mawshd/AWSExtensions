import UIKit
public extension UIApplication {
        
    var topViewController: UIViewController? {
        if keyWindow?.rootViewController == nil{
            return keyWindow?.rootViewController
        }
        
        var pointedViewController = keyWindow?.rootViewController
        
        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
        
    }
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
    
    //// Right to left
    static var isRTL: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft
    }
    //// Left to right
    static var isLTR: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.leftToRight
    }
    
    static var appVersion: String {
        if let infoDic = Bundle.main.infoDictionary, let version = infoDic["CFBundleShortVersionString"] as? String {
            return version
        }
        return ""
    }
    
    static var appName: String {
        if let infoDic = Bundle.main.infoDictionary, let name = infoDic["CFBundleName"] as? String {
            return name
        }
        return ""
    }
    
    
}



extension UIWindow {
    
    func set(rootViewController newRootViewController: UIViewController, withTransition transition: CATransition? = nil) {
        
        let previousViewController = rootViewController
        
        if let transition = transition {
            layer.add(transition, forKey: kCATransition)
        }
        
        rootViewController = newRootViewController
        
        if UIView.areAnimationsEnabled {
            UIView.animate(withDuration: CATransaction.animationDuration()) {
                newRootViewController.setNeedsStatusBarAppearanceUpdate()
            }
        } else {
            newRootViewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
        if let previousViewController = previousViewController {
            previousViewController.dismiss(animated: false) {
                previousViewController.view.removeFromSuperview()
            }
        }
    }
}
