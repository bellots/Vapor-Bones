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

    func index(req: Request) throws -> EventLoopFuture<[{{name|firstUppercase}}]> {
        return {{name|firstUppercase}}.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<{{name|firstUppercase}}> {
        let {{name}} = try req.content.decode({{name|firstUppercase}}.self)
        return {{name}}.save(on: req.db).map { {{name}} }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return {{name|firstUppercase}}.find(req.parameters.get("{{name}}ID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}