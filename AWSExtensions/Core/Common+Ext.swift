import Foundation

public extension NSObject {
    
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

public extension Array where Element: Equatable {
    
    @discardableResult mutating func remove(object: Element) -> Bool {
        if let index = firstIndex(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }
    
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        
        return arrayOrdered
    }
    
    func merge<T>(_ array: [T]...) -> [T] {
        return array.flatMap { $0 }
    }
}



public extension URL {
    func urlQueryParameterWith(name: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == name })?.value
    }
}


public extension Dictionary {
    
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}



prefix operator ++
postfix operator ++

public extension Int {
    static prefix func ++(x: inout Int)->Int{
        x += 1
        return x
    }
    static postfix func ++(x: inout Int)->Int{
        x += 1
        return x-1
    }
    var stringValue: String {
        return "\(self)"
    }
    var int64Value: Int64 {
        return Int64(self)
    }
    var floatValue: Float {
        return Float(self)
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self)
    }
    var doubleValue: Double {
        return Double(self)
    }
    var boolValue: Bool {
        return self != 0
    }
}


public extension Int64 {
    static prefix func ++(x: inout Int64)->Int64{
        x += 1
        return x
    }
    static postfix func ++(x: inout Int64)->Int64{
        x += 1
        return x-1
    }
    var stringValue: String {
        return "\(self)"
    }
    var floatValue: Float {
        return Float(self)
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self)
    }
    var doubleValue: Double {
        return Double(self)
    }
}

public extension Float {
    static prefix func ++(x: inout Float)->Float{
        x += 1
        return x
    }
    static postfix func ++(x: inout Float)->Float{
        x += 1
        return x-1
    }
    var stringValue: String {
        return "\(self)"
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self)
    }
    var doubleValue: Double {
        return Double(self)
    }
    var intValue: Int {
        return Int(self)
    }
}

public extension CGFloat {
    static prefix func ++(x: inout CGFloat)->CGFloat{
        x += 1
        return x
    }
    static postfix func ++(x: inout CGFloat)->CGFloat{
        x += 1
        return x-1
    }
    var stringValue: String {
        return "\(self)"
    }
    var floatValue: Float {
        return Float(self)
    }
    var doubleValue: Double {
        return Double(self)
    }
    var intValue: Int {
        return Int(self)
    }
}

public extension Double {
    static prefix func ++(x: inout Double)->Double{
        x += 1
        return x
    }
    static postfix func ++(x: inout Double)->Double{
        x += 1
        return x-1
    }
    var stringValue: String {
        return "\(self)"
    }
    var floatValue: Float {
        return Float(self)
    }
    var cgfloatValue: CGFloat {
        return CGFloat(self)
    }
    var intValue: Int {
        return Int(self)
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
