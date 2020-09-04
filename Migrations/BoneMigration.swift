import Fluent

struct Create{{name|firstUppercase}}: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("{{name}}s")
            .id()
            // .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("{{name}}s").delete()
    }
}
