import Foundation

extension UserDefaults {
    
    var genericKeyParams : String? {
        set {
            UserDefaults.standard.set(newValue, forKey: "xyz")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.value(forKey: "xyz") as? String
        }
    }
}

