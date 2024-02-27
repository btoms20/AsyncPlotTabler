import Fluent
import Vapor
import AsyncPlotTabler

struct TodoController: RouteCollection {
    static let root:String = "/todos"
    
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("todos")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.get("delete", use: delete)
            todo.get("toggle", use: toggle)
        }
    }

    /// This is the main page of our Demo containing the Todo List
    func index(req: Request) async throws -> Response {
        // Fetch our Todo's from the database
        let todos = try await Todo.query(on: req.db).all()
        // Render the TodoPage with the Todo's
        return await Response(
            component: TodoPage(todos: todos)
        )
    }
    
    /// This route attempts to create a new `Todo` given valid POST data containing a `title`
    func create(req: Request) async throws -> Response {
        do {
            let ct = try req.decodeAndValidate(Todo.Create.self)
            let todo = Todo(title: ct.title, done: false)
            try await todo.save(on: req.db)
        } catch {
            // If the error was due to an invalid Todo.Create object, then pass the error / feedback back along to the user.
            if let validationError = error as? ValidationsError {
                // Fetch our Todo's from the database
                let todos = try await Todo.query(on: req.db).all()
                // Render the TodoPage with the Todo's and Error Feedback
                return await Response(
                    component: TodoPage(todos: todos, feedback: validationError.description)
                )
            }
        }
        return req.redirect(to: TodoController.root)
    }

    /// This route deletes a `Todo` based on the `ID` encoded in the URL
    func delete(req: Request) async throws -> Response {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(force: true, on: req.db)
        return req.redirect(to: TodoController.root)
    }
    
    /// This route simply toggles the Todo's `done` value based on the `ID` encoded in the URL
    func toggle(req: Request) async throws -> Response {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        todo.done.toggle()
        try await todo.update(on: req.db)
        return req.redirect(to: TodoController.root)
    }
}

extension Request {
    /// A helper method that both decodes a `Content` struct and validates it when it conforms to the `Validatable` protocol
    public func decodeAndValidate<C: Content>(_: C.Type) throws -> C {
        if let V = C.self as? Validatable.Type { try V.validate(content: self) }
        return try self.content.decode(C.self)
    }
}

extension Response {
    public convenience init(
        status: HTTPResponseStatus = .ok,
        version: HTTPVersion = .init(major: 1, minor: 1),
        headers: HTTPHeaders = .init(),
        component: Component = EmptyComponent()
    ) async {
        self.init(
            status: status,
            version: version,
            headers: headers,
            body: .init(string: await component.renderInWrappedHTMLBody())
        )
    }
}
