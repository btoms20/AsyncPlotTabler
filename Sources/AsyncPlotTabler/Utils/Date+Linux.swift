// Swift 6.0+ contains DateFormatStyle so we don't need this shim anymore
#if os(Linux) && swift(<6.0)
import Foundation

extension Date {
    
    public enum DateFormatStyle {
        case abbreviated
        case complete
        case long
        case numeric
        case omitted
        
        var dfString:String? {
            switch self {
            case .abbreviated: //Jan 17, 2021
                "MMM d, yyyy"
            case .complete: //Sunday, January 17, 2021
                "EEEE, MMM d, yyyy"
            case .long: //January 17, 2021
                "MMMM d, yyyy"
            case .numeric: //1/17/2021
                "M/d/yyyy"
            case .omitted:
                nil
            }
        }
        
        var dateStyle:DateFormatter.Style {
            switch self {
            case .abbreviated: //Jan 17, 2021
                return .medium
            case .complete: //Sunday, January 17, 2021
                return .full
            case .long: //January 17, 2021
                return .long
            case .numeric: //1/17/2021
                return .short
            case .omitted:
                return .none
            }
        }
    }
    
    public enum TimeFormatStyle {
        case complete
        case shortened
        case standard
        case omitted
        
        var dfString:String? {
            switch self {
            case .complete: // 4:03:12 PM CST
                "h:mm:ss a Z"
            case .shortened: // 4:03 PM
                "h:mm a"
            case .standard: // 4:03:12 PM
                "h:mm:ss a"
            case .omitted:
                nil
            }
        }
        
        var timeStyle:DateFormatter.Style {
            switch self {
            case .complete: // 4:03:12 PM CST
                return .full
            case .shortened: // 4:03 PM
                return .short
            case .standard: // 4:03:12 PM
                return .medium
            case .omitted:
                return .none
            }
        }
    }
    
    public func formatted(date: DateFormatStyle, time: TimeFormatStyle) -> String {
        let df = DateFormatter()
        df.dateStyle = date.dateStyle
        df.timeStyle = time.timeStyle
        df.locale = Locale.autoupdatingCurrent
        return df.string(from: self)
    }
    
    public func formatted() -> String {
        return self.formatted(date: .abbreviated, time: .shortened)
    }
}

extension Double {
    public func formatted() -> String {
        let nf = NumberFormatter()
        nf.maximumFractionDigits = 5
        nf.locale = .current
        nf.numberStyle = .decimal
        return nf.string(from: NSNumber(floatLiteral: self)) ?? "???"
    }
}
#endif
