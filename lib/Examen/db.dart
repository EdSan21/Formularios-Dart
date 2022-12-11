import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  Database? db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    //join is from path package
    print(
        path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db

    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''

                  CREATE TABLE IF NOT EXISTS productos( 
                        id primary key,
                        name varchar(255) not null,
                        codigo int not null,
                        price double not null,
                        available boolean not null
                    );

                    //create more table here
                
                ''');
      //table students will be created if there is no table 'students'
      print("Table Created");
    });
  }

  Future<Map<dynamic, dynamic>?> getStudent(int codigo) async {
    List<Map> maps =
        await db!.query('productos', where: 'codigo = ?', whereArgs: [codigo]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}
