//
//  ExplicitlySized.swift
//  PlotTabler
//

import Foundation
import Plot

protocol ExplicitlySized:Component {
    var size:Column.Size? { get }
}
