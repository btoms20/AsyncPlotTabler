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
    
    case primary
    case secondary
    case custom(String)
//    case rgba(r:Int, g:Int, b:Int, a:Float = 1.0)
//    case hex(String)
    
    var css:String {
        switch self {
//        case .rgba(let r, let g, let b, let a):
//            <#code#>
//        case .hex(let string):
//            return string
        case .gray(let weight):
            return "gray-\(weight.rawValue)"
        case .custom(let str):
            return str
        default:
            return "\(self)"
        }
    }
    
    var backgroundCSS:String {
        switch self {
        case .gray:
            return css
        default:
            return "bg-\(css)"
        }
    }
    
    var textLiteCSS:String {
        return "text-\(css)-fg"
    }
    
    var backgroundLiteCSS:String {
        switch self {
        case .gray:
            return "\(css)-lt"
        default:
            return "bg-\(css)-lt"
        }
        //return "bg-\(css)-lt"
    }
    
    var textCSS:String {
        return "text-\(css)"
    }
    
    static public let allColors:[Colors] = [
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
        .muted
    ]
    
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
}

extension Colors {
    var tagValue:String {
        "{{{\(self.css)}}}"
    }
}
