import Vapor
import FluentPostgreSQL

final class {{name | firstUppercase}}:Codable{
    var id:Int?

	// ➡️ RelationShipKeys


	init(
		// ➡️ relationshipInitVariable
		){

		// ➡️ relationshipVariableAssignment
	}
}

extension {{name | firstUppercase}}:PostgreSQLModel{}
extension {{name | firstUppercase}}:Parameter{}
extension {{name | firstUppercase}}:Migration{}
extension {{name | firstUppercase}}:Content{}


// ➡️ RelationShips

    
