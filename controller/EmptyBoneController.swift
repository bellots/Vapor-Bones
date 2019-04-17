import Vapor
import Fluent
import FluentPostgreSQL

struct {{name | firstUppercase}}Controller:RouteCollection{
    func boot(router: Router) throws {
    	print("{{parent}}")
    	print("{{children}}")
    }
}
