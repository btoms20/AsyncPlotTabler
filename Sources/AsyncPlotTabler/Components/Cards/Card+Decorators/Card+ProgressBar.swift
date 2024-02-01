//
//  Card+ProgressBar.swift
//  PlotTabler
//

import Foundation
import Plot

extension Card {
    
    public struct CardProgress: Component {
        var progressBar:ProgressBar
        
        public init(style: ProgressBar.Style, color:Colors = .primary, location:ProgressBar.Location = .bottom) {
            self.progressBar = ProgressBar(style: style, color: color, location: location)
        }
        
        /*
        <div class="progress progress-sm card-progress">
            <div class="progress-bar" style="width: 38%" role="progressbar" aria-valuenow="38" aria-valuemin="0" aria-valuemax="100" aria-label="38% Complete">
                <span class="visually-hidden">38% Complete</span>
            </div>
        </div>
         */
        public func body() async -> Component {
            progressBar
                .class("progress-sm card-progress")
        }
    }
}


public struct ProgressBar: Component {
    public enum Style {
        case progress(Progress)
        case indeterminate
    }
    
    public enum Size {
        case none
        case sm
        
        var css:String {
            switch self {
            case .none: ""
            case .sm: "progress-sm"
            }
        }
    }
    
    public enum Location {
        case top
        case bottom
    }
    
    public struct Progress {
        let progress: Int
        let min: Int
        let max: Int
        
        public init(progress: Int, min: Int = 0, max: Int = 100) {
            self.progress = progress
            self.min = min
            self.max = max
        }
    }
    
    var style:Style
    var size:Size
    var color:Colors
    var location:Location
    
    public init(style: Style, color:Colors = .primary, location:Location = .bottom, size: Size = .none) {
        self.style = style
        self.size = size
        self.color = color
        self.location = location
    }
    
    public init(progress: Progress, color:Colors = .primary, location:Location = .bottom, size: Size = .none) {
        self.style = .progress(progress)
        self.size = size
        self.color = color
        self.location = location
    }
    
    public init(inditerminate color: Colors = .primary, location:Location = .bottom, size: Size = .none) {
        self.style = .indeterminate
        self.size = size
        self.color = color
        self.location = location
    }
    
    /*
    <div class="progress">
        <div class="progress-bar" style="width: 38%" role="progressbar" aria-valuenow="38" aria-valuemin="0" aria-valuemax="100" aria-label="38% Complete">
            <span class="visually-hidden">38% Complete</span>
        </div>
    </div>
     */
    public func body() async -> Component {
        switch self.style {
        case .progress(let p):
            Div {
                Div {
                    await Span("\(p.progress)% Complete")
                        .class("visually-hidden")
                }
                .class("progress-bar")
                .class(color.backgroundCSS)
                .style("width: \(p.progress)%")
                .attribute(named: "role", value: "progressbar", replaceExisting: true)
                .attribute(named: "aria-valuenow", value: "\(p.progress)", replaceExisting: true)
                .attribute(named: "aria-valuemin", value: "\(p.min)", replaceExisting: true)
                .attribute(named: "aria-valuemax", value: "\(p.max)", replaceExisting: true)
                .attribute(named: "aria-label", value: "\(p.progress)% Complete", replaceExisting: true)
            }
            .class("progress")
            .class(size.css)
        case .indeterminate:
            Div {
                Div { }
                    .class("progress-bar progress-bar-indeterminate")
                    .class(color.backgroundCSS)
            }
            .class("progress")
            .class(size.css)
        }
    }
}
