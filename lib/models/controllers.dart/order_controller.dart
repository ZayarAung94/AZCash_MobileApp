import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/payment_controller.dart';
import 'package:flutter/services.dart';

import '../../ui/constant.dart';

class OrderController {
  final database = AppDatabase();
  final paymentController = PaymentController();

  Future drop(int id) async {
    database.delete(database.orders)
      ..where((o) => o.id.equals(id))
      ..go();
  }

  Future addDeposit({required String userId, required int amount}) async {
    //Add Order
    await database
        .into(database.orders)
        .insert(OrdersCompanion.insert(
          userId: userId,
          amount: amount,
          code: '',
          type: "deposit",
          status: 'done',
          agentCode: "",
          created: DateTime.now(),
        ))
        .then((_) async {
      if (DateTime.now().isAfter(AppData.activeSession)) {
        DateTime today = DateTime.now();
        AppData.totalDepo = amount;
        AppData.totalWd = 0;
        AppData.activeSession =
            DateTime(today.year, today.month + 1, 1, 23, 59, 59)
                .subtract(const Duration(days: 1));
      } else {
        AppData.totalDepo = AppData.totalDepo + amount;
      }

      Clipboard.setData(
        ClipboardData(
          text: "#Deposit \nId : $userId \nAmount : $amount \nP Name : ",
        ),
      );

      await paymentController.depoAdd(amount);
    });
  }

  Future addWithdraw(
      {required String userId,
      required int amount,
      required String code}) async {
    await database
        .into(database.orders)
        .insert(OrdersCompanion.insert(
          userId: userId,
          amount: amount,
          type: 'withdraw',
          code: code,
          status: 'done',
          agentCode: "",
          created: DateTime.now(),
        ))
        .then((_) async {
      if (DateTime.now().isAfter(AppData.activeSession)) {
        DateTime today = DateTime.now();
        AppData.totalWd = amount;
        AppData.totalDepo = 0;
        AppData.activeSession =
            DateTime(today.year, today.month + 1, 1, 23, 59, 59)
                .subtract(const Duration(days: 1));
      } else {
        AppData.totalWd = AppData.totalWd + amount;
      }

      await paymentController.wdAdd(amount);
    });

    Clipboard.setData(
      ClipboardData(
        text: "#Withdraw \nId : $userId \nAmount : $amount \nCode : $code",
      ),
    );
  }
}
