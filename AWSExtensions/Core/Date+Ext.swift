import Foundation


public extension Date {
    
    static func dateFromISOString(string: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
        let formatterDate = formatter.date(from: string)
        return formatterDate
    }
    
    func dateFromDays(_ days: Int) -> Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: days, to: self, options: [])!
    }
    
    /// add days into date
    func addDays(days : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    /// add month into date
    func addMonths(month : Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: month, to: self)!
    }
    
    /// add seconds into date
    func addSeconds(seconds : Int) -> Date {
        return Calendar.current.date(byAdding: .second, value: seconds, to: self)!
    }
    
    /// add hours into date
    func addHours(hours : Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hours, to: self)!
    }
    
    /// add minutes into date
    func addMinutes(minutes : Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    /// add years into date
    func addYears(years : Int) -> Date {
        return Calendar.current.date(byAdding: .year, value: years, to: self)!
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func toTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: self)
    }
    
    func dayName() -> (fullName : String, shortName : String) {
        let weekDay = Calendar.current.component(.weekday, from: self)
        let shorNames = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
        let fullNames = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        return (fullNames[weekDay-1], shorNames[weekDay-1])
    }
    
    func monthName() -> (fullName : String, shortName : String) {
        let monthNumber = Calendar.current.component(.month, from: self)
        let shorNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let fullNames = ["January","February","March","April","May","June","July","August", "September", "October", "November", "December"]
        return (fullNames[monthNumber-1], shorNames[monthNumber-1])
    }
    
    func UTCtoLocal() -> Date {
        return self.addSeconds(seconds: TimeZone.current.secondsFromGMT())
    }
    
    func LocaltoUTC() -> Date {
        return self.addSeconds(seconds: -TimeZone.current.secondsFromGMT())
    }
    
    func toString(formatter : K.DatetimeFormatters = .full) -> String {
        let df = DateFormatter()
        df.dateFormat = formatter.rawValue
        return df.string(from: self)
    }
    
    func toSeconds() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    
    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
    
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
             return "\(month) months ago"
        }else if (month >= 1) {
         return "1 month ago"
        }else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
           return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
        
    }
}


public extension Int64 {
    
    func toDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
    
    func timeDescription() -> String {
        
        let d = (self%(86400*30))/86400
        let h = (self%86400)/(60*60)
        let m = (self%3600)/60
        
        if d > 0 {
            if d == 1 {
                return String(format: "%d day & time %02d:%02d", d, h, m)
            }
            else {
                return String(format: "%d days & time %02d:%02d", d, h, m)
            }
        }
        else if h > 0 {
            return String(format: "%02d:%02d", h, m)
        }
        else if m > 0 {
            return String(format: "%02d mins", m)
        }
        else {
            return String(format: "%d sec", self)
        }
        
    }
}

public extension String {
    func toDate() -> Date {
        let df = DateFormatter()
        //formatter.locale = NSLocale(localeIdentifier: "en") as Locale
        df.dateFormat = K.DatetimeFormatters.full.rawValue
        return df.date(from: self) ?? Date()
    }
    
}

