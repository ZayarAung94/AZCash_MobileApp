import 'package:az_cash/database/controllers/order_controller.dart';
import 'package:az_cash/database/database.dart';
import 'package:drift/drift.dart';

class PromotionController extends AppDatabase {
  final orderController = OrderController();
  Future addPromoDepo({
    required String userId,
    required int amount,
    required int promoAmount,
  }) async {
    await orderController.addDeposit(
      userId: userId,
      amount: amount,
      promotion: promoAmount,
    );

    //Update to Users Table
    User? user = await (select(users)
          ..where(
            (u) => u.userId.equals(userId),
          ))
        .getSingleOrNull();

    if (user != null) {
      int newPromoAmount = user.totalPromotion + promoAmount;
      update(users)
        ..where((u) => u.userId.equals(userId))
        ..write(
          UsersCompanion(
            totalPromotion: Value(newPromoAmount),
          ),
        );
    }
  }

  Future<List<OrderWithUser>> getPromoOrders(
      DateTime start, DateTime end) async {
    final query = select(orders)
        .join([innerJoin(users, users.userId.isExp(orders.userId))])
      ..where(orders.promotion.isBiggerThanValue(0) &
          orders.created.isBetweenValues(start, end))
      ..orderBy(
          [OrderingTerm(expression: orders.created, mode: OrderingMode.desc)])
      ..limit(30);

    return query.map((row) {
      return OrderWithUser(
        order: row.readTable(orders),
        user: row.readTable(users),
      );
    }).get();
  }
}
