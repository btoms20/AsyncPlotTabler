//
//  Colors.swift
//  PlotTabler
//

import Foundation

public enum Colors:Codable, Equatable {
    case white
    case blue
    case azure
    case indigo
    case purple
    case pink
    case red
    case orange
    case yellow
    case lime
    case green
    case teal
    case cyan
    case dark
    case muted
    case gray(Gray)
    
    case body
    case primary
    case secondary
    case custom(String)
//    case rgba(r:Int, g:Int, b:Int, a:Float = 1.0)
//    case hex(String)
    
    public var css:String {
        switch self {
//        case .rgba(let r, let g, let b, let a):
//            <#code#>
//        case .hex(let string):
//            return string
        case .body:
            return "body-color"
        case .gray(let weight):
            return "gray-\(weight.rawValue)"
        case .custom(let str):
            return str
        default:
            return "\(self)"
        }
    }
    
    public var backgroundCSS:String {
        switch self {
        case .gray:
            return css
        default:
            return "bg-\(css)"
        }
    }
    
    public var textLiteCSS:String {
        return "text-\(css)-fg"
    }
    
    public var backgroundLiteCSS:String {
        switch self {
        case .gray:
            return "\(css)-lt"
        default:
            return "bg-\(css)-lt"
        }
        //return "bg-\(css)-lt"
    }
    
    public var textCSS:String {
        return "text-\(css)"
    }
    
    public enum Gray:String, Codable {
        case g50  =  "50"
        case g100 = "100"
        case g200 = "200"
        case g300 = "300"
        case g400 = "400"
        case g500 = "500"
        case g600 = "600"
        case g700 = "700"
        case g800 = "800"
        case g900 = "900"
    }
    
    /// Returns a list of all the standard Tabler Colors
    public static let allColors:[Colors] = [
        .blue,
        .azure,
        .indigo,
        .purple,
        .pink,
        .red,
        .orange,
        .yellow,
        .lime,
        .green,
        .teal,
        .cyan,
        .dark,
        .muted,
        .gray(.g400)
    ]
    
    /// Returns a list of Tablers Primary Colors (excluding colors such as gray, muted, primary and secondary)
    public static var primaryColors:[Colors] = [
        .blue,
        .green,
        .red,
        .purple,
        .azure,
        .indigo,
        .yellow,
        .dark,
    ]
    
    /// Returns the Colors value as a String
    public var stringValue:String { self.css }
}

extension Colors {
    public var tagValue:String {
        "{{{\(self.css)}}}"
    }
}
