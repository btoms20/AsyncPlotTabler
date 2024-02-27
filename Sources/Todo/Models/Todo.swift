import Fluent
import Vapor

final class Todo: Model, Content {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Timestamp(key: "created_at", on: .create)
    var createdAt:Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt:Date?
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt:Date?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "done")
    var done: Bool
    
    init() { }

    init(id: UUID? = nil, title: String, done: Bool = false) {
        self.id = id
        self.title = title
        self.done = done
    }
}

extension Todo {
    /// A struct used for Creating a new `Todo` Item
    /// - Note: We conform to `Validatable` to verify user input and to provide feedback to the user when invalid input is provided (such as an emtpy `title` string)
    /// - Note: A `ValidationsError` provides human readable feedback, which we pass along to the user in the ``TodoController/create(req:)`` route
    struct Create:Content, Validatable {
        let title:String
        
        /// We can use the `Validatable` protocol to ensure that new `Todo` items have a `title` that is more than one letter and less than 51 letters.
        static func validations(_ validations: inout Validations) {
            // Ensure the title is between 2 and 50 chars
            validations.add("title", as: String.self, is: .count(2...50))
            
            // If we hate joy and wanted to prevent emojis we could enforce an only .ascii characters rule
            //validations.add("title", as: String.self, is: .ascii)
        }
    }
}

extension Array where Element == Todo {
    /// Sorts an Array of Todo items by whether or not they're marked done
    var sortByDone:Array<Todo> {
        self.sorted { lhs, rhs in
            switch (lhs.done, rhs.done) {
            case (false, true):
                return true
            default:
                return false
            }
        }
    }
    
    /// Splits an Array of Todos into two parts, one sequence that's marked done and one sequence that isn't
    var sortAndGroup:[(Bool, Array<Todo>.SubSequence)] {
        self.sortByDone.chunked(on: { $0.done })
    }
}

extension ArraySlice where Element == Todo {
    /// Sorts an Array of Todo elements by their creation date
    var sortedByCreationDate:Array<Todo> {
        self.sorted { lhs, rhs in
            switch (lhs.createdAt, rhs.createdAt) {
            case ( .some(let l), .some(let r) ):
                return l < r
            case (.none, .some):
                return false
            case (.some, .none):
                return true
            default:
                return true
            }
        }
    }
}
