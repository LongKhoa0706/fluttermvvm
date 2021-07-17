import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? database;

  Future createDatabase() async {
    if (database == null) {
      String path = join(await getDatabasesPath(),'user.db');
      database = await openDatabase(path,version: 1,onCreate: onCreateDb);
    }
  }

  Future<void> onCreateDb(Database database,int version) async {
    await database.execute("CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT ) ");
  }

  //singleton
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();
}