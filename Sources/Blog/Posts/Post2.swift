extension Posts {
    
    static var post2 = BlogPost(
        id: "ACBB0186-8A6F-43AA-9660-8C7257F08AFC",
        title: "Swift on Server",
        subTitle: "A brief introduction to using Swift on your server!",
        imageURL: "https://images.unsplash.com/photo-1677430435457-b9cc1e90d5fd?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        imageDescription: "An abstract image by Steve Johnson",
        categories: [.init(title: "Software Engineering", color: .purple)],
        published: "Feb 27th, 2024",
        readTime: "1 minute read",
        contents: .markdown("""
        
        [Vapor](https://vapor.codes) is an HTTP web framework for Swift. It provides a beautifully expressive and easy-to-use foundation for your next website, API, or cloud project.

        Take a look at some of the [awesome stuff](https://github.com/Cellane/awesome-vapor) created with Vapor.

        ### 💧 Community

        Join the welcoming community of fellow Vapor developers on [Discord](https://vapor.team).

        ### 🚀 Contributing

        To contribute a **feature or idea** to Vapor, [create an issue](https://github.com/vapor/vapor/issues/new) explaining your idea or bring it up on [Discord](https://vapor.team).

        If you find a **bug**, please [create an issue](https://github.com/vapor/vapor/issues/new).

        If you find a **security vulnerability**, please contact [security@vapor.codes](mailto:security@vapor.codes) as soon as possible.
        
        """
        )
    )
    
}
