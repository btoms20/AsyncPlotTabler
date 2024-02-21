import AsyncPlotTabler
import Foundation

/// Carousel Demo Page
struct CarouselPage: Component {
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Carousel"),
            content: {
                await CardVStack {
                    await CardHStack {
                        await Card(
                            header: .init({
                                Card.Title("Carousel")
                            }),
                            body: .init({
                                Carousel(items: [
                                    .init(src: "./static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg", description: ""),
                                    .init(src: "./static/photos/brainstorming-session-with-creative-designers.jpg", description: ""),
                                    .init(src: "./static/photos/finances-us-dollars-and-bitcoins-currency-money.jpg", description: ""),
                                    .init(src: "./static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg", description: ""),
                                    .init(src: "./static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg", description: ""),
                                ])
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Carousel with indicators")
                            }),
                            body: .init({
                                Carousel(style: .indicators(.line), items: [
                                    .init(src: "./static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg", description: ""),
                                    .init(src: "./static/photos/young-woman-working-in-a-cafe.jpg", description: ""),
                                    .init(src: "./static/photos/everything-you-need-to-work-from-your-bed.jpg", description: ""),
                                    .init(src: "./static/photos/young-entrepreneur-working-from-a-modern-cafe.jpg", description: ""),
                                    .init(src: "./static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg", description: ""),
                                ])
                            })
                        )
                    }
                    
                    await CardHStack {
                        await Card(
                            header: .init({
                                Card.Title("Carousel with controls")
                            }),
                            body: .init({
                                Carousel(style: .controls, items: [
                                    .init(src: "./static/photos/group-of-people-sightseeing-in-the-city.jpg", description: ""),
                                    .init(src: "./static/photos/color-palette-guide-sample-colors-catalog-.jpg", description: ""),
                                    .init(src: "./static/photos/stylish-workplace-with-computer-at-home.jpg", description: ""),
                                    .init(src: "./static/photos/pink-desk-in-the-home-office.jpg", description: ""),
                                    .init(src: "./static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop.jpg", description: ""),
                                ])
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Carousel with captions")
                            }),
                            body: .init({
                                Carousel(style: .controls, showCaptions: true, items: [
                                    .init(src: "./static/photos/coffee-on-a-table-with-other-items.jpg", label: "Coffee", description: "Coffe on a table with other items"),
                                    .init(src: "./static/photos/young-entrepreneur-working-from-a-modern-cafe-2.jpg", label: "Cafe", description: "Young entrepreneur working from a modern cafe"),
                                    .init(src: "./static/photos/soft-photo-of-woman-on-the-bed-with-the-book-and-cup-of-coffee-in-hands.jpg", label: "Bedtime Coffee", description: "Soft photo of woman on the bed with the book and cup of coffee in hands"),
                                    .init(src: "./static/photos/fairy-lights-at-the-beach-in-bulgaria.jpg", label: "Bulgaria", description: "Fairy lights at the beach in Bulgaria"),
                                    .init(src: "./static/photos/woman-working-on-laptop-at-home-office.jpg", label: "Home Office", description: "Woman working on laptop at home office"),
                                ])
                            })
                        )
                    }
                    
                    await CardHStack {
                        await Card(
                            header: .init({
                                Card.Title("Carousel with dot indicators")
                            }),
                            body: .init({
                                Carousel(style: .indicators(.dot(.bottom)), items: [
                                    .init(src: "./static/photos/group-of-people-sightseeing-in-the-city.jpg", description: ""),
                                    .init(src: "./static/photos/color-palette-guide-sample-colors-catalog-.jpg", description: ""),
                                    .init(src: "./static/photos/stylish-workplace-with-computer-at-home.jpg", description: ""),
                                    .init(src: "./static/photos/pink-desk-in-the-home-office.jpg", description: ""),
                                    .init(src: "./static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop.jpg", description: ""),
                                ])
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Carousel with thumbnail indicators")
                            }),
                            body: .init({
                                Carousel(style: .indicators(.thumbnail(.bottom)), items: [
                                    .init(src: "./static/photos/coffee-on-a-table-with-other-items.jpg", label: "Coffee", description: "Coffe on a table with other items"),
                                    .init(src: "./static/photos/young-entrepreneur-working-from-a-modern-cafe-2.jpg", label: "Cafe", description: "Young entrepreneur working from a modern cafe"),
                                    .init(src: "./static/photos/soft-photo-of-woman-on-the-bed-with-the-book-and-cup-of-coffee-in-hands.jpg", label: "Bedtime Coffee", description: "Soft photo of woman on the bed with the book and cup of coffee in hands"),
                                    .init(src: "./static/photos/fairy-lights-at-the-beach-in-bulgaria.jpg", label: "Bulgaria", description: "Fairy lights at the beach in Bulgaria"),
                                    .init(src: "./static/photos/woman-working-on-laptop-at-home-office.jpg", label: "Home Office", description: "Woman working on laptop at home office"),
                                ])
                            })
                        )
                    }
                    
                    await CardHStack {
                        await Card(
                            header: .init({
                                Card.Title("Carousel with vertical dot indicators")
                            }),
                            body: .init({
                                Carousel(style: .indicators(.dot(.side)), items: [
                                    .init(src: "./static/photos/group-of-people-sightseeing-in-the-city.jpg", description: ""),
                                    .init(src: "./static/photos/color-palette-guide-sample-colors-catalog-.jpg", description: ""),
                                    .init(src: "./static/photos/stylish-workplace-with-computer-at-home.jpg", description: ""),
                                    .init(src: "./static/photos/pink-desk-in-the-home-office.jpg", description: ""),
                                    .init(src: "./static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop.jpg", description: ""),
                                ])
                            })
                        )
                        
                        await Card(
                            header: .init({
                                Card.Title("Carousel with vertical thumbnails")
                            }),
                            body: .init({
                                Carousel(style: .indicators(.thumbnail(.side)), items: [
                                    .init(src: "./static/photos/coffee-on-a-table-with-other-items.jpg", label: "Coffee", description: "Coffe on a table with other items"),
                                    .init(src: "./static/photos/young-entrepreneur-working-from-a-modern-cafe-2.jpg", label: "Cafe", description: "Young entrepreneur working from a modern cafe"),
                                    .init(src: "./static/photos/soft-photo-of-woman-on-the-bed-with-the-book-and-cup-of-coffee-in-hands.jpg", label: "Bedtime Coffee", description: "Soft photo of woman on the bed with the book and cup of coffee in hands"),
                                    .init(src: "./static/photos/fairy-lights-at-the-beach-in-bulgaria.jpg", label: "Bulgaria", description: "Fairy lights at the beach in Bulgaria"),
                                    .init(src: "./static/photos/woman-working-on-laptop-at-home-office.jpg", label: "Home Office", description: "Woman working on laptop at home office"),
                                ])
                            })
                        )
                    }
                }
            })
        )
    }
}
