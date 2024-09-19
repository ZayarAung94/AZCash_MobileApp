import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/order_controller.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class CreditHistory extends StatelessWidget {
  final User user;
  const CreditHistory({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("${user.userName}'s Credits"),
      ),
      body: FutureBuilder(
          future: orderController.getCreditOrderOfUser(user.userId),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              List<Order> data = snap.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Order order = data[index];
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
                                          order.userId,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "(${order.type})",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Status",
                                      style: TextStyle(
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
                                      NumberFormat('#,##0')
                                          .format(order.credit),
                                      style: TextStyle(
                                        color: order.credit > 0
                                            ? Colors.red
                                            : Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      DateFormat("hh:mm a")
                                          .format(DateTime.now()),
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
          }),
    );
  }
}
