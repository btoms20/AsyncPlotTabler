//
//  Form+TinyMCE.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    public struct TinyMCE: Component {
        
        @EnvironmentValue(.dependencies) var deps
        
        let uuid:UUID
        let name:String
        let content:Component
        
        public init(name: String, content:Component) {
            self.uuid = UUID()
            self.name = name
            self.content = content
        }
        
        /*
         //<textarea id="tinymce-1">...</textarea>
         */
        public func body() async -> Component {
            // Libs
            deps.addJSSource(.tinymce_js)
            // Script
            deps.addRawScript(buildScript())
            
            return await Element(name: "textarea") {
                content
            }
            .id("tinymce-\(uuid.uuidString)")
            .attribute(named: "name", value: name)
        }
        
        
        func buildScript() -> String {
        """
        
        document.addEventListener("DOMContentLoaded", function () {
        let options = {
            selector: '#tinymce-\(uuid.uuidString)',
            height: 300,
            menubar: false,
            statusbar: false,
            plugins: [
            'advlist autolink lists link image charmap print preview anchor',
            'searchreplace visualblocks code fullscreen',
            'insertdatetime media table paste code help wordcount'
            ],
            toolbar: 'undo redo | formatselect | ' +
            'bold italic backcolor | alignleft aligncenter ' +
            'alignright alignjustify | bullist numlist outdent indent | ' +
            'removeformat',
            content_style: 'body { font-family: -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif; font-size: 14px; -webkit-font-smoothing: antialiased; }'
        }
        if (localStorage.getItem("tablerTheme") === 'dark') {
            options.skin = 'oxide-dark';
            options.content_css = 'dark';
        }
        tinyMCE.init(options);
        })
        
        """
        }
        
    }
}
