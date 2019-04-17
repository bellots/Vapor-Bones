import Vapor
import FluentPostgreSQL

final class {{name | firstUppercase}}:Codable{
    var id:Int?
}

extension {{name | firstUppercase}}:PostgreSQLModel{}
extension {{name | firstUppercase}}:Parameter{}
extension {{name | firstUppercase}}:Migration{}
extension {{name | firstUppercase}}:Content{}


// ➡️ RelationShips

    
