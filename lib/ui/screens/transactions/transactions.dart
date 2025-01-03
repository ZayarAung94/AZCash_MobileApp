import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/components/order_widget.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/transactions/components/delete_order.dart';
import 'package:flutter/material.dart';

class TranasctionsScreen extends StatelessWidget {
  const TranasctionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: TransactionController().getOfToday(),
        builder: (context, snap) {
          if (snap.hasData) {
            List<Transaction?> orders = snap.data ?? [];
            if (orders.isEmpty) {
              return AppWidget.noData();
            }
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Transaction? order = orders[index];
                if (order == null) return const SizedBox();

                return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onLongPress: () async {
                      if (AppData.user!.role == "Master") {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return const DeleteOrder();
                          },
                        );
                      }
                    },
                    child: OrderWidget(order: order));
              },
            );
          } else if (snap.hasError) {
            return AppWidget.noData();
          } else {
            return AppWidget.loading();
          }
        });
  }
}
