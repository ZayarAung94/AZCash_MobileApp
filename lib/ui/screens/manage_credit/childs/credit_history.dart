import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constant.dart';

class CreditHistory extends StatelessWidget {
  final ClientModel client;
  const CreditHistory({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    // final orderController = OrderController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("${client.name}'s Credits"),
      ),
      body: FutureBuilder(
        future: TransactionController().getCreditOrdersByClientId(client.id),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            List<Transaction> orders = snap.data ?? [];
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Transaction order = orders[index];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        order.type == "Deposit" ? "Credit" : "Credit Payback",
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "(${order.clientId})",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Order Trans (K) : ${order.amount}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    NumberFormat('#,##0').format(order.creditAmount),
                                    style: TextStyle(
                                      color: order.creditAmount > 0 ? Colors.red : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    DateFormat("dd/MM/yy hh:mm a").format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColors.softBg,
                    )
                  ],
                );
              },
            );
          } else {
            return AppWidget.loading();
          }
        },
      ),
    );
  }
}
