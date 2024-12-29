import 'package:az_cash/database/controllers/client_controller.dart';
import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/database/models/userreport.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TransactionController {
  final _db = Supabase.instance.client.from('orders');
  final _clientController = ClientController();

  Future addTransaction(Transaction order) async {
    ClientModel? client = await _clientController.getClientWithId(order.clientId);

    if (client != null) {
      order.clientName = client.name;
      order.agent = client.agent;

      int paymentId = await PaymentController().checkAndAddPayment(order);
      order.paymentId = paymentId;
      try {
        await _db.insert(order.toJson());
      } on PostgrestException catch (e) {
        AppMessage.error(e.message);
      }
    } else {
      AppMessage.error("This user don't exist in your database. Please add first!");
    }
  }

  Stream<List<Transaction?>> getOfToday() {
    DateTime now = DateTime.now();
    String today = DateTime(now.year, now.month, now.day).toIso8601String();

    if (AppData.user!.role == "Master") {
      final result = _db.stream(primaryKey: ['id']).gte('created_at', today).order("created_at").map((value) {
            return value.map((e) {
              return Transaction.fromJson(e);
            }).toList();
          });

      return result;
    } else {
      final result = _db.stream(primaryKey: ['id']).gte('created_at', today).order("created_at").map((value) {
            return value.map((e) {
              if (e['agent'] == AppData.user?.id) return Transaction.fromJson(e);
            }).toList();
          });

      return result;
    }
  }

  Future<List<Transaction>> getByLimit(int limit) async {
    final result = await _db.select().limit(limit).order('created_at');

    List<Transaction> value = result.map((json) {
      return Transaction.fromJson(json);
    }).toList();

    return value;
  }

  Future<List<Transaction?>> getByDateRange(DateTimeRange dateRange) async {
    DateTime startDate = DateTime(dateRange.start.year, dateRange.start.month, dateRange.start.day, 0, 0);
    DateTime endDate = DateTime(dateRange.end.year, dateRange.end.month, dateRange.end.day, 23, 59);

    final startIso = startDate.toIso8601String();
    final endIso = endDate.toIso8601String();
    final result = await _db.select().gte("created_at", startIso).lte("created_at", endIso).order("created_at");

    if (AppData.user!.role == "Master") {
      List<Transaction> value = result.map((json) {
        return Transaction.fromJson(json);
      }).toList();

      return value;
    } else {
      final value = result.map((json) {
        if (json['agent'] == AppData.user?.id) return Transaction.fromJson(json);
      }).toList();

      return value;
    }
  }

  Future<List<UserReport>> getClientReportsByDateRange(DateTimeRange dateRange) async {
    final clients = await _clientController.getClients();

    DateTime startDate = DateTime(dateRange.start.year, dateRange.start.month, dateRange.start.day, 0, 0);
    DateTime endDate = DateTime(dateRange.end.year, dateRange.end.month, dateRange.end.day, 23, 59);

    final startIso = startDate.toIso8601String();
    final endIso = endDate.toIso8601String();

    List<UserReport> userReports = [];

    if (clients != null) {
      for (var client in clients) {
        UserReport report = UserReport(
          userId: client.id,
          userName: client.name,
          totalDepo: 0,
          totalWd: 0,
          deopTimes: 0,
          wdTimes: 0,
          credit: client.credit,
          creditCarryover: 0,
        );

        final orderJsons =
            await _db.select().eq('client_id', client.id).gte("created_at", startIso).lte("created_at", endIso);

        // Loop all Order and update report
        for (var json in orderJsons) {
          Transaction order = Transaction.fromJson(json);
          if (order.type == "Deposit") {
            report.deopTimes++;
            report.totalDepo = report.totalDepo + order.amount.toInt();
          } else {
            report.wdTimes++;
            report.totalWd = report.totalWd + order.amount.toInt();
          }
        }

        if (report.totalDepo > 0 || report.totalWd > 0) userReports.add(report);
      }
    }

    return userReports;
  }

  Future<List<Transaction>> getPromotionOrder(int? limit) async {
    final result = await _db.select().gt('promotion_amount', 0).order('created_at').limit(limit ?? 20);

    return result.map((json) {
      return Transaction.fromJson(json);
    }).toList();
  }

  Future<List<Transaction>> getCreditOrdersByClientId(String id) async {
    final result = await _db.select().eq('client_id', id).neq('credit_amount', 0).order('created_at').limit(20);

    return result.map((json) {
      return Transaction.fromJson(json);
    }).toList();
  }

  //
}
