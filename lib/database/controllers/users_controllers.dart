import 'package:az_cash/database/database.dart';

class UsersController {
  final db = AppDatabase();

  Future addUser(String userId) async {
    User? data = await (db.select(db.users)
          ..where((u) => u.userId.equals(userId)))
        .getSingleOrNull();

    if (data == null) {
      await db.into(db.users).insert(
            UsersCompanion.insert(userId: userId),
          );
    }
  }

  Future getAll() async {
    var data = db.select(db.users).get();
    return data;
  }
}
