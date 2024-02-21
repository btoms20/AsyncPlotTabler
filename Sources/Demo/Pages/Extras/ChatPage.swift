import AsyncPlotTabler
import Foundation

/// Chat Demo Page
struct ChatPage: Component {
    
    let chatID:UUID = UUID()
    let chatItems:[Chat.ChatItem] = [
        .init(from: MockData.Users.randomElement()!, date: "09:32", msg: "Hey guys, I just pushed a new commit on the dev branch. Can you have a look and tell me what you think?"),
        .init(from: MockData.Users.randomElement()!, date: "09:34", msg: "Sure Paweł, let me pull the latest updates."),
        .init(from: MockData.Users.randomElement()!, date: "09:34", msg: "I'm on it too 👊"),
        .init(from: MockData.Users.randomElement()!, date: "09:40", msg: "I see you've refactored the 'calculateStatistics' function. The code is much cleaner now."),
        .init(from: MockData.Users.randomElement()!, date: "09:42", msg: "Yes, I thought it was getting a bit cluttered."),
        .init(from: MockData.Users.randomElement()!, date: "09:43", msg: "The commit message is descriptive, too. Good job on mentioning the issue number it fixes."),
        .init(from: MockData.Users.randomElement()!, date: "09:44", msg: "I noticed you added some new dependencies in the `package.json`. Did you also update the `README` with the setup instructions?"),
        .init(from: MockData.Users.randomElement()!, date: "09:45", msg: "Oops, I forgot. I'll add that right away."),
        .init(from: MockData.Users.randomElement()!, date: "09:46", msg: "I see a couple of edge cases we might not be handling in the `calculateStatistic` function. Should I open an issue for that?"),
        .init(from: MockData.Users.randomElement()!, date: "09:48", msg: "Yes, Bob. Please do. We should not forget to handle those."),
        .init(from: MockData.Users.randomElement()!, date: "09:50", msg: "Alright, once the `README` is updated, I'll merge this commit into the main branch. Nice work, Paweł."),
        .init(from: MockData.Users.randomElement()!, date: "09:54", msg: "Thanks, everyone! 🙌")
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Chat"),
            content: {
                await CardVStack {
                    await Card(body: .raw({
                        Chat(
                            currentChatID: chatID,
                            user: MockData.Users.first!,
                            conversations: MockData.Users.enumerated().map { (i, user) in
                                .init(uuid: i == 0 ? chatID : UUID(), user: user, latestMessage: loremIpsum())
                            }, 
                            chatItems: chatItems
                        )
                    }))
                }
            })
        )
    }
}
