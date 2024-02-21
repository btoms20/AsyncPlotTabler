import AsyncPlotTabler

/// Logs Demo View
struct LogsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Logs"),
            content: {
                await CardVStack {
                    
                    await Card(
                        body: .init({
                            H4 { Text("Checked URL") }
                            Markdown.CodeBlock(code: """
                            GET https://tabler.io.demo
                            """)
                            .margin(.body(4))
                            
                            H4 { Text("Request Timing") }
                            Markdown.CodeBlock(code: """
                            Effective URL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://tabler.io/demo
                            Redirect count&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0
                            Name lookup time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.4e-05
                            Connect time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.000521
                            Pre-transfer time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0
                            Start-transfer time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0
                            App connect time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0
                            Redirect time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0
                            Total time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;28.000601
                            Response code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0
                            Return keyword&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;operation_timedout
                            """)
                            .margin(.body(4))
                            
                            H4 { Text("Response Header") }
                            Markdown.CodeBlock(code: """
                            HTTP/1.1 200 Connection established
                            """)
                        }),
                        footer: .init({
                            H4 { Text("Escalation") }
                            Div { Text("Entire team") }
                        })
                    )
                    
                }
            })
        )
    }
}
