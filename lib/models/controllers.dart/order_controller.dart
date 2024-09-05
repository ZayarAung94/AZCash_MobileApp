import 'package:az_cash/database/database.dart';

class OrderController {
  final database = AppDatabase();

  Future drop(int id) async {
    database.delete(database.orders)
      ..where((o) => o.id.equals(id))
      ..go();
  }
}
