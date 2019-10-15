import Foundation
import UIKit

public extension UIView {
    
    func maskViewAccordingToShape(shape: UIImage) {
        let maskEffect = UIImageView(frame: self.bounds)
        maskEffect.image = shape
        self.mask = maskEffect
    }
    
    @IBInspectable var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            if newValue > 0 {
                layer.cornerRadius = newValue
            }
        }
    }
    
    @IBInspectable var border: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            if newValue > 0 {
                layer.borderWidth = newValue
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var circle: Bool {
        get {
            return layer.cornerRadius == bounds.size.height/2
        }
        set {
            if newValue {
                layer.cornerRadius = bounds.size.height/2
            }
        }
    }
    
    @IBInspectable var shadow: Bool {
        get {
            return false
        }
        set {
            if newValue {
                layer.shadowOffset = CGSize(width: 0.85, height: 1.7)
                layer.borderColor = backgroundColor?.cgColor
                layer.shadowRadius = 3
                layer.shadowOpacity = 1
            }
        }
    }
    
}


