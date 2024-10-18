import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../../ui/constant.dart';

class OrderController {
  final database = AppDatabase();
  final paymentController = PaymentController();
  final userController = UsersController();

  Future drop(int id) async {
    database.delete(database.orders)
      ..where((o) => o.id.equals(id))
      ..go();
  }

  Future getCreditOrderOfUser(String userId) async {
    return await (database.select(database.orders)
          ..where(
            (o) => o.userId.equals(userId) & o.credit.isNotValue(0),
          )
          ..orderBy([
            (o) => OrderingTerm(expression: o.credit, mode: OrderingMode.desc)
          ])
          ..limit(15))
        .get();
  }

  Future<List<OrderWithUser>> getOrderWithUser() async {
    final query = database.select(database.orders).join([
      innerJoin(
        database.users,
        database.users.userId.isExp(database.orders.userId),
      )
    ]);

    return query.map((row) {
      return OrderWithUser(
        order: row.readTable(database.orders),
        user: row.readTable(database.users),
      );
    }).get();
  }

  Future<int> addDeposit({
    required String userId,
    required int amount,
    int? credit,
    int? promotion,
  }) async {
    //Add Order
    return await database
        .into(database.orders)
        .insert(OrdersCompanion.insert(
          userId: userId,
          amount: amount,
          code: '',
          type: "deposit",
          status: 'done',
          agentCode: "",
          credit: Value(credit ?? 0),
          promotion: Value(promotion ?? 0),
          created: DateTime.now(),
        ))
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

      await paymentController.depoAdd(amount);

      return order;
    });
  }

  Future addWithdraw({
    required String userId,
    required int amount,
    required String code,
    int? credit,
  }) async {
    await database
        .into(database.orders)
        .insert(OrdersCompanion.insert(
          userId: userId,
          amount: amount,
          type: 'withdraw',
          code: code,
          status: 'done',
          agentCode: "",
          credit: Value(credit ?? 0),
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

  Future addCreditDepo({
    required String userId,
    required int amount,
    required int crdAmount,
  }) async {
    await addDeposit(
      userId: userId,
      amount: amount,
      credit: crdAmount,
    );

    await userController.updateCredit(
      amount: crdAmount,
      userId: userId,
    );

    await paymentController.depoAdd(amount);
  }

  Future addCreditWd({
    required String userId,
    required int amount,
    required int crdAmount,
    required String code,
  }) async {
    crdAmount = crdAmount * -1;
    await addWithdraw(
      userId: userId,
      amount: amount,
      credit: crdAmount,
      code: code,
    );

    await userController.updateCredit(
      amount: crdAmount,
      userId: userId,
    );

    await paymentController.wdAdd(amount);
  }
}

class OrderWithUser {
  final Order order;
  final User user;

  OrderWithUser({required this.order, required this.user});
}
