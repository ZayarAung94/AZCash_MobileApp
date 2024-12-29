import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.softBg,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last promotions on your orders",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: FutureBuilder(
                  future: TransactionController().getPromotionOrder(20),
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
                                                  order.clientName,
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
                                              NumberFormat('#,##0').format(order.promotionAmount),
                                              style: const TextStyle(
                                                color: 1 > 0 ? Colors.red : Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              DateFormat("dd/MM/yy hh:mm a").format(order.createdAt),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
