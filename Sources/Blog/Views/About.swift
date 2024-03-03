import Vapor
import Ink
import AsyncPlotTabler

struct About:Component {
    
    func body() async -> Component {
        return await CardVStack {
            
            await Card(
                body: .init({
                    
                    // Card Title
                    Card.Title("Hi I'm Alice! 👋", subTitle: .below("Welcome to the VPT Blog Example"))
                    
                    Paragraph {
                        Text("Thanks for stopping by to check out my blog! You'll find that I mostly write about server side Swift, the VPT framework and Traveling. But my interests are always shifting and I have a habbit of stumbling into unforseen rabit holes! So check back often to see what I've been up to!")
                    }
                    Paragraph {
                        Text("Your's truly,")
                    }
                    Paragraph {
                        Text("Alice")
                    }
                }),
                footer: .init({
                    await Row {
                        await Column {
                            Link(url: "#") {
                                IconLabel(icon: .brand_github, text: "@alicesmith")
                            }
                        }
                        await Column {
                            Link(url: "#") {
                                IconLabel(icon: .brand_x, text: "@alicesmith")
                            }
                        }
                        await Column {
                            Link(url: "#") {
                                IconLabel(icon: .brand_linkedin, text: "@alicesmith")
                            }
                        }
                    }
                })
            )
        }
    }
}

extension About {
    static var url:String {
        return "/about"
    }

    static var title:String {
        return "About"
    }
    
    static func header(req: Request) async -> PageHeader {
        await .init {
            await LabeledAvatar(avatar: Avatar(size: .xl, .text("AS"), shape: .regular, badge: nil), link: "#") {
                H1 { Text("Alice Smith") }
                    .margin(.body(2))
                await DivC("page-subtitle") {
                    await Row {
                        await Column(auto: true) {
                            SVGIcon(icon: .device_laptop)
                                .margin(.trailing(1))
                            Text("Software Engineer by day, ")
                            SVGIcon(icon: .brain)
                                .margin(.trailing(1))
                            Text("ML tinkerer by night!")
                        }
                    }
                }
            }
        }
    }
}
