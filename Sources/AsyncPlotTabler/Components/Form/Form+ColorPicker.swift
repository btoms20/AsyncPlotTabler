//
//  Form+ColorPicker.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    struct ColorPicker: Component {
        
        @EnvironmentValue(.dependencies) var deps
        
        enum Style {
            case system
            case fancy(swatches:[String] = [])
        }
        
        let uuid:UUID
        let style:Style
        let color:String
        
        init(defaultColor:String, style:Style = .system) {
            self.uuid = UUID()
            self.color = defaultColor
            self.style = style
        }
        
        /*
         //<input type="text" class="form-control d-block" id="colorpicker-1" value="#0054a6" />
         */
        func body() async -> Component {
            switch style {
            case .system:
                return Input(type: .color, name: "colorpicker-\(uuid.uuidString)", value: color, isRequired: false, placeholder: nil)
                    .id("colorpicker-\(uuid.uuidString)")
                    .class("form-control form-control-color")
            case .fancy(let swatches):
                // Libs
                deps.addCSSSource(.coloris_css)
                deps.addJSSource(.coloris_js)
                // Script
                deps.addRawScript(buildScript(swatches: swatches))
                
                return Div {
                    Plot.Input(type: .text, value: color)
                        .id("colorpicker-\(uuid.uuidString)")
                        .class("form-control d-block")
                    //.attribute(named: "data-coloris", value: nil)
                }
            }
        }
        
        
        func buildScript(swatches:[String]) -> String {
        """
        
        document.addEventListener("DOMContentLoaded", function () {
            window.Coloris && (Coloris({
                el: '#colorpicker-\(uuid.uuidString)',
                selectInput: true,
                alpha: false,
                format: "hex",
                swatches: [
                    "#0054a6",
                    "#45aaf2",
                    "#6574cd",
                    "#a55eea",
                    "#f66d9b",
                    "#fa4654",
                    "#fd9644",
                    "#f1c40f",
                    "#7bd235",
                    "#5eba00",
                    "#2bcbba",
                    "#17a2b8",
                ],
            }))
        })
        
        document.querySelector('#colorpicker-\(uuid.uuidString)').addEventListener('click', e => {
            Coloris({
              theme: 'default',
              themeMode: 'light',
              onChange: (color, input) => {
                  console.log('#colorpicker-\(uuid.uuidString) -', color, input);
              }
            });
        });
        
        """
        }
        
    }
}
