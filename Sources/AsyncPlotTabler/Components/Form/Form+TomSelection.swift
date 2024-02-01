//
//  Form+TomSelection.swift
//  PlotTabler
//

import Plot
import Foundation

extension Plot.Form {
    public struct TomSelection:Component {
        @EnvironmentValue(.dependencies) var deps:DependencyAccumulator
        
        public struct OptionGroup {
            let groupLabel:String
            let options:[Option]
            
            public init(groupLabel: String, options: [Option]) {
                self.groupLabel = groupLabel
                self.options = options
            }
        }
        
        public struct Option {
            let value:String
            let customData:Component?
            let label:Component
            let selected:Bool
            
            public init(value: String, selected: Bool = false, customData: Component? = nil, @ComponentBuilder label: ContentProvider) async {
                self.value = value
                self.customData = customData
                self.label = await label()
                self.selected = selected
            }
        }
        
        let uuid:UUID
        let name:String?
        let multiselect:Bool
        let disabled:Bool
        
        let options:[TomSelection.Option]?
        let optionGroups:[TomSelection.OptionGroup]?
        
        public init(name: String? = nil, multiselect:Bool = false, disabled:Bool = false, options:[TomSelection.Option]) {
            self.uuid = UUID()
            self.name = name
            self.multiselect = multiselect
            self.disabled = disabled
            self.options = options
            self.optionGroups = nil
        }
        
        public init(name: String? = nil, multiselect:Bool = false, disabled:Bool = false, optionGroups:[TomSelection.OptionGroup]) {
            self.uuid = UUID()
            self.name = name
            self.multiselect = multiselect
            self.disabled = disabled
            self.options = nil
            self.optionGroups = optionGroups
        }
        
        /*
         <select type="text" class="form-select" placeholder="Select tags" id="select-tags" value="" multiple>
           <option value="HTML">HTML</option>
           <option value="JavaScript">JavaScript</option>
           <option value="CSS">CSS</option>
           <option value="jQuery">jQuery</option>
           <option value="Bootstrap">Bootstrap</option>
           <option value="Ruby">Ruby</option>
           <option value="Python">Python</option>
         </select>
         */
        public func body() async -> Component {
            // Libs
            deps.addJSSource("/libs/tom-select/dist/js/tom-select.base.min.js")
            // Component Script
            deps.addRawScript(self.buildScript())
            
            if let options {
                return await Element(name: "select") {
                    for option in options {
                        await Element(name: "option") {
                            option.label
                        }
                        .attribute(named: "value", value: "\(option.value)")
                        .attribute(named: "selected", value: option.selected ? "" : nil, ignoreValueIfEmpty: !option.selected)
                        .attribute(named: "data-custom-properties", value: option.customData?.render().convertToInlineXML(), ignoreValueIfEmpty: true)
                    }
                }
                .id("tagselect-\(uuid.uuidString)")
                .class("form-select")
                .attribute(named: "type", value: "text")
                .attribute(named: "value", value: "")
                .optionalAttribute(name: "name", value: name)
                .optionalAttribute(multiselect, name: "multiple", value: nil, ignoreValueIfEmpty: false)
                .optionalAttribute(disabled, name: "disabled", ignoreValueIfEmpty: false)
            } else if let optionGroups {
                return await Element(name: "select") {
                    for group in optionGroups {
                        await Element(name: "optgroup") {
                            for option in group.options {
                                await Element(name: "option") {
                                    option.label
                                }
                                .attribute(named: "value", value: "\(option.value)")
                                .attribute(named: "selected", value: option.selected ? "" : nil, ignoreValueIfEmpty: !option.selected)
                                .attribute(named: "data-custom-properties", value: option.customData?.render().convertToInlineXML(), ignoreValueIfEmpty: true)
                            }
                        }
                        .attribute(named: "label", value: group.groupLabel)
                    }
                }
                .id("tagselect-\(uuid.uuidString)")
                .class("form-select")
                .attribute(named: "type", value: "text")
                .attribute(named: "value", value: "")
                .optionalAttribute(name: "name", value: name)
                .optionalAttribute(multiselect, name: "multiple", value: nil, ignoreValueIfEmpty: false)
                .optionalAttribute(disabled, name: "disabled", ignoreValueIfEmpty: false)
            } else {
                return EmptyComponent()
            }
        }
        
        func buildScript() -> String {
            return """
            
            document.addEventListener("DOMContentLoaded", function () {
                var el;
                window.TomSelect && (new TomSelect(el = document.getElementById('tagselect-\(uuid.uuidString)'), {
                    copyClassesToDropdown: false,
                    dropdownParent: 'body',
                    controlInput: '<input>',
                    render:{
                        item: function(data, escape) {
                            if( data.customProperties ){
                                return '<div><span class="dropdown-item-indicator">' + data.customProperties + '</span>' + escape(data.text) + '</div>';
                            }
                            return '<div>' + escape(data.text) + '</div>';
                        },
                        option: function(data, escape){
                            if( data.customProperties ){
                                return '<div><span class="dropdown-item-indicator">' + data.customProperties + '</span>' + escape(data.text) + '</div>';
                            }
                            return '<div>' + escape(data.text) + '</div>';
                        },
                    },
                }));
            });
            
            """
        }
    }
}

private extension String {
    func convertToInlineXML() -> String {
        var s = self.replacingOccurrences(of: "<", with: "&lt;")
        s = s.replacingOccurrences(of: ">", with: "&gt;")
        s = s.replacingOccurrences(of: "\"", with: "&quot;")
        return s
    }
}
