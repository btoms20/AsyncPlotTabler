import AsyncPlotTabler

/// FAQ Demo View
struct FAQPage: Component {

    struct QuestionAnswer {
        let question:String
        let answer:String
    }
    
    struct Section:KeyedComponentGroup {
        let title:String
        let faq:[QuestionAnswer]
        
        func keyed() async -> [AsyncPlotTabler.KeyedComponent] {
            faq.map {
                .init(key: $0.question, component: Text($0.answer) )
            }
        }
    }
    
    let sections:[Section] = [
        .init(title: "Introduction", faq: [
            .init(question: "Welcome to our service!", answer: loremIpsum()),
            .init(question: "Who are we?", answer: loremIpsum()),
            .init(question: "What are our values?", answer: loremIpsum())
        ]),
        .init(title: "Functionality", faq: [
            .init(question: "What are the key features?", answer: loremIpsum()),
            .init(question: "Does your app support mobile devices?", answer: loremIpsum()),
            .init(question: "Why should I choose your service?", answer: loremIpsum()),
            .init(question: "Is my data secure?", answer: loremIpsum()),
        ]),
        .init(title: "Payments", faq: [
            .init(question: "Is there any free plan?", answer: loremIpsum()),
            .init(question: "What are the available payment options?", answer: loremIpsum()),
            .init(question: "Can I get a refund?", answer: loremIpsum())
        ])
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: {
                H2 { Text("Frequently Asked Questions") }.class("page-title").margin(.body(3))
            }, actions: {
                await Steps(style: .breadcrumb(.arrow), activeIndex: 2, steps: [
                    .init({ Link(url: "home") { Text("Tabler") } }),
                    .init({ Link(url: "pages") { Text("Pages") } }),
                    .init({ Link(url: "faq") { Text("Frequently Asked Questions") } }),
                ])
            }),
            content: {
                await CardVStack {
                    await Card(body: .init({
                        await DivC("space-y-4") {
                            for (i, section) in sections.enumerated() {
                                Div {
                                    H2 { Text("\(i+1). \(section.title)") }
                                    await Accordion(items: section.faq.asyncMap { qa in
                                        await .init(header: .init(Text(qa.question))) {
                                            await Paragraph(qa.answer)
                                        }
                                    })
                                }
                            }
                        }
                    }))
                    .class("card-lg")
                }
            })
        )
    }
}


