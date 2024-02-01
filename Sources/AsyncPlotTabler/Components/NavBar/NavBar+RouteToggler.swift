//
//  NavBar+RouteToggler.swift
//  PlotTabler
//

import Plot

extension NavBar {
    struct RouteToggler:Component {
        /*
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         */
        func body() async -> Component {
            Button {
                Span { }
                    .class("navbar-toggler-icon")
            }
            .class("navbar-toggler")
            .attribute(named: "data-bs-toggle", value: "collapse")
            .attribute(named: "data-bs-target", value: "#navbar-menu")
            .attribute(named: "aria-controls", value: "navbar-menu")
            .attribute(named: "aria-expanded", value: "false")
        }
    }
}
