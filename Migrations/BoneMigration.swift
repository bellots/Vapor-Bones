import Fluent

struct Create{{name|firstUppercase}}: AsyncMigration {
    func prepare(on database: Database) async throws {
        return try await database.schema("{{name}}s")
            .id()
            // .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        return try await database.schema("{{name}}s").delete()
    }
}
