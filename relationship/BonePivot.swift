import Foundation
import FluentPostgreSQL

final class {{first | firstUppercase}}{{second | firstUppercase}}Pivot:PostgreSQLUUIDPivot{
	
	var id:UUID?

	var {{first | lowercase}}ID: {{first | firstUppercase}}.ID 
	var {{second | lowercase}}ID: {{second | firstUppercase}}.ID 

	typealias Left = {{first | firstUppercase}}
  	typealias Right = {{second | firstUppercase}}

	static let leftIDKey: LeftIDKey = \.acronymID
	static let rightIDKey: RightIDKey = \.categoryID
	
	init(_ {{first | lowercase}}: {{first | firstUppercase}}, _ {{second | lowercase}}: {{second | firstUppercase}}) throws {
	  self.{{first | lowercase}}ID = try {{first | lowercase}}.requireID()
	  self.{{second | lowercase}}ID = try {{second | lowercase}}.requireID()
	}
}
// 7
extension {{first | firstUppercase}}{{second | firstUppercase}}Pivot: Migration {}
extension {{first | firstUppercase}}{{second | firstUppercase}}Pivot: ModifiablePivot {}