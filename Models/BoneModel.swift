import Fluent
import Vapor

final class {{name|firstUppercase}}: Model, Content {
    static let schema = "{{name}}s"
    
    @ID(key: .id)
    var id: UUID?

    // @Field(key: "title")
    // var title: String

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        // self.title = title
    }
}
