import 'package:az_cash/database/database.dart';
import 'package:drift/drift.dart';

class UsersController {
  final db = AppDatabase();

  Future getUser(String userId) async {
    return await (db.select(db.users)..where((u) => u.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future getAll() async {
    var data = db.select(db.users).get();
    return data;
  }

  Future getCreditUser() async {
    return await (db.select(db.users)
          ..where(
            (u) => u.totalCredit.isBiggerThanValue(0),
          )
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.totalCredit, mode: OrderingMode.desc)
          ]))
        .get();
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
    required String userId,
  }) async {
    User user = await getUser(userId);

    int newCrd = user.totalCredit;
    if (type == "add") {
      newCrd = amount + user.totalCredit;
    } else {
      newCrd = user.totalCredit - amount;
    }

    db.update(db.users)
      ..where((u) => u.id.equals(user.id))
      ..write(
        UsersCompanion(
          totalCredit: Value(newCrd),
          lastCreditDate: Value(DateTime.now()),
        ),
      );
  }

  Future updatePromotion({
    required String userId,
    required int promoAmount,
  }) async {
    User user = await getUser(userId);
  }

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

  Future warningUser() async {}

  Future blockUser() async {}

  Future reportToServer() async {}
}
