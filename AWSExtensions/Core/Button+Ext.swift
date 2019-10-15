import UIKit


extension UIButton {

    @IBInspectable var localizedTitle: String {
        get {
            return title(for: .normal) ?? ""
        }
        set {
            setTitle(newValue.localized, for: .normal)
        }
    }
    
}

