//
//  Markdown.swift
//  PlotTabler
//

//import Splash
import Plot

public struct Markdown:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "markdown") { comp }
    }
}

extension Markdown {
    public struct CodeBlock: Component {
        
        //let highlighter = SyntaxHighlighter(format: HTMLOutputFormat())
        
        let code:String
        
        public init(code: String) {
            self.code = code
        }
        
        /*
         <div class="language-plaintext highlighter-rouge">
           <div class="highlight">
             <pre class="highlight"><code>// Some comments
                line 1 of code
                line 2 of code
                line 3 of code
                </code></pre>
           </div>
         */
        public func body() async -> Component {
            await Markdown {
                await DivC("language-js highlighter-rouge") {
                    await DivC("highlight") {
                        await Pre {
                            await Code {
                                Text(code)
                            }
                        }.class("highlight")
                    }
                }
            }
        }
    }
}

public struct RawHTML:Component {
    let str:String
    
    public init(_ str:String) {
        self.str = str
    }
    
    public func body() async -> Component {
        Div { await Node<Any>.raw(str) }
    }
}


public struct Cite:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "cite") { comp }
    }
}

public struct Code:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "code") { comp }
    }
}

public struct Emphasis:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "em") { comp }
    }
}

public struct Italic:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "i") { comp }
    }
}

public struct Keyboard:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "kbd") { comp }
    }
}

public struct Mark:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "mark") { comp }
    }
}

public struct Pre:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "pre") { comp }
    }
}

public struct Sample:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "samp") { comp }
    }
}

public struct Strong:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "strong") { comp }
    }
}

public struct Strikethrough:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "s") { comp }
    }
}

public struct Subscript:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "sub") { comp }
    }
}

public struct Superscript:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "sup") { comp }
    }
}

public struct Time:Component {
    let comp:Component
    
    public init(_ str:String) {
        self.comp = Text(str)
    }
    
    public init(@ComponentBuilder _ c:ContentProvider) async {
        self.comp = await c()
    }
    
    public func body() async -> Component {
        await Element(name: "time") { comp }
    }
}
