import Fluent
import Vapor

struct {{name|firstUppercase}}Controller: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let {{name}}s = routes.grouped("{{name}}s")
        {{name}}s.get(use: index)
        {{name}}s.post(use: create)
        {{name}}s.group(":{{name}}ID") { {{name}} in
            {{name}}.delete(use: delete)
        }
    }

    static func index(req: Request) async throws -> [{{name|firstUppercase}}] {
        return try await {{name|firstUppercase}}.query(on: req.db).all()
    }

    func index(req: Request) async throws -> [{{name|firstUppercase}}] {
       return try await {{name|firstUppercase}}Controller.index(req: req)
    }

    func create(req: Request) async throws -> <{{name|firstUppercase}}> {
        let {{name}} = try req.content.decode({{name|firstUppercase}}.self)
        try await {{name}}.save(on: req.db)
        return {{name}}
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let {{name}} = try await {{name|firstUppercase}}.find(req.parameters.get("{{name}}ID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await {{name}}.delete(on: req.db)
        return .ok 
    }
}