//
//  MockData.swift
//  TablerPlot
//

import Foundation

public func loremIpsum() -> String {
    return "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto at consectetur culpa ducimus eum fuga fugiat, ipsa iusto, modi nostrum recusandae reiciendis saepe"
}

public struct MockData {
    public struct Person:Codable {
        let name:String
        let city:String
        let type:String
        let score:Double
        let date:Date
        let quantity:Int
        let progress:Double
        
        public init(name: String, city: String, type: String, score: Double, date: Date, quantity: Int, progress: Double) {
            self.name = name
            self.city = city
            self.type = type
            self.score = score
            self.date = date
            self.quantity = quantity
            self.progress = progress
        }
    }
    
    public struct User {
        public let name:String
        public let initials:String
        public let jobTitle:String
        public let role:String?
        public let avatar:Avatar.AvatarType
        
        public init(name: String, initials: String, jobTitle: String, role: String?, avatar: Avatar.AvatarType) {
            self.name = name
            self.initials = initials
            self.jobTitle = jobTitle
            self.role = role
            self.avatar = avatar
        }
    }
    public static let Users:[User] = [
        .init(name: "Paweł Kuna", initials: "PK", jobTitle: "UI Designer", role: "Owner", avatar: .picture("/static/avatars/000m.jpg")),
        .init(name: "Jeffie Lewzey", initials: "JL", jobTitle: "Chemical Engineer", role: "Admin", avatar: .text("JL")),
        .init(name: "Mallory Hulme", initials: "MH", jobTitle: "Geologist IV", role: "Admin", avatar: .picture("/static/avatars/002m.jpg")),
        .init(name: "Dunn Slane", initials: "DS", jobTitle: "Research Nurse", role: "Admin", avatar: .picture("/static/avatars/003m.jpg")),
        .init(name: "Emmy Levet", initials: "EL", jobTitle: "VP Product Management", role: nil, avatar: .picture("/static/avatars/000f.jpg")),
        .init(name: "Maryjo Lebarree", initials: "ML", jobTitle: "Civil Engineer", role: nil, avatar: .picture("/static/avatars/001f.jpg")),
        .init(name: "Egan Poetz", initials: "EP", jobTitle: "Research Nurse", role: nil, avatar: .text("EP")),
        .init(name: "Kellie Skingley", initials: "KS", jobTitle: "Teacher", role: nil, avatar: .picture("/static/avatars/002f.jpg")),
        .init(name: "Christabel Charlwood", initials: "CC", jobTitle: "Tax Accountant", role: nil, avatar: .picture("/static/avatars/003f.jpg")),
        .init(name: "Haskel Shelper", initials: "HS", jobTitle: "Staff Scientist", role: nil, avatar: .text("HS")),
        .init(name: "Lorry Mion", initials: "LM", jobTitle: "Automation Specialist IV", role: nil, avatar: .picture("/static/avatars/006m.jpg")),
        .init(name: "Leesa Beaty", initials: "LB", jobTitle: "Editor", role: nil, avatar: .picture("/static/avatars/004f.jpg")),
        .init(name: "Perren Keemar", initials: "PK", jobTitle: "Analog Circuit Design manager", role: nil, avatar: .picture("/static/avatars/007m.jpg")),
        .init(name: "Sunny Airey", initials: "SA", jobTitle: "Nuclear Power Engineer", role: nil, avatar: .text("SA")),
        .init(name: "Geoffry Flaunders", initials: "GF", jobTitle: "Software Test Engineer II", role: nil, avatar: .picture("/static/avatars/009m.jpg")),
        .init(name: "Thatcher Keel", initials: "TK", jobTitle: "VP Sales", role: nil, avatar: .picture("/static/avatars/010m.jpg")),
        .init(name: "Dyann Escala", initials: "DE", jobTitle: "Mechanical Systems Engineer", role: nil, avatar: .picture("/static/avatars/005f.jpg")),
        .init(name: "Avivah Mugleston", initials: "AM", jobTitle: "Actuary", role: nil, avatar: .picture("/static/avatars/006f.jpg")),
    ]
    
    
    public struct Photo {
        public let src:URLRepresentable
        public let alt:String
    }
    public static let Photos:[Photo] = [
        .init(src: "/static/photos/a-visit-to-the-bookstore.jpg", alt: ""),
        .init(src: "/static/photos/a-woman-works-at-a-desk-with-a-laptop-and-a-cup-of-coffee.jpg", alt: ""),
        .init(src: "/static/photos/a-woman-works-on-a-laptop-at-home-2.jpg", alt: ""),
        .init(src: "/static/photos/a-woman-works-on-a-laptop-at-home-3.jpg", alt: ""),
        .init(src: "/static/photos/a-woman-works-on-a-laptop-at-home.jpg", alt: ""),
        .init(src: "/static/photos/beautiful-blonde-woman-on-a-wooden-pier-by-the-lake.jpg", alt: ""),
        .init(src: "/static/photos/beautiful-blonde-woman-relaxing-with-a-can-of-coke-on-a-tree-stump-by-the-beach.jpg", alt: ""),
        .init(src: "/static/photos/blond-using-her-laptop-at-her-bedroom.jpg", alt: ""),
        .init(src: "/static/photos/blue-sofa-with-pillows-in-a-designer-living-room-interior.jpg", alt: ""),
        .init(src: "/static/photos/book-on-the-grass.jpg", alt: ""),
        .init(src: "/static/photos/books-and-purple-flowers-on-a-wooden-stool-by-the-bed.jpg", alt: ""),
        .init(src: "/static/photos/brainstorming-session-with-creative-designers-2.jpg", alt: ""),
        .init(src: "/static/photos/brainstorming-session-with-creative-designers.jpg", alt: ""),
        .init(src: "/static/photos/businesswoman-working-at-her-laptop-2.jpg", alt: ""),
        .init(src: "/static/photos/businesswoman-working-at-her-laptop.jpg", alt: ""),
        .init(src: "/static/photos/city-lights-reflected-in-the-water-at-night.jpg", alt: ""),
        .init(src: "/static/photos/coffee-on-a-table-with-other-items.jpg", alt: ""),
        .init(src: "/static/photos/color-palette-guide-sample-colors-catalog-.jpg", alt: ""),
        .init(src: "/static/photos/colorful-exotic-flowers-and-greenery.jpg", alt: ""),
        .init(src: "/static/photos/contemporary-black-and-white-home-decor.jpg", alt: ""),
        .init(src: "/static/photos/cryptocurrency-bitcoin-coins-2.jpg", alt: ""),
        .init(src: "/static/photos/cryptocurrency-bitcoin-coins.jpg", alt: ""),
        .init(src: "/static/photos/cup-of-coffee-and-an-open-book.jpg", alt: ""),
        .init(src: "/static/photos/cup-of-coffee-on-table-in-cafe-2.jpg", alt: ""),
        .init(src: "/static/photos/cup-of-coffee-on-table-in-cafe.jpg", alt: ""),
        .init(src: "/static/photos/elegant-home-office-with-golden-accessories.jpg", alt: ""),
        .init(src: "/static/photos/everything-you-need-to-work-from-your-bed-2.jpg", alt: ""),
        .init(src: "/static/photos/everything-you-need-to-work-from-your-bed.jpg", alt: ""),
        .init(src: "/static/photos/fairy-lights-at-the-beach-in-bulgaria.jpg", alt: ""),
        .init(src: "/static/photos/finances-us-dollars-and-bitcoins-currency-money-2.jpg", alt: ""),
        .init(src: "/static/photos/finances-us-dollars-and-bitcoins-currency-money-3.jpg", alt: ""),
        .init(src: "/static/photos/finances-us-dollars-and-bitcoins-currency-money-4.jpg", alt: ""),
        .init(src: "/static/photos/finances-us-dollars-and-bitcoins-currency-money-5.jpg", alt: ""),
        .init(src: "/static/photos/finances-us-dollars-and-bitcoins-currency-money.jpg", alt: ""),
        .init(src: "/static/photos/friends-at-a-restaurant-drinking-wine.jpg", alt: ""),
        .init(src: "/static/photos/geometric-decoration-on-yellow-background.jpg", alt: ""),
        .init(src: "/static/photos/group-of-people-brainstorming-and-taking-notes-2.jpg", alt: ""),
        .init(src: "/static/photos/group-of-people-brainstorming-and-taking-notes-3.jpg", alt: ""),
        .init(src: "/static/photos/group-of-people-brainstorming-and-taking-notes-4.jpg", alt: ""),
        .init(src: "/static/photos/group-of-people-brainstorming-and-taking-notes.jpg", alt: ""),
        .init(src: "/static/photos/group-of-people-sightseeing-in-the-city.jpg", alt: ""),
        .init(src: "/static/photos/home-office-desk-with-macbook-iphone-calendar-watch-and-organizer.jpg", alt: ""),
        .init(src: "/static/photos/home-office-laptop-organizer-and-cup-of-coffee.jpg", alt: ""),
        .init(src: "/static/photos/making-magic-with-fairy-lights.jpg", alt: ""),
        .init(src: "/static/photos/man-looking-out-to-sea.jpg", alt: ""),
        .init(src: "/static/photos/modern-home-office.jpg", alt: ""),
        .init(src: "/static/photos/netflix-drug-lords-from-narcos.jpg", alt: ""),
        .init(src: "/static/photos/people-by-a-banquet-table-full-with-food.jpg", alt: ""),
        .init(src: "/static/photos/people-watching-a-presentation-in-a-room.jpg", alt: ""),
        .init(src: "/static/photos/pink-desk-in-the-home-office.jpg", alt: ""),
        .init(src: "/static/photos/portrait-of-a-teen-girl.jpg", alt: ""),
        .init(src: "/static/photos/soft-photo-of-woman-on-the-bed-with-the-book-and-cup-of-coffee-in-hands.jpg", alt: ""),
        .init(src: "/static/photos/stone-texture-high-resolution-background-2.jpg", alt: ""),
        .init(src: "/static/photos/stone-texture-high-resolution-background.jpg", alt: ""),
        .init(src: "/static/photos/stylish-workplace-with-computer-at-home.jpg", alt: ""),
        .init(src: "/static/photos/stylish-workspace-with-macbook-pro-2.jpg", alt: ""),
        .init(src: "/static/photos/stylish-workspace-with-macbook-pro.jpg", alt: ""),
        .init(src: "/static/photos/sweet-buns-with-cream-cheese-inside.jpg", alt: ""),
        .init(src: "/static/photos/tropical-palm-leaves-floral-pattern-background.jpg", alt: ""),
        .init(src: "/static/photos/white-apple-imac-computer-with-elephant-mousepad.jpg", alt: ""),
        .init(src: "/static/photos/woman-drinking-hot-tea-in-her-home-office.jpg", alt: ""),
        .init(src: "/static/photos/woman-drinking-tea-and-reading-book.jpg", alt: ""),
        .init(src: "/static/photos/woman-read-book-and-drink-coffee-2.jpg", alt: ""),
        .init(src: "/static/photos/woman-read-book-and-drink-coffee.jpg", alt: ""),
        .init(src: "/static/photos/woman-working-on-a-laptop-while-enjoying-a-breakfast-coffee-and-chocolate-in-bed-2.jpg", alt: ""),
        .init(src: "/static/photos/woman-working-on-a-laptop-while-enjoying-a-breakfast-coffee-and-chocolate-in-bed.jpg", alt: ""),
        .init(src: "/static/photos/woman-working-on-laptop-at-home-office.jpg", alt: ""),
        .init(src: "/static/photos/working-in-a-restaurant-macbook-cheese-cake-and-cup-of-coffee.jpg", alt: ""),
        .init(src: "/static/photos/workplace-with-laptop-on-table-at-home-2.jpg", alt: ""),
        .init(src: "/static/photos/workplace-with-laptop-on-table-at-home-3.jpg", alt: ""),
        .init(src: "/static/photos/workplace-with-laptop-on-table-at-home-4.jpg", alt: ""),
        .init(src: "/static/photos/workplace-with-laptop-on-table-at-home.jpg", alt: ""),
        .init(src: "/static/photos/young-entrepreneur-working-from-a-modern-cafe-2.jpg", alt: ""),
        .init(src: "/static/photos/young-entrepreneur-working-from-a-modern-cafe.jpg", alt: ""),
        .init(src: "/static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop-2.jpg", alt: ""),
        .init(src: "/static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop-3.jpg", alt: ""),
        .init(src: "/static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop-4.jpg", alt: ""),
        .init(src: "/static/photos/young-woman-sitting-on-the-sofa-and-working-on-her-laptop.jpg", alt: ""),
        .init(src: "/static/photos/young-woman-working-in-a-cafe.jpg", alt: "")
    ]
    
    public struct UptimeEntry:KeyedComponentGroup {
        let timePeriod:String
        let availabilty:Double
        let downtime:String
        let incidents:Int
        let longestIncident:String
        let avgIncident:String
        
        public func keyed() async -> [KeyedComponent] {
            [
                .init(key: "time period",  component: Text(timePeriod)),
                .init(key: "availabilty", component: Text("\(availabilty)%")),
                .init(key: "downtime", component: Text(downtime)),
                .init(key: "incidents",  component: Text("\(incidents)")),
                .init(key: "longest incident",  component: Text(longestIncident)),
                .init(key: "avg. incident",  component: Text(avgIncident)),
            ]
        }
    }
    
    public static let UptimeData = [
        UptimeEntry(timePeriod: "Today", availabilty: 98.9533, downtime: "1 minute", incidents: 1, longestIncident: "1 minute", avgIncident: "1 minute"),
        UptimeEntry(timePeriod: "Last 7 days", availabilty: 98.9533, downtime: "1 minute", incidents: 1, longestIncident: "1 minute", avgIncident: "1 minute"),
        UptimeEntry(timePeriod: "Last 30 days", availabilty: 98.9533, downtime: "1 minute", incidents: 1, longestIncident: "1 minute", avgIncident: "1 minute"),
        UptimeEntry(timePeriod: "Last 365 days", availabilty: 98.9533, downtime: "1 minute", incidents: 1, longestIncident: "1 minute", avgIncident: "1 minute"),
        UptimeEntry(timePeriod: "All time", availabilty: 98.9533, downtime: "1 minute", incidents: 1, longestIncident: "1 minute", avgIncident: "1 minute"),
    ]
    
    public static func randomActivity(username:String) -> String {
        let Activities = [
            "{{username}} commented on your post.",
            "{{username}} commented on your photo.",
            "{{username}} liked your post.",
            "{{username}} liked your photo.",
            "It's {{username}}'s birthday today 🥳. Wish them a happy bday.",
            "{{username}} and three others followed you.",
            "{{username}} posted a new photo.",
            "{{username}} posted a new video.",
            "{{username}} posted a new article."
        ]
        
        return Activities.randomElement()!.replacingOccurrences(of: "{{username}}", with: username)
    }
    
    
    public struct DevActivity:KeyedComponentGroup {
        let user:Avatar.AvatarType
        let commit:String
        let date:String
        
        public func keyed() async -> [KeyedComponent] {
            [
                .init(key: "user",  component: Avatar(size: .sm, user)),
                .init(truncate: true, key: "commit", component: Div { Text(commit) }.class("text-truncate") ),
                .init(key: "date", component: Div { Text(date) }.class("text-nowrap text-secondary")),
            ]
        }
        
        public static let mockData:[DevActivity] = [
            DevActivity(user: MockData.Users[0].avatar, commit: "Fix dart Sass compatibility (#29755)", date: "28 Nov 2019"),
            DevActivity(user: MockData.Users[1].avatar, commit: "Change deprecated html tags to text decoration classes (#29604)", date: "27 Nov 2019"),
            DevActivity(user: MockData.Users[2].avatar, commit: "justify-content:between ⇒ justify-content:space-between (#29734)", date: "26 Nov 2019"),
            DevActivity(user: MockData.Users[3].avatar, commit: "Update change-version.js (#29736)", date: "26 Nov 2019"),
            DevActivity(user: MockData.Users[4].avatar, commit: "Regenerate package-lock.json (#29730)", date: "25 Nov 2019"),
        ]
    }
    
    public struct PageVisits:KeyedComponentGroup {
        let url:String
        let visitors:String
        let unique:String
        let bounceRate:String
        let bounceChart:Chart.DataSeries
        
        public func keyed() async -> [KeyedComponent] {
            [
                .init(key: "Page name",  component: await ComponentGroup {
                    Text(url)
                    Link(url: "#", label: {
                        SVGIcon(icon: .link)
                    }).margin(.leading(1))
                }),
                .init(key: "Visitors", component: Text(visitors) ),
                .init(key: "Unique", component: Text(unique) ),
                .init(key: "Bounce rate", component: Text(bounceRate) ),
                .init(colSpan: 2, key: "", component: MockData.BounceRateChart(bounceChart).class("chart-sparkline chart-sparkline-sm") ),
            ]
        }
        
        public static let mockData:[PageVisits] = [
            PageVisits(
                url: "/",
                visitors: "4,896",
                unique: "3,654",
                bounceRate: "82.54%",
                bounceChart: .init(name: "bounces", color: .primary, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
            PageVisits(
                url: "/form-elements.html",
                visitors: "3,652",
                unique: "3,215",
                bounceRate: "76.29%",
                bounceChart: .init(name: "bounces", color: .azure, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
            PageVisits(
                url: "/index.html",
                visitors: "3,256",
                unique: "2,865",
                bounceRate: "72.65%",
                bounceChart: .init(name: "bounces", color: .teal, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
            PageVisits(
                url: "/icons.html",
                visitors: "986",
                unique: "865",
                bounceRate: "44.89%",
                bounceChart: .init(name: "bounces", color: .green, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
            PageVisits(
                url: "/docs/",
                visitors: "912",
                unique: "822",
                bounceRate: "41.12%",
                bounceChart: .init(name: "bounces", color: .lime, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
            PageVisits(
                url: "/accordion.html",
                visitors: "855",
                unique: "798",
                bounceRate: "32.65%",
                bounceChart: .init(name: "bounces", color: .yellow, data: (0..<9).map { _ in Double.random(in: 1...20) })
            ),
        ]
    }
    
    static private func BounceRateChart(_ data:Chart.DataSeries) -> Component {
        Chart(options: .init(
            series: .labeled([data]),
            chart: .init(fontFamily: "inherit", height: 24, type: "line", zoom: nil, parentHeightOffset: nil, sparkline: .init(enabled: true), toolbar: nil, animations: .init(enabled: false), stacked: nil),
            dataLabels: nil,
            fill: nil,
            stroke: .init(width: 2, lineCap: "round", curve: "smooth"),
            title: nil,
            tooltip: .init(enabled: false),
            grid: nil,
            xaxis: nil,
            yaxis: nil,
            colors: [],
            labels: nil,
            legend: .init(show: false),
            plotOptions: nil,
            markers: nil
        ))
    }
    
    public struct SocialMediaTraffic:KeyedComponentGroup {
        let network:String
        let visitors:Int
        let percent:Double
        
        public func keyed() async -> [KeyedComponent] {
            [
                .init(key: "network",  component: Text(network) ),
                .init(colSpan: 2, key: "visitors", component: Text("\(visitors)") ),
                .init(noHeader: true, key: "percent", component: ProgressBar(progress: .init(progress: Int(percent)), size: .sm), cellClass: "w-50"),
            ]
        }
        
        public static let mockData:[SocialMediaTraffic] = [
            SocialMediaTraffic(network: "Instagram", visitors: 3550, percent: 71.0),
            SocialMediaTraffic(network: "Twitter", visitors: 1798, percent: 35.96),
            SocialMediaTraffic(network: "Facebook", visitors: 1245, percent: 24.9),
            SocialMediaTraffic(network: "TikTok", visitors: 986, percent: 19.72),
            SocialMediaTraffic(network: "Pinterest", visitors: 854, percent: 17.08),
            SocialMediaTraffic(network: "VK", visitors: 650, percent: 13.0),
            SocialMediaTraffic(network: "X", visitors: 420, percent: 8.4),
        ]
    }

    public struct Tasks {
        public struct TaskItem {
            public let title:String
            public let done:Bool
            public let dueDate:String
            public let subTasks:String
            public let messages:String
            public let avatar:Avatar.AvatarType
        }
        
        public static let items:[TaskItem] = [
            .init(title: "Extend the data model.", done: true, dueDate: "August 05, 2021", subTasks: "2/7", messages: "3", avatar: MockData.Users[0].avatar),
            .init(title: "Verify the event flow", done: false, dueDate: "January 01, 2019", subTasks: "3/10", messages: "6", avatar: MockData.Users[1].avatar),
            .init(title: "Database backup and maintenence", done: false, dueDate: "December 28, 2018", subTasks: "0/6", messages: "1", avatar: MockData.Users[2].avatar),
            .init(title: "Identify the implementation team.", done: true, dueDate: "November 11, 2020", subTasks: "6/10", messages: "12", avatar: MockData.Users[3].avatar),
            .init(title: "Define users and workflow", done: false, dueDate: "November 14, 2021", subTasks: "3/7", messages: "5", avatar: MockData.Users[4].avatar),
            .init(title: "Check Pull Requests", done: true, dueDate: "February 11, 2021", subTasks: "2/9", messages: "3", avatar: MockData.Users[5].avatar),
        ]
    }
    
    public struct Invoices:KeyedComponentGroup {
        struct Status {
            let label:String
            let color:Colors
        }
        
        let checked:Bool
        let number:String
        let subject:String
        let client:String
        let clientRegion:Flags
        let vatNumber:String
        let created:String
        let status:Status
        let price:String
        
        public func keyed() async -> [KeyedComponent] {
            await [
                .init(key: "selected", component: Plot.Form.Checkbox(style: .check, name: "", checked: checked, required: false, label: { EmptyComponent() }) ),
                .init(key: "number", component: Text(number) ),
                .init(key: "subject", component: Text(subject) ),
                .init(key: "client", component: await ComponentGroup { FlagIcon(size: .xs, flag: clientRegion).margin(.trailing(2)); Text(client) } ),
                .init(key: "vat no.", component: Text(vatNumber) ),
                .init(key: "created", component: Text(created) ),
                .init(key: "status", component: await ComponentGroup { Badge(style: .dot(status.color)).margin(.trailing(2)); Text(status.label) } ),
                .init(key: "price", component: Text(price) ),
                .init(key: "", component: await ComponentGroup { await Dropdown(label: "Action", items: [
                    DropDownMenu_SingleItem(url: "", content: { Text("Action") }),
                    DropDownMenu_SingleItem(url: "", content: { Text("Another action") })
                ])} )
            ]
        }
        
        public static let mockData:[Invoices] = [
            .init(checked: false, number: "001401", subject: "Design Works", client: "Carlson Limited", clientRegion: .United_States_of_America, vatNumber: "87956621", created: "15 Dec 2017", status: .init(label: "Paid", color: .green), price: "$887"),
            .init(checked: false, number: "001402", subject: "UX Wireframes", client: "Adobe", clientRegion: .Great_Britain, vatNumber: "87956421", created: "12 Apr 2017", status: .init(label: "Pending", color: .yellow), price: "$1200"),
            .init(checked: false, number: "001403", subject: "New Dashboard", client: "Bluewolf", clientRegion: .Denmark, vatNumber: "87952621", created: "23 Oct 2017", status: .init(label: "Pending", color: .yellow), price: "$534"),
            .init(checked: false, number: "001404", subject: "Landing Page", client: "Salesforce", clientRegion: .Finland, vatNumber: "87953421", created: "2 Sep 2017", status: .init(label: "Due in 2 Weeks", color: .blue), price: "$1500"),
            .init(checked: false, number: "001405", subject: "Marketing Templates", client: "Printic", clientRegion: .Uruguay, vatNumber: "87956621", created: "29 Jan 2018", status: .init(label: "Paid Today", color: .red), price: "$648"),
            .init(checked: false, number: "001406", subject: "Sales Presentation", client: "Tabdaq", clientRegion: .Curacao, vatNumber: "87956621", created: "4 Feb 2018", status: .init(label: "Due in 3 Weeks", color: .blue), price: "$300"),
            .init(checked: false, number: "001407", subject: "Logo & Print", client: "Apple", clientRegion: .United_States_of_America, vatNumber: "87956621", created: "22 Mar 2018", status: .init(label: "Paid Today", color: .green), price: "$2500"),
            .init(checked: false, number: "001408", subject: "Icons", client: "Tookapic", clientRegion: .Canada, vatNumber: "87956621", created: "13 May 2018", status: .init(label: "Paid Today", color: .green), price: "$940"),
        ]
    }
    
    public static let MapRegionData = ["AF": 16, "AL": 11, "DZ": 158, "AO": 85, "AG": 1, "AR": 351, "AM": 8, "AU": 1219, "AT": 366, "AZ": 52, "BS": 7, "BH": 21, "BD": 105, "BB": 3, "BY": 52, "BE": 461, "BZ": 1, "BJ": 6, "BT": 1, "BO": 19, "BA": 16, "BW": 12, "BR": 2023, "BN": 11, "BG": 44, "BF": 8, "BI": 1, "KH": 11, "CM": 21, "CA": 1563, "CV": 1, "CF": 2, "TD": 7, "CL": 199, "CN": 5745, "CO": 283, "KM": 0, "CD": 12, "CG": 11, "CR": 35, "CI": 22, "HR": 59, "CY": 22, "CZ": 195, "DK": 304, "DJ": 1, "DM": 0, "DO": 50, "EC": 61, "EG": 216, "SV": 21, "GQ": 14, "ER": 2, "EE": 19, "ET": 30, "FJ": 3, "FI": 231, "FR": 2555, "GA": 12, "GM": 1, "GE": 11, "DE": 3305, "GH": 18, "GR": 305, "GD": 0, "GT": 40, "GN": 4, "GW": 0, "GY": 2, "HT": 6, "HN": 15, "HK": 226, "HU": 132, "IS": 12, "IN": 1430, "ID": 695, "IR": 337, "IQ": 84, "IE": 204, "IL": 201, "IT": 2036, "JM": 13, "JP": 5390, "JO": 27, "KZ": 129, "KE": 32, "KI": 0, "KR": 986, "KW": 117, "KG": 4, "LA": 6, "LV": 23, "LB": 39, "LS": 1, "LR": 0, "LY": 77, "LT": 35, "LU": 52, "MK": 9, "MG": 8, "MW": 5, "MY": 218, "MV": 1, "ML": 9, "MT": 7, "MR": 3, "MU": 9, "MX": 1004, "MD": 5, "MN": 5, "ME": 3, "MA": 91, "MZ": 10, "MM": 35, "NA": 11, "NP": 15, "NL": 770, "NZ": 138, "NI": 6, "NE": 5, "NG": 206, "NO": 413, "OM": 53, "PK": 174, "PA": 27, "PG": 8, "PY": 17, "PE": 153, "PH": 189, "PL": 438, "PT": 223, "QA": 126, "RO": 158, "RU": 1476, "RW": 5, "WS": 0, "ST": 0, "SA": 434, "SN": 12, "RS": 38, "SC": 0, "SL": 1, "SG": 217, "SK": 86, "SI": 46, "SB": 0, "ZA": 354, "ES": 1374, "LK": 48, "KN": 0, "LC": 1, "VC": 0, "SD": 65, "SR": 3, "SZ": 3, "SE": 444, "CH": 522, "SY": 59, "TW": 426, "TJ": 5, "TZ": 22, "TH": 312, "TL": 0, "TG": 3, "TO": 0, "TT": 21, "TN": 43, "TR": 729, "TM": 0, "UG": 17, "UA": 136, "AE": 239, "GB": 2258, "US": 4624, "UY": 40, "UZ": 37, "VU": 0, "VE": 285, "VN": 101, "YE": 30, "ZM": 15, "ZW": 5]
    
    public static let MapMarkerData:[SVGMap.Marker] = [
        .init(coords: .init(lat: 61.542, lon: 105.3188), name: "Russia"),
        .init(coords: .init(lat: 56.1304, lon: -106.346), name: "Canada"),
        .init(coords: .init(lat: 71.7069, lon: -42.6043), name: "Greenland"),
        .init(coords: .init(lat: 26.8206, lon: 30.8025), name: "Egypt"),
        .init(coords: .init(lat: -14.235, lon: -51.9253), name: "Brazil"),
        .init(coords: .init(lat: 35.8617, lon: 104.1954), name: "China"),
        .init(coords: .init(lat: 37.0902, lon: -95.7129), name: "United States"),
        .init(coords: .init(lat: 60.472024, lon: 8.468946), name: "Norway"),
        .init(coords: .init(lat: 48.379433, lon: 31.16558), name: "Ukraine"),
    ]
    
    public static let MapMarkerLines:[SVGMap.Lines.Line] = [
        .init(from: "Russia", to: "Greenland"),
        .init(from: "Russia", to: "United States"),
        .init(from: "Russia", to: "Canada"),
        .init(from: "Brazil", to: "Norway"),
        .init(from: "Brazil", to: "Ukraine"),
        .init(from: "Brazil", to: "Egypt"),
        .init(from: "Brazil", to: "China"),
    ]
    
    public struct HTTPRequestAssertions:KeyedComponentGroup {
        
        enum Source:CaseIterable {
            case statusCode
            case jsonBody
            case headers
            case textBody
            case responseTime
            
            var label:String {
                switch self {
                case .statusCode: "Status Code"
                case .jsonBody: "JSON Body"
                case .headers: "Headers"
                case .textBody: "Text Body"
                case .responseTime: "Response Time"
                }
            }
        }
        
        enum Comparison:CaseIterable {
            case equals
            case notEqual
            case hasKey
            case doesNotHaveKey
            case hasValue
            case doesNotHaveValue
            case isEmpty
            case isNotEmpty
            case greaterThan
            case lessThan
            
            var label:String {
                switch self {
                case .equals: "Equals"
                case .notEqual: "Not Equal"
                case .hasKey: "Has Key"
                case .doesNotHaveKey: "Does not have Key"
                case .hasValue: "Has Value"
                case .doesNotHaveValue: "Does not have Value"
                case .isEmpty: "Is Empty"
                case .isNotEmpty: "Is not Empty"
                case .greaterThan: "Greater Than"
                case .lessThan: "Less Than"
                }
            }
        }
        
        let source:Source?
        let property:String?
        let comparison:Comparison?
        let target:String?
        
        public func keyed() async -> [KeyedComponent] {
            await [
                .init(key: "source", component: Plot.Form.Selection(name: "assertion-source", options: Source.allCases.asyncMap { sType in
                     await .init(value: "\(sType)", selected: self.source == sType, label: { Text(sType.label) })
                })),
                .init(key: "property", component: Plot.Form.Textfield(name: "assertion-prop", value: property, placeholder: "property value", isRequired: false)),
                .init(key: "comparison", component: Plot.Form.Selection(name: "assertion-comp", options: Comparison.allCases.asyncMap { cType in
                    await .init(value: "\(cType)", selected: self.comparison == cType, label: { Text(cType.label) })
                })),
                .init(key: "target", component: Plot.Form.Textfield(name: "assertion-target", value: target, placeholder: "target", isRequired: false)),
            ]
        }
        
        public static let mockData:[HTTPRequestAssertions] = [
            .init(source: .statusCode, property: nil, comparison: .equals, target: "200"),
            .init(source: .jsonBody, property: "parameters.alt.type", comparison: .hasValue, target: "string"),
            .init(source: .responseTime, property: nil, comparison: .lessThan, target: "500"),
            .init(source: .headers, property: "content-type", comparison: .equals, target: "application/json; charset=UTF-8"),
        ]
    }
}

extension Array where Element == NavBar.RouteItem {
    static public var demoRoutes:[NavBar.RouteItem] = [
        .init(title: "Home", url: "/home", icon: .home, active: true),
        .init(title: "Interface", icon: .box, subLinks: [[
            .init(title: "Alerts", url: "/alerts"),
            .init(title: "Accordion", url: "/accordion"),
            .init(title: "Authentication", subLinks: [
                .init(title: "Sing in", url: "/sign-in"),
                .init(title: "Sing in link", url: "/sign-in-link", decoration: NavBar.NewBadge()),
                .init(title: "Sing in with illustration", url: "/sign-in-illustrated"),
                .init(title: "Sign in with cover", url: "/sign-in-cover"),
                .init(title: "Sign up", url: "/sign-up"),
                .init(title: "Sign up with illustration", url: "/sign-up-illustrated"),
                .init(title: "Sign up with cover", url: "/sign-up-cover"),
                .init(title: "Forgot password", url: "/forgot-password"),
                .init(title: "Terms of service", url: "/tos"),
                .init(title: "Lock screen", url: "/lock-screen"),
                .init(title: "2 step verification", url: "/"),
                .init(title: "2 step verification code", url: "/"),
            ]),
            .init(title: "Blank page", url: "/blank-page"),
            .init(title: "Badges", url: "/badges", decoration: NavBar.NewBadge()),
            .init(title: "Buttons", url: "/buttons"),
            .init(title: "Cards", subLinks: [
                .init(title: "Sample cards", url: "/cards-sample"),
                .init(title: "Cards actions", url: "/cards-action", decoration: NavBar.NewBadge()),
                .init(title: "Cards masonry", url: "/cards-masonry"),
            ], decoration: NavBar.NewBadge()),
            .init(title: "Carousel", url: "/carousel", decoration: NavBar.NewBadge()),
            .init(title: "Charts", url: "/charts"),
            .init(title: "Colors", url: "/colors"),
            .init(title: "Color Picker", url: "/color-picker", decoration: NavBar.NewBadge()),
            .init(title: "Data grid", url: "/data-grid", decoration: NavBar.NewBadge()),
            .init(title: "Datatables", url: "/datatables", decoration: NavBar.NewBadge()),
            .init(title: "Dropdowns", url: "/dropdowns"),
            .init(title: "Dropzone", url: "/dropzone", decoration: NavBar.NewBadge()),
            .init(title: "Error pages", subLinks: [
                .init(title: "404 page", url: "/errors-404"),
                .init(title: "500 page", url: "/errors-500"),
                .init(title: "Maintenance page", url: "/errors-maintenance"),
            ]),
            .init(title: "Flags", url: "/flags", decoration: NavBar.NewBadge()),
            .init(title: "Inline player", url: "/inline-player", decoration: NavBar.NewBadge()),
            .init(title: "Timelines", url: "/timelines", decoration: NavBar.NewBadge()),
        ], [
            .init(title: "Lightbox", url: "/lightbox", decoration: NavBar.NewBadge()),
            .init(title: "Lists", url: "/lists"),
            .init(title: "Modal", url: "/modal"),
            .init(title: "Map", url: "/map"),
            .init(title: "Map Fullsize", url: "/map-full"),
            .init(title: "Map Vector", url: "/map-vector", decoration: NavBar.NewBadge()),
            .init(title: "Markdown", url: "/markdown"),
            .init(title: "Navigation", url: "/navigation"),
            .init(title: "Offcanvas", url: "/offcanvas"),
            .init(title: "Pagination", url: "/pagination"),
            .init(title: "Placeholder", url: "/placeholder"),
            .init(title: "Steps", url: "/steps", decoration: NavBar.NewBadge()),
            .init(title: "Star Rating", url: "/star-rating", decoration: NavBar.NewBadge()),
            .init(title: "Tabs", url: "/tabs"),
            .init(title: "Tags", url: "/tags"),
            .init(title: "Tables", url: "/tables"),
            .init(title: "Typography", url: "/typography"),
            .init(title: "TinyMCE", url: "/tiny-mce", decoration: NavBar.NewBadge()),
        ]]),
        .init(title: "Form Elements", url: "/form-elements", icon: .checkbox),
        .init(title: "Extra", icon: .star, subLinks: [[
            .init(title: "Empty page", url: "/pages-empty"),
            .init(title: "Cookie Banner", url: "/cookie-banner", decoration: NavBar.NewBadge()),
            .init(title: "Chat", url: "/chat", decoration: NavBar.NewBadge()),
            .init(title: "Activity", url: "/activity"),
            .init(title: "Gallery", url: "/gallery"),
            .init(title: "Invoice", url: "/invoice"),
            .init(title: "Search results", url: "/search-results"),
            .init(title: "Pricing cards", url: "/pricing-cards"),
            .init(title: "Pricing table", url: "/pricing-table"),
            .init(title: "FAQ", url: "/faq", decoration: NavBar.NewBadge()),
            .init(title: "Users", url: "/users"),
            .init(title: "License", url: "/license"),
        ],[
            .init(title: "Logs", url: "/logs", decoration: NavBar.NewBadge()),
            .init(title: "Music", url: "/music"),
            .init(title: "Photogrid", url: "/photogrid", decoration: NavBar.NewBadge()),
            .init(title: "Tasks", url: "/tasks", decoration: NavBar.NewBadge()),
            .init(title: "Uptime monitor", url: "/uptime-monitor"),
            .init(title: "Widgets", url: "/widgets"),
            .init(title: "Wizard", url: "/wizard"),
            .init(title: "Settings", url: "/settings", decoration: NavBar.NewBadge()),
            .init(title: "Trail ended", url: "/trial-ended", decoration: NavBar.NewBadge()),
            .init(title: "Job Listing", url: "/job-listing", decoration: NavBar.NewBadge()),
            .init(title: "Page loader", url: "/page-loader", decoration: NavBar.NewBadge()),
        ]]),
        .init(title: "Layout", icon: .chart_grid_dots, subLinks: [[
            .init(title: "Horizontal", url: "/horizontal"),
            .init(title: "Boxed", url: "/boxed", decoration: NavBar.NewBadge()),
            .init(title: "Vertical", url: "/vertical"),
            .init(title: "Vertical transparent", url: "/vertical-transparent"),
            .init(title: "Right vertical", url: "/right-vertical"),
            .init(title: "Condensed", url: "/condensed"),
            .init(title: "Combined", url: "/combined"),
        ],[
            .init(title: "Navbar dark", url: "/navbar-dark"),
            .init(title: "Navbar sticky", url: "/navbar-sticky"),
            .init(title: "Navbar overlap", url: "/navbar-overlap"),
            .init(title: "RTL mode", url: "/rtl-mode"),
            .init(title: "Fluid", url: "/fluid"),
            .init(title: "Fluid vertical", url: "/fluid-vertical"),
        ]]),
        .init(title: "4713 Icons", url: "/icons", icon: .ghost),
        .init(title: "Email Templates", url: "/email-templates", icon: .mail),
        .init(title: "Help", icon: .lifebuoy, subLinks: [[
            .init(title: "Documentation", url: "/documentation"),
            .init(title: "Changelog", url: "/changelog"),
            .init(title: "Source code", url: "/source-code"),
            .init(title: "Sponsor Project!", url: "/sponsor-project"),
            
        ]])
    ]
}
