import Vapor
{% if database %}{% if database == "psql"%}import FluentPostgreSQL{% else %}import FluentMySQL{% endif %}{% else %}import FluentPostgreSQL{%endif%}
    

final class {{name | firstUppercase}}:Codable{
    var id:Int?
}

extension {{name | firstUppercase}}:{% if database %}{% if database == "psql"%}PostgreSQLModel{% else %}MySQLModel{% endif %}{% else %}PostgreSQLModel{%endif%}{}
extension {{name | firstUppercase}}:Parameter{}
extension {{name | firstUppercase}}:Migration{}
extension {{name | firstUppercase}}:Content{}


// ➡️ Relationships

    
