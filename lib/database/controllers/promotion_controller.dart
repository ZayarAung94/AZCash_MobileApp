import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../../ui/constant.dart';

class PromotionController {
  final db = AppDatabase();
  final userController = UsersController();
  final paymentController = PaymentController();

  Future addPromoDepo({
    required String userId,
    required int amount,
    required int promoAmount,
  }) async {
    //Add Order
    await db
        .into(db.orders)
        .insert(
          OrdersCompanion.insert(
            userId: userId,
            amount: amount,
            code: '',
            type: "deposit",
            status: 'done',
            promotion: Value(promoAmount),
            agentCode: "",
            created: DateTime.now(),
          ),
        )
        .then((order) async {
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

      await userController.updateCredit(
        type: "add",
        amount: promoAmount,
        userId: userId,
      );

      await paymentController.depoAdd(amount);
    });
  }

  Future getPromoOrder() async {}
}
