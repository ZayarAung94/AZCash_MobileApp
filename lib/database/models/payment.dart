import 'package:drift/drift.dart';

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
