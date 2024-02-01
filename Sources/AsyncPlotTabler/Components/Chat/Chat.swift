//
//  Chat.swift
//  PlotTabler
//

import Plot
import Foundation

struct Chat:Component {
    struct ConversationHeader {
        let uuid:UUID
        let user:MockData.User
        let latestMessage:String
    }
    
    struct ChatItem {
        let from:MockData.User
        let date:String
        let msg:String
    }
    
    let id:UUID
    let currentChatID:UUID
    let user:MockData.User
    let conversations:[ConversationHeader]
    let chatItems:[ChatItem]
    
    init(id: UUID = UUID(), currentChatID: UUID, user: MockData.User, conversations: [ConversationHeader], chatItems: [ChatItem]) {
        self.id = id
        self.currentChatID = currentChatID
        self.user = user
        self.conversations = conversations
        self.chatItems = chatItems
    }
    
    func body() async -> Component {
        await Row(g: 0) {
            await Column {
                // Top Tool Bar / Search
                await DivC("card-header d-none d-md-block") {
                    await Plot.Form.InputWithIcon(leading: .icon(.search)) {
                        Plot.Form.Textfield(type: .search, name: "chat-search", value: nil, placeholder: "Search...", isRequired: false)
                    }
                }
                // Conversation History
                await DivC("card-body p-0 scrollable") {
                    await Plot.Form.ListGroup(style: .link, theme: .regular, background: .transparent, scrollable: true, preventHorizontalScroll: true, hoverable: false, items: conversations.asyncMap { convoItem in
                        await .init(link: "#chat-\(convoItem.uuid.uuidString)", active: convoItem.uuid == currentChatID) { await ChatCoverItemComponent(convoItem) }
                    })
                }
            }
            .class("col-12 col-lg-5 col-xl-3 border-end")
            
            
            await DivC("col-12 col-lg-7 col-xl-9 d-flex flex-column") {
                // Conversation
                await DivC("card-body scrollable") {
                    await DivC("chat") {
                        await DivC("chat-bubbles") {
                            for item in chatItems {
                                await ChatItemComponent(item, isSender: user.name == item.from.name)
                            }
                        }
                    }
                }
                .style("height: 35rem")
                
                // Message Input
                await DivC("card-footer") {
                    await Plot.Form.InputGroup {
                        Plot.Form.Textfield(name: "chat-input", placeholder: "Type message")
                        await Plot.Form.InputGroupText {
                            Plot.Link(url: "#") {
                                SVGIcon(icon: .mood_smile, color: .secondary)
                            }
                            .class("link-secondary")
                            .attribute(named: "title", value: "Insert emoji")
                            .attribute(named: "data-bs-toggle", value: "tooltip")
                            
                            Plot.Link(url: "#") {
                                SVGIcon(icon: .paperclip, color: .secondary)
                            }
                            .class("link-secondary ms-2")
                            .attribute(named: "title", value: "Add attachment")
                            .attribute(named: "data-bs-toggle", value: "tooltip")
                        }
                    }.class("input-group-flat")
                }
            }
        }
    }
    
    /*
     <div class="row align-items-center flex-fill">
       <div class="col-auto"><span class="avatar" style="background-image: url(./static/avatars/000m.jpg)"></span>
       </div>
       <div class="col text-body">
         <div>Paweł Kuna</div>
         <div class="text-secondary text-truncate w-100">Sure Paweł, let me pull the latest updates.</div>
       </div>
     </div>
     */
    private func ChatCoverItemComponent(_ convo:ConversationHeader) async -> Component {
        await DivC("row align-items-center flex-fill mw-100") {
            await DivC("col-auto") {
                Avatar(size: .md, convo.user.avatar)
            }
            await DivC("col text-body") {
                Div { Text(convo.user.name) }
                await DivC("text-secondary text-truncate w-100") {
                    Text(convo.latestMessage)
                }
            }
        }.style("margin:0px 5px 0px 5px;")
    }
    
    /*
     <div class="chat-item">
       <div class="row align-items-end justify-content-end">
         <div class="col col-lg-6">
           <div class="chat-bubble chat-bubble-me">
             <div class="chat-bubble-title">
               <div class="row">
                 <div class="col chat-bubble-author">Paweł Kuna</div>
                 <div class="col-auto chat-bubble-date">09:32</div>
               </div>
             </div>
             <div class="chat-bubble-body">
               <p>Hey guys, I just pushed a new commit on the <code>dev</code> branch. Can you have a look and tell me what you think?</p>
             </div>
           </div>
         </div>
         <div class="col-auto"><span class="avatar" style="background-image: url(./static/avatars/000m.jpg)"></span>
         </div>
       </div>
     </div>
     */
    private func ChatItemComponent(_ chatItem:ChatItem, isSender:Bool) async -> Component {
        await DivC("chat-item") {
            await DivC("row align-items-end") {
                if !isSender {
                    await DivC("col-auto") { Avatar(size: .md, chatItem.from.avatar) }
                }
                await DivC("col col-lg-6") {
                    await DivC("chat-bubble") {
                        await DivC("chat-bubble-title") {
                            await Row {
                                await DivC("col chat-bubble-author") { Text(chatItem.from.name) }
                                await DivC("col-auto chat-bubble-date") { Text(chatItem.date) }
                            }
                        }
                        await DivC("chat-bubble-body") {
                            Paragraph { Text(chatItem.msg) }
                        }
                    }
                    .class(isSender ? "chat-bubble-me" : "")
                }
                if isSender {
                    await DivC("col-auto") { Avatar(size: .md, chatItem.from.avatar) }
                }
            }
            .class(isSender ? "justify-content-end" : "")
        }
    }
}
