import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database?> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, "todo_database.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db,int version) async {
        await db.execute(
          'CREATE TABLE todos (id INTEGER PRIMARY KEY,title TEXT, description TEXT)'
        );
      }
    );
  }

}









