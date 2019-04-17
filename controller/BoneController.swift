import Vapor
import Fluent
import FluentPostgreSQL

struct {{name | firstUppercase}}Controller:RouteCollection{
    func boot(router: Router) throws {
        
        let {{name | lowercase}}Route = router.grouped("api", "{{name | lowercase}}")
        
        {{name | lowercase}}Route.get(use: getAllHandler)
        {{name | lowercase}}Route.get({{name}}.parameter, use: getHandler)
        {{name | lowercase}}Route.post({{name}}.self, use: saveHandler)
        {{name | lowercase}}Route.put({{name}}.self, at: {{name}}.parameter, use: updateHandler)
        {{name | lowercase}}Route.delete({{name}}.parameter, use: deleteHandler)
    }
    
    /// Get all the {{name | lowercase}}s
    ///
    /// - Parameter req: request
    /// - Returns: all users
    /// - Throws: any error found
    func getAllHandler(_ req:Request) throws -> Future<[{{name}}]>{
        return {{name}}.query(on: req).all()
    }
    
    /// Get single {{name | lowercase}}
    ///
    /// - Parameter req: request
    /// - Returns: single user
    /// - Throws: any error
    
    func getHandler(_ req:Request) throws -> Future<{{name}}>{
        return try req.parameters.next({{name}}.self)
    }
    
    // Save new {{name}}

    /// save new {{name | lowercase}}
    ///
    /// - Parameters:
    ///   - req: request
    ///   - {{name | lowercase}}: {{name | lowercase}} passed through json
    /// - Returns: {{name | lowercase}} saved
    /// - Throws: any error
    func saveHandler(_ req:Request, {{name | lowercase}}:{{name}}) throws -> Future<{{name}}>{
        return {{name | lowercase}}.save(on: req)
    }
    
    
    // Update {{name | lowercase}}    
    
    /// update user
    ///
    /// - Parameters:
    ///   - req: request
    ///   - new{{name}}: the new {{name}}
    /// - Returns: the updated {{name | lowercase}}
    /// - Throws: any error
    func updateHandler(_ req:Request, new{{name}}:{{name}}) throws -> Future<{{name}}>{
        return try req.parameters.next({{name}}.self).flatMap({ old{{name}} in

            return old{{name}}.save(on: req)
        })
    }
    
    
    /// delete {{name | lowercase}}
    ///
    /// - Parameter req: request
    /// - Returns: status no content
    /// - Throws: any error
    func deleteHandler(_ req:Request) throws -> Future<HTTPStatus>{
        let {{name | lowercase}} = try req.parameters.next({{name}}.self)
        return {{name | lowercase}}.delete(on: req)
            .transform(to: HTTPStatus.noContent)
    }
    
}

