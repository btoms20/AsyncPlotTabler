import AsyncPlotTabler

/// Alerts Demo View
struct AlertsPage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Alerts"), content: {
            await CardVStack {
                await CardHStack {
                    await Card(body: .init({
                        Card.Title("Basic alerts")
                        Paragraph {
                            Text("Wrap any text and an optional dismiss button in ")
                            Code(".alert")
                            Text(" and one of the four contextual classes (e.g., ")
                            Code(".alert-success")
                            Text(") for basic alert messages.")
                        }.textColor(.secondary)
                        
                        Alert(style: .success, message: "Wow! Everything worked!")
                        Alert(style: .warning, message: "Uh oh, something went wrong")
                        Alert(style: .danger, message: "I'm so sorry…")
                        Alert(style: .info, message: "Did you know?")
                    }))
                    
                    await Card(body: .init({
                        Card.Title("Alerts with icons")
                        Paragraph {
                            Text("Build on any alert by adding an optional icon.")
                        }.textColor(.secondary)
                        
                        Alert(style: .success, icon: .check, message: "Wow! Everything worked!")
                        Alert(style: .warning, icon: .alert_triangle, message: "Uh oh, something went wrong")
                        Alert(style: .danger, icon: .alert_circle, message: "I'm so sorry…")
                        Alert(style: .info, icon: .info_circle, message: "Did you know?")
                    }))
                }
                
                await CardHStack {
                    await Card(body: .init({
                        Card.Title("Dismissable alerts")
                        Paragraph {
                            Text("Build on any alert by adding an optional ")
                            Code(".alert-dismissible")
                            Text(" and close button.")
                        }.textColor(.secondary)
                        
                        Alert(style: .success, icon: .check, dismissable: true, message: "Wow! Everything worked!")
                        Alert(style: .warning, icon: .alert_triangle, dismissable: true, message: "Uh oh, something went wrong")
                        Alert(style: .danger, icon: .alert_circle, dismissable: true, message: "I'm so sorry…")
                        Alert(style: .info, icon: .info_circle, dismissable: true, message: "Did you know?")
                    }))
                    
                    await Card(body: .init({
                        Card.Title("Alerts with descriptions")
                        Paragraph {
                            Text("Build on any alert by adding an optional description.")
                        }.textColor(.secondary)
                        
                        Alert(style: .success, icon: .check, message: "This is a custom alert box!", description: "Your account has been saved!")
                        Alert(style: .warning, icon: .alert_triangle, message: "This is a custom alert box!", description: "Sorry! There was a problem with your request.")
                        Alert(style: .danger, icon: .alert_circle, message: "This is a custom alert box!", description: "Something went wrong. Please try again.")
                        Alert(style: .info, icon: .info_circle, message: "This is a custom alert box!", description: "Here is something that you might like to know.")
                    }))
                }
                
                await Card(
                    size: .large(.num(6)),
                    body: .init({
                        Card.Title("Important alerts")
                        Paragraph {
                            Text("Make any alert more pronounced by adding the ")
                            Code(".alert-important")
                            Text(" class to your alert")
                        }.textColor(.secondary)
                        
                        Alert(style: .success, icon: .check, dismissable: true, important: true, message: "Wow! Everything worked!")
                        Alert(style: .warning, icon: .alert_triangle, dismissable: true, important: true, message: "Uh oh, something went wrong")
                        Alert(style: .danger, icon: .alert_circle, dismissable: true, important: true, message: "I'm so sorry…")
                        Alert(style: .info, icon: .info_circle, dismissable: true, important: true, message: "Did you know?")
                    })
                )
            }
        }))
    }
}
