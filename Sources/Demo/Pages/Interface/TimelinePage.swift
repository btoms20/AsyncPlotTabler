import AsyncPlotTabler
import Foundation

/// Timeline Demo Page
struct TimelinePage: Component {
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(header: .init(header: "Timelines"), content: {
            await CardVStack {
                await CardHStack {
                    await Column {
                        H4 { Text("Timeline with Icons") }
                        await Timeline(iconTimeline: [
                            .init(icon: .init(icon: .brand_twitter, color: .azure), event: .init(date: Date().addingTimeInterval(.hours(-1)), title: "+1150 Followers", description: "You’re getting more and more followers, keep it up!")),
                            .init(icon: .init(icon: .briefcase), event: .init(date: Date().addingTimeInterval(.hours(-4)), title: "+3 New Products were added!", description: "Congratulations!")),
                            .init(icon: .init(icon: .check), event: .init(date: Date().addingTimeInterval(.hours(-9)), title: "Database backup completed!", description: "Download the latest backup.")),
                            .init(icon: .init(icon: .brand_facebook, color: .blue), event: .init(date: Date().addingTimeInterval(.hours(-17)), title: "+290 Page Likes", description: "This is great, Keep it up!")),
                            .init(icon: .init(icon: .user_plus), event: .init(date: Date().addingTimeInterval(.hours(-18)), title: "+3 Friend Requests") {
                                await ComponentGroup {
                                    AvatarList(style: .list, size: .lg, avatars: MockData.Users.randomSample(count: 3).map { $0.avatar })
                                }
                            }),
                            .init(icon: .init(icon: .photo), event: .init(date: Date().addingTimeInterval(.hours(-36)), title: "+2 New Photos", description: "")),
                            .init(icon: .init(icon: .settings, animation: .rotate), event: .init(date: Date().addingTimeInterval(.days(-2)), title: "System updated to v2.0.2", description: "Check the complete changelog on the activity page.")),
                        ])
                    }
                    
                    await Column {
                        H4 { Text("Simple Timeline") }
                        await Timeline(sort: .newAtBottom, simpleTimeline: [
                            .init(date: Date().addingTimeInterval(.hours(-1)), title: "+1150 Followers", description: "You’re getting more and more followers, keep it up!"),
                            .init(date: Date().addingTimeInterval(.hours(-4)), title: "+3 New Products were added!", description: "Congratulations!"),
                            .init(date: Date().addingTimeInterval(.hours(-9)), title: "Database backup completed!", description: "Download the latest backup."),
                            .init(date: Date().addingTimeInterval(.hours(-17)), title: "+290 Page Likes", description: "This is great, Keep it up!"),
                            .init(date: Date().addingTimeInterval(.hours(-18)), title: "+3 Friend Requests") {
                                await ComponentGroup {
                                    AvatarList(style: .list, size: .lg, avatars: MockData.Users.randomSample(count: 3).map { $0.avatar })
                                }
                            },
                            .init(date: Date().addingTimeInterval(.hours(-36)), title: "+2 New Photos", description: ""),
                            .init(date: Date().addingTimeInterval(.days(-2)), title: "System updated to v2.0.2", description: "Check the complete changelog on the activity page."),
                        ])
                    }
                }
            }
        }))
    }
}


extension TimeInterval {
    static func seconds(_ int:Int) -> TimeInterval {
        TimeInterval(int)
    }
    
    static func minutes(_ int:Int) -> TimeInterval {
        TimeInterval(int * 60)
    }
    
    static func hours(_ int:Int) -> TimeInterval {
        TimeInterval(int * 60 * 60)
    }
    
    static func days(_ int:Int) -> TimeInterval {
        TimeInterval(int * 60 * 60 * 24)
    }
}
