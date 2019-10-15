import UIKit

fileprivate var defaultMaxLength = [UITextField: Int]()

public extension UITextField {
    
    @IBInspectable var placeHolderColor : UIColor {
        get {
            return .gray
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : newValue])
        }
    }
    
    @IBInspectable var localizedPlaceholer: String {
        get {
            return ""
        }
        set {
            self.placeholder = newValue.localized
        }
    }
    
    @IBInspectable var paddingLR : CGFloat {
        get {
            return 0
        }
        set {
            if newValue > 0 {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
                leftView = paddingView
                rightView = paddingView
                rightViewMode = .always
                leftViewMode = .always
            }
        }
    }
    
    @IBInspectable var maxLength: Int {
        get {
            guard let l = defaultMaxLength[self] else {
                return 100 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            defaultMaxLength[self] = newValue
            addTarget(self, action: #selector(checkLength), for: .editingChanged)
        }
    }
    
    @objc private func checkLength(textField: UITextField) {
        if (textField.text ?? "").count > maxLength {
            textField.text = String(Array(textField.text ?? "").prefix(upTo: maxLength))
        }
    }

    func shake(clearText : Bool = false) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
        if clearText { self.text = "" }
        self.placeHolderColor = .red
    }
}
