import UIKit

public extension UILabel {
    
    @IBInspectable var copyAble: Bool {
        get {
            return false
        }
        set {
            setupCopyAble(shouldCopyAble: newValue)
        }
    }
    
    @IBInspectable var localizedText: String {
        get {
            return text ?? ""
        }
        set {
            text = newValue.localized
        }
    }
    
    //MARK: CopyAble
    private func setupCopyAble(shouldCopyAble : Bool) {
        if shouldCopyAble {
            isUserInteractionEnabled = true
            addGestureRecognizer(UILongPressGestureRecognizer(
                target: self,
                action: #selector(showCopyMenu(sender:))
            ))
        }
        else {
            isUserInteractionEnabled = false
            gestureRecognizers?.forEach(removeGestureRecognizer)
        }
    }
    
    @objc private func showCopyMenu(sender: Any?) {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.setTargetRect(bounds, in: self)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(copy(_:)))
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
}


