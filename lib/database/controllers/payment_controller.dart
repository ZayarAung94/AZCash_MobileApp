import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:drift/drift.dart';

class PaymentController {
  final database = AppDatabase();
  DateTime now = DateTime.now();

  Future _addPayment() async {
    database.into(database.payments).insert(
          PaymentsCompanion.insert(
            deposit: AppData.totalDepo,
            withdraw: AppData.totalWd,
            depositPer: 0,
            withdrawPer: 0,
            created: Value(now),
          ),
        );
  }

  Future payout({required int id, required int realPayout}) async {
    int depoPer = (AppData.depoCommission * 100).toInt();
    int wdPer = (AppData.wdCommission * 100).toInt();
    database.update(database.payments)
      ..where((p) => p.id.equals(id))
      ..write(PaymentsCompanion(
        depositPer: Value(depoPer),
        withdrawPer: Value(wdPer),
        realPayout: Value(realPayout),
      ));
  }

  Future appStartCheck() async {
    var result = await database.getPaymentOfMonth(now);

    if (result.isEmpty) {
      _addPayment();
    } else {
      Payment payment = result[0];

      database.ongoingPayemntUpdate(payment.id);
    }
  }

  Future depoAdd(int amount) async {
    var result = await database.getPaymentOfMonth(now);

    if (result.isEmpty) {
      _addPayment();
    } else {
      Payment payment = result[0];
      int newDepo = payment.deposit + amount;

      database.update(database.payments)
        ..where((p) => p.id.equals(payment.id))
        ..write(
          PaymentsCompanion(
            deposit: Value(newDepo),
          ),
        );
    }
  }

  Future wdAdd(int amount) async {
    var result = await database.getPaymentOfMonth(now);

    if (result.isEmpty) {
      _addPayment();
    } else {
      Payment payment = result[0];
      int newWd = payment.withdraw + amount;

      database.update(database.payments)
        ..where((p) => p.id.equals(payment.id))
        ..write(
          PaymentsCompanion(
            withdraw: Value(newWd),
          ),
        );
    }
  }
}
