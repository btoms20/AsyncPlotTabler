extension Posts {
    
    static var post1 = BlogPost(
        id: "0101B2E1-233A-44F8-A440-FB3F5C421480",
        title: "Hello VPT",
        subTitle: "Welcome to the VPT Blog Example - This is an example showing how you can render Markdown using Ink",
        imageURL: "https://images.unsplash.com/photo-1677430435450-1c792e33ef71?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        imageDescription: "An abstract image by Steve Johnson",
        categories: [.init(title: "Example Category", color: .teal)],
        published: "Feb 29th, 2024",
        readTime: "5 minute read",
        contents: .markdown( Posts.MarkdownTest )
    )
    
    // Consider parsing this once at build time and then render the raw HTML
    private static var MarkdownTest:String = """
    # AsyncPlotTabler
    Prebuilt Tabler Components for Async HTML Rendering in Vapor

    #### What's [Plot](https://github.com/JohnSundell/Plot)?
    > Plot, a domain-specific language (DSL) for writing type-safe HTML, XML and RSS in Swift. It can be used to build websites, documents and feeds, as a templating tool, or as a renderer for higher-level components and tools. It’s primary focus is on static site generation and Swift-based web development.

    #### What's [Tabler](https://github.com/tabler/tabler)?
    > Tabler is fully responsive and compatible with all modern browsers. Thanks to its modern and user-friendly design you can create a fully functional interface that users will love! Choose the layouts and components you need and customize them to make your design consistent and eye-catching. Every component has been created with attention to detail to make your interface beautiful!

    #### What's [Vapor](https://github.com/vapor/vapor)?
    > Vapor is an HTTP web framework for Swift. It provides a beautifully expressive and easy-to-use foundation for your next website, API, or cloud project.

    ### When we combine these three powerful technologies, something revolutionary[^1] happens...

    #### 🔥 Check out the [Demo Website](https://vpt.btoms20.com)

    ![VPT-Home](https://github.com/btoms20/AsyncPlotTabler/assets/32753167/c06128fb-48bc-43a6-94fc-ec9f73aa7d7d)

    **NOTE**
    This is just a hosted version of the `Demo` executable included within this package

    ## Local Demos
    #### 🔥 Tablers Demo Website
    - Run the `Demo` target within Xcode
    - Or execute `swift run Demo`

    #### ✅ A Todo Demo
    The only thing missing from [Vapor's awesome Todo example](https://github.com/vapor/template-fluent-postgres) is a UI to interact with your fancy new API!
    - Make sure your Postgres (or DB of choice) server is up, running and reachable
    - Run the `Todo` target within Xcode
    - Or execute `swift run Todo`

    **IMPORTANT**
    Before running any of the demos or deploying your own app...
    You need to create a `Public` dir in your apps working directory with Tablers [`static`](https://github.com/tabler/tabler/tree/dev/demo/static) and [`dist`](https://github.com/tabler/tabler/tree/dev/dist) assets with the following structure
    ``` bash
    ├── Public
    │   ├── static/
    │   ├── libs/
    │   ├── img/
    │   ├── js/
    │   └── css/
    ```

    ## API
    ``` swift
    // TODO
    ```

    ## Contributing

    Contributions are welcomed! This code is very much a proof of concept. I can guarantee you there's a better / safer way to accomplish the same results. Any suggestions, improvements, or even just critques, are welcome!

    Let's make this code better together! 🤝

    ## Credits

    - [swift-nio](https://github.com/apple/swift-nio)
    - [Vapor](https://github.com/vapor/vapor)
    - [Plot](https://github.com/JohnSundell/Plot)
    - [Tabler](https://github.com/tabler/tabler)

    ## License

    [MIT](LICENSE) 2024


    [^1]: There's no evidence to support this claim
    """
}
