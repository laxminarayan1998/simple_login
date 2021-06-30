import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../Model/User.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static const databaseName = 'users_database.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database!;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, password TEXT, email TEXT, phoneNo TEXT, profession TEXT)");
      print('Table is created');
    });
  }

  Future<int> saveUser(User user) async {
    var dbClient = await database;
    int res = await dbClient.insert("users", user.toJson());

    return res;
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromJson(maps[i]);
    });
  }
}
