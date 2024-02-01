//
//  Form+DatePicker.swift
//  AsyncPlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    public struct DatePicker: Component {
        
        @EnvironmentValue(.dependencies) var deps
        
        public enum Style {
            case system
            case regular
            case inline
        }
        
        let uuid:UUID
        let name:String
        let date:Date?
        let style:Style
        let disabled:Bool
        
        public init(uuid:UUID = UUID(), style:Style = .regular, name:String, date:Date = Date(), disabled:Bool = false) {
            self.uuid = uuid
            self.name = name
            self.style = style
            self.date = date
            self.disabled = disabled
        }
        
        public func body() async -> Component {
            switch style {
            case .system:
                return Plot.Input(type: .datetimeLocal, name: name, value: nil, isRequired: false, placeholder: "Select a date")
                    .optionalAttribute(disabled, name: "disabled", ignoreValueIfEmpty: false)
            case .regular:
                // Libs
                //deps.addCSSSource("/datepicker.min.css")
                deps.addJSSource(.litepicker_js)
                // Script
                deps.addRawScript(buildScript(date: self.date))
                // Input
                return await Element(name: "input") { }
                    .class("form-control")
                    .attribute(named: "name", value: name)
                    .attribute(named: "placeholder", value: "Select a date")
                    .attribute(named: "value", value: formattedDate)
                    .optionalAttribute(disabled, name: "disabled", ignoreValueIfEmpty: false)
                    .id("datepicker-\(uuid.uuidString)")
            case .inline:
                // Libs
                //deps.addCSSSource("/datepicker.min.css")
                deps.addJSSource(.litepicker_js)
                // Script
                deps.addRawScript(buildScript(date: self.date))
                // Div
                return Div { }
                    .id("datepicker-\(uuid.uuidString)")
                    .class("datepicker-inline")
                    .optionalAttribute(disabled, name: "disabled", ignoreValueIfEmpty: false)
            }
        }
        
        var formattedDate:String? {
            guard let d = self.date else { return nil }
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            return df.string(from: d)
//            self.date?.formatted(
//                .dateTime
//                .year(.defaultDigits)
//                .month(.twoDigits)
//                .day(.twoDigits)
//            ).replacingOccurrences(of: " ", with: "-")
        }
        
        
        func buildScript(date:Date?) -> String {
        """
        
        document.addEventListener("DOMContentLoaded", function () {
            window.Litepicker && (new Litepicker({
                element: document.getElementById('datepicker-\(self.uuid.uuidString)'),
                buttonText: {
                    previousMonth: `<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M15 6l-6 6l6 6" /></svg>`,
                    nextMonth: `<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9 6l6 6l-6 6" /></svg>`,
                },
                inlineMode: \(self.style == .inline ? "true" : "false"),
            }));
        });
        
        """
        }
        
    }
}

