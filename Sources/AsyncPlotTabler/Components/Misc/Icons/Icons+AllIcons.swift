//
//  Icons+AllIcons.swift
//  PlotTabler
//

import Foundation

public struct NamedIcon {
    public let name:String
    public let icon:Icons
}

extension Icons {
    public static let allIcons:[NamedIcon] =
          Icons.IconSet1
        + Icons.IconSet2
        + Icons.IconSet3
        + Icons.IconSet4
        + Icons.IconSet5
}
