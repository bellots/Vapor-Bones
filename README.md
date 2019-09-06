# Vapor-Bones

Some bones utility for Vapor projects:

* `murray bone new emptycontroller {{name you want}}` => creates a new Empty controller and saves it inside `Sources/App/Controllers`
* `murray bone new model {{name you want}}` => creates a new model with basic configuration and a related controller with all CRUD methods (`Post, get all, get single, update, delete `..).
If you want to specify what kind of database will communicate with your model, add --param "database:" with this types: `psql, mysql`.
* `murray bone new pivot {{name of file}} --param "first: FirstModel" --param "second: SecondModel"` => creates a pivot file for Sibling relationship. 


#Notes:

For every bone described above, you should add migration for created model/pivot in `configure.swift` file.