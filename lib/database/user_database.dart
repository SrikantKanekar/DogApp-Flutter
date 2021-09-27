import 'package:dog_app/model/user.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class UserDatabase {
  static Future<Database> _database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath!, 'users.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_table (email TEXT PRIMARY KEY, username TEXT, password TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(User user) async {
    final db = await UserDatabase._database();
    db.insert(
      'user_table',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<User?> getUser(String email) async {
    final db = await UserDatabase._database();
    try {
      final json =
          await db.rawQuery('SELECT * FROM user_table WHERE email="$email"');
      return User.fromMap(json.first);
    } catch (e) {
      return null;
    }
  }

  static Future<void> deleteUser(String email) async {
    final db = await UserDatabase._database();
    final json =
        await db.delete('user_table', where: 'email = ?', whereArgs: [email]);
  }
}
