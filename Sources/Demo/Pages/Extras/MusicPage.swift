import AsyncPlotTabler

/// Music Demo View
struct MusicPage: Component {
    
    struct Track {
        let thumbnail:URLRepresentable
        let track:String
        let artist:String
        let duration:String
        let hearted:Bool
    }
    
    let tracks:[Track] = [
        .init(thumbnail: "./static/tracks/a4fb1d293bd8d3fd38352418c50fcf1369a7a87d.jpg", track: "Górą ty", artist: "GOLEC UORKIESTRA, Gromee, Bedoes", duration: "3:41", hearted: false),
        .init(thumbnail: "./static/tracks/f04bb6fba32e89475d9981007aff21e13745dec2.jpg", track: "High Life", artist: "Daft Punk", duration: "3:21", hearted: false),
        .init(thumbnail: "./static/tracks/c3f13b4f7a674abda9aa36fd72fa341e918c0f26.jpg", track: "Houdini", artist: "Foster The People", duration: "3:23", hearted: false),
        .init(thumbnail: "./static/tracks/4d4ab714dfca7b9df41d4a02a2c39394ebdeb6b6.jpg", track: "Safe And Sound", artist: "Capital Cities", duration: "3:12", hearted: false),
        .init(thumbnail: "./static/tracks/79b2422b467ad20c07576e8f8f5f2f1692ac7142.jpg", track: "Partied Out", artist: "Con Bro Chill", duration: "3:17", hearted: false),
        .init(thumbnail: "./static/tracks/aac97056fc02fe02c7e95f7ff77a07c6e82f7d6e.jpg", track: "Runaway (U & I)", artist: "Galantis", duration: "3:47", hearted: false),
        .init(thumbnail: "./static/tracks/859337f0eaa49b1ad6ed76719b7c1ae26d6412c8.jpg", track: "Light It Up (feat. Nyla & Fuse ODG) - Remix", artist: "Major Lazer, Nyla, Fuse ODG", duration: "2:46", hearted: false),
        .init(thumbnail: "./static/tracks/2e7357491deb8a6796ee8d9181ca9ea1f407bb5f.jpg", track: "Hangover", artist: "Taio Cruz, Flo Rida", duration: "4:04", hearted: false),
        .init(thumbnail: "./static/tracks/c976bfc96d5e44820e553a16a6097cd02a61fd2f.jpg", track: "Shape of You", artist: "Ed Sheeran", duration: "3:53", hearted: false),
        .init(thumbnail: "./static/tracks/c9a8350feee77e9345eec4155cddc96694803d1a.jpg", track: "Alone", artist: "Alan Walker", duration: "2:41", hearted: false),
        .init(thumbnail: "./static/tracks/fe4ee21d30450829e5b172e806b3c1e14ca1e5f3.jpg", track: "Langrennsfar", artist: "Ylvis", duration: "2:43", hearted: false),
        .init(thumbnail: "./static/tracks/f4e96086f44c4dff1758b1fc1338cd88c1b5ce9c.jpg", track: "Skibidi - Romantic Edition", artist: "Little Big", duration: "3:12", hearted: false)
    ]
    
    let favorites:[Track] = [
        .init(thumbnail: "./static/tracks/c976bfc96d5e44820e553a16a6097cd02a61fd2f.jpg", track: "Shape of You", artist: "Ed Sheeran", duration: "3:53", hearted: false),
        .init(thumbnail: "./static/tracks/c9a8350feee77e9345eec4155cddc96694803d1a.jpg", track: "Alone", artist: "Alan Walker", duration: "2:41", hearted: false),
        .init(thumbnail: "./static/tracks/fe4ee21d30450829e5b172e806b3c1e14ca1e5f3.jpg", track: "Langrennsfar", artist: "Ylvis", duration: "2:43", hearted: false),
        .init(thumbnail: "./static/tracks/f4e96086f44c4dff1758b1fc1338cd88c1b5ce9c.jpg", track: "Skibidi - Romantic Edition", artist: "Little Big", duration: "3:12", hearted: false),
        .init(thumbnail: "./static/tracks/73f4938130140174efb1cc0a82ececb277e40932.jpg", track: "Miracle", artist: "Caravan Palace", duration: "3:32", hearted: false),
        .init(thumbnail: "./static/tracks/cfb2a532996512eff95c4b0d566d067384aaa441.jpg", track: "Different World (feat. CORSAK)", artist: "Alan Walker, K-391, Sofia Carson, CORSAK", duration: "3:56", hearted: false),
    ]
    
    func body() async -> Plot.Component {
        await Site(header: NavBar(brand: .init(title: "Tabler"), routes: .demoRoutes), page: Page(
            header: .init(header: "Music Components"),
            content: {
                await CardVStack {
                    await CardHStack {
                        await Card(
                            size: .large(.num(8)),
                            body: .raw({
                                await Plot.Form.ListGroup(style: .div, theme: .card, background: .regular, scrollable: false, hoverable: false, items: tracks.enumerated().asyncMap { i, track in
                                    await .init(link: "#", content: {
                                        await LabeledAvatar(avatar: .init(size: .md, .picture(track.thumbnail)), title: track.track, subTitle: track.artist, link: "#", leadingContent: {
                                            Text("\(i + 1)")
                                        }, trailingContent: {
                                            
                                            Div {
                                                Text(track.duration)
                                            }.textColor(.secondary)
                                        
                                            Link(url: "#") {
                                                Button {
                                                    // Off
                                                    Span { SVGIcon(icon: .heart) }
                                                        .class("switch-icon-a")
                                                        .textColor(.muted)

                                                    // On
                                                    Span { SVGIcon(icon: .heart_filled) }
                                                        .class("switch-icon-b")
                                                        .textColor(.red)
                                                }
                                                .class("switch-icon")
                                                .attribute(named: "data-bs-toggle", value: "switch-icon")
                                            }.class("link-secondary")
                                        
                                            await DivC("dropdown") {
                                                Link(url: "#") {
                                                    SVGIcon(icon: .dots)
                                                }
                                                .class("link-secondary")
                                                .attribute(named: "data-bs-toggle", value: "dropdown")
                                                await DropDownMenu(columns: [[
                                                    DropDownMenu_SingleItem(url: "#", content: {
                                                        Text("Action")
                                                    }),
                                                    await DropDownMenu_SingleItem(url: "#", content: {
                                                        Text("Another Action")
                                                    })
                                                ]])
                                            }
                                            
                                        })
                                    })
                                })
                            })
                        )
                        
                        await CardVStack {
                            
                            H3 { Text("Top Tracks") }
                            
                            for favorite in favorites {
                                await Card(
                                    image: .init(src: favorite.thumbnail, size: .init(width: 0, height: 0), position: .leading),
                                    body: .init({
                                        Text(favorite.track)
                                        Div {
                                            Text(favorite.artist)
                                        }.textColor(.secondary)
                                    })
                                )
                            }
                            
                        }
                    }
                    
                }
            })
        )
    }
}
