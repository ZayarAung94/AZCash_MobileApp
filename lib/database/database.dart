import 'package:az_cash/database/controllers/order_controller.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  IntColumn get amount => integer()();
  TextColumn get type => text()();
  TextColumn get code => text()();
  TextColumn get status => text()();
  IntColumn get credit => integer().withDefault(const Constant(0))();
  IntColumn get promotion => integer().withDefault(const Constant(0))();
  TextColumn get agentCode => text()();
  DateTimeColumn get created => dateTime()();
}

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deposit => integer()();
  IntColumn get withdraw => integer()();
  IntColumn get depositPer => integer()();
  IntColumn get withdrawPer => integer()();
  IntColumn get commissionD => integer().withDefault(const Constant(0))();
  IntColumn get commissionW => integer().withDefault(const Constant(0))();
  IntColumn get credit => integer().withDefault(const Constant(0))();
  IntColumn get creditCarryover => integer().withDefault(const Constant(0))();
  IntColumn get payout => integer().withDefault(const Constant(0))();
  IntColumn get realPayout => integer().withDefault(const Constant(0))();
  IntColumn get overallCommission => integer().withDefault(const Constant(0))();
  DateTimeColumn get created =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get userName =>
      text().withDefault(const Constant('Unidentified'))();
  TextColumn get phone => text().withDefault(const Constant(""))();
  TextColumn get status => text().withDefault(const Constant('Normal'))();
  BoolColumn get isPartner => boolean().withDefault(const Constant(false))();
  DateTimeColumn get joinedDate =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get lastTransition =>
      dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get totalCredit => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastCreditDate => dateTime().nullable()();

  TextColumn get facebook => text().nullable()();
  TextColumn get viber => text().nullable()();
  TextColumn get telegram => text().nullable()();
}

@DriftDatabase(tables: [Orders, Payments, Users])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'my_database');
  }

  Future<List<Order>> getOrderByRange(DateTime start, DateTime end) async {
    return await (select(orders)
          ..where((o) => o.created.isBetweenValues(start, end))
          ..orderBy([
            (o) => OrderingTerm(expression: o.created, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<List<OrderWithUser>> getOrderWithUserByRange(
      DateTime start, DateTime end) async {
    final query = select(orders)
        .join([innerJoin(users, users.userId.isExp(orders.userId))])
      ..where(orders.created.isBetweenValues(start, end))
      ..orderBy([
        OrderingTerm(expression: orders.created, mode: OrderingMode.desc),
      ]);

    return query.map((row) {
      return OrderWithUser(
        order: row.readTable(orders),
        user: row.readTable(users),
      );
    }).get();
  }

  Future<List<Payment>> getPaymentOfMonth(DateTime date) async {
    DateTime start = DateTime(date.year, date.month, 1);
    DateTime end = DateTime(date.year, date.month + 1, 1, 23, 59, 59)
        .subtract(const Duration(days: 1));

    return await (select(payments)
          ..where((p) => p.created.isBetweenValues(start, end)))
        .get();
  }

  Future ongoingPayemntUpdate(int id) async {
    return await (update(payments)..where((p) => p.id.equals(id))).write(
      PaymentsCompanion(
        deposit: Value(AppData.totalDepo),
        withdraw: Value(AppData.totalWd),
      ),
    );
  }

  Future clearAllData() async {
    await delete(orders).go();
    await delete(payments).go();
    await delete(users).go();
    AppData.totalDepo = 0;
    AppData.totalWd = 0;
  }
}
