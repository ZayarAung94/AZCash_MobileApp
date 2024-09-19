import 'package:az_cash/database/database.dart';
import 'package:drift/drift.dart';

class UsersController {
  final db = AppDatabase();

  Future getUser(String userId) async {
    return await (db.select(db.users)..where((u) => u.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future addUser(String userId) async {
    User? data = await (db.select(db.users)
          ..where((u) => u.userId.equals(userId)))
        .getSingleOrNull();

    if (data == null) {
      await db.into(db.users).insert(
            UsersCompanion.insert(userId: userId),
          );
    } else {
      db.update(db.users)
        ..where((u) => u.id.equals(data.id))
        ..write(
          UsersCompanion(
            lastTransition: Value(DateTime.now()),
          ),
        );
    }
  }

  Future updateUserProfile({
    required int id,
    required String name,
    required String phone,
    required bool isPartner,
  }) async {
    db.update(db.users)
      ..where((u) => u.id.equals(id))
      ..write(
        UsersCompanion(
          userName: Value(name),
          phone: Value(phone),
          isPartner: Value(isPartner),
        ),
      );
  }

  Future updateCredit({
    required String type,
    required int amount,
    required User user,
  }) async {
    int newCrd = user.totalCredit;
    if (type == "add") {
      newCrd = amount + user.totalCredit;
    } else {
      newCrd = user.totalCredit - amount;
    }

    db.update(db.users)
      ..where((u) => u.id.equals(user.id))
      ..write(UsersCompanion(
        totalCredit: Value(newCrd),
        lastCreditDate: Value(DateTime.now()),
      ));
  }

  Future updatePromotion() async {}

  Future updateContacts({
    required User user,
    String? facebook,
    String? viber,
    String? telegram,
  }) async {
    db.update(db.users)
      ..where((u) => u.id.equals(user.id))
      ..write(
        const UsersCompanion(
          facebook: Value(""),
          viber: Value(""),
          telegram: Value(""),
        ),
      );
  }

  Future getAll() async {
    var data = db.select(db.users).get();
    return data;
  }

  Future warningUser() async {}

  Future blockUser() async {}

  Future reportToServer() async {}
}
