import Foundation
import UIKit

public struct K {
    
    struct URLS {
        static let BASE = "http://webapp.aws.com/api/v1"

    }
    
    struct CONFIGS {
        static let API_KEY = 2.5
    }
    
    struct PARAMS {
        static var COMMON: [String : Any] {
            return [:]
        }
    }
    
    struct SCREEN_SiZE {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
        static let maxWH = max(SCREEN_SiZE.width, SCREEN_SiZE.height)
    }
    
    struct DEVICE_TYPE {
        static let iPhone5orSE   = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SiZE.maxWH == 568.0
        static let iPhone678     = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SiZE.maxWH == 667.0
        static let iPhone678P    = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SiZE.maxWH == 736.0
        static let iPhoneX       = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SiZE.maxWH == 812.0
        static let iPhoneXSMax   = UIDevice.current.userInterfaceIdiom == .phone && SCREEN_SiZE.maxWH == 896.0
        static var hasNotch: Bool {
            return iPhoneX || iPhoneXSMax
        }
    }
}




public extension K {
    
    enum DatetimeFormatters : String {
        //https://nsdateformatter.com
        case full = "dd MMM yyyy hh:mm:ss a"
        case date = "dd MMM yyyy"
        case time = "hh:mm:ss a"
        case time24 = "HH:mm:ss"
        case fullDescriptive = "E, d MMM yyyy hh:mm:ss a"
        case dayName = "EEEE"
        case month = "MMMM"
    }
    
    enum UserType : Int {
        case unknown
        case professional
        case nonProfessional
     
        static var ary : [String] {
            return ["", "Professional", "Non Professional"]
        }
        
        var description : String {
            return K.UserType.ary[self.rawValue]
        }
    }
    
    enum API_END_POINTS : String {
        
        case login
        case profileUpdate = "user/update"
        
        var url : String {
            get { return "\(K.URLS.BASE)/\(self.rawValue)" }
        }
    }
}






