//
//  UserCard.swift
//  PlotTabler
//

import Plot

public struct UserCard:Component {
    
    let user:MockData.User
    let leadingButton:ButtonLink
    let trailingButton:ButtonLink?
    
    public init(user: MockData.User, leadingButton: ButtonLink, trailingButton: ButtonLink? = nil) {
        self.user = user
        self.leadingButton = leadingButton
        self.trailingButton = trailingButton
    }
    
    public func body() async -> Component {
        await Card(
            size: .large(.num(3)),
            body: .init({
                Avatar(size: .xl, user.avatar)
                    .margin(.body(3))
                H3 { Text(user.name) }
                    .margin(.body(1))
                Div { Text(user.jobTitle) }
                    .textColor(.secondary)
                
                Div {
                    if let role = user.role {
                        await Badge(fill: .light, color: role == "Owner" ? .purple : .green) {
                            Text(role)
                        }
                    }
                }.margin(.top(3))
            }, class: "p-4 text-center"),
            flex: .init({
                leadingButton
                if let trailingButton {
                    trailingButton
                }
            })
        )
    }
}
