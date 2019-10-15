import UIKit

public extension String {
    
    static prefix func ++(x: inout String) -> String {
        var value = x.intValue
        value = value + 1
        x = "\(value)"
        return x
    }
    
    static postfix func ++(x: inout String) -> String{
        var value = x.intValue
        value = value + 1
        x = "\(value)"
        return "\(value - 1)"
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isEmpty : Bool {
        return self.count == 0
    }
    
    var isValid : Bool {
        return self.count > 0
    }
    
    func validateURLSuffix() -> String {
        return hasSuffix("/") ? self : "\(self)/"
    }
    
    var length: Int { return self.count }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var url: URL? {
        return URL(string: self)
    }
    
    var trim : String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var intValue: Int {
        if let value = Int(self) {
            return value
        }
        return 0
    }
    
    var doubleValue: Double {
        if let value = Double(self) {
            return value
        }
        return 0.0
    }
    
    var floatValue: Float {
        if let value = Float(self) {
            return value
        }
        return 0
    }
    
    var CGfloatValue: CGFloat {
        return CGFloat(self.floatValue)
    }
    
    
    fileprivate var boolValue: Bool {
        let value = self.intValue
        return value >= 1
    }
    
    var bool: Bool? {
        switch self.lowercased() {
        case "true", "t", "yes", "y", "1":
            return true
        case "false", "f", "no", "n", "0":
            return false
        default:
            return self.boolValue
        }
    }
    
    func increamentByOne() -> String {
        return "\(self.intValue + 1)"
    }
    
    func attributed(with attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let attr = NSAttributedString(string: self, attributes: attributes)
        return attr
    }

}

