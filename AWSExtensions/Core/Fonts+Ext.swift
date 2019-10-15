import UIKit

public extension UIFont {

    class var regularButtonFont : UIFont {
        return UIFont.mediumFont(size: 10)
    }
    
    // MARK: ------------------------------
    
    class func lightFont(size: Float) -> UIFont {
        return UIFont(name: "MuseoSans-100", size: CGFloat(size)) ?? UIFont()
    }
    
    class func regularFont(size: Float) -> UIFont {
        return UIFont(name: "MuseoSans-300", size: CGFloat(size)) ?? UIFont()
    }
    
    class func boldFont(size: Float) -> UIFont {
        return UIFont(name: "MuseoSans-700", size: CGFloat(size)) ?? UIFont()
    }
    
    class func mediumFont(size: Float) -> UIFont {
        return UIFont(name: "MuseoSans-500", size: CGFloat(size)) ?? UIFont()
    }
    
    class func iconFont(size: Float) -> UIFont {
        return UIFont(name: "icofont", size: CGFloat(size)) ?? UIFont()
    }
    
}


