import 'package:az_cash/database/controllers/order_controller.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/components/delete_order.dart';
import 'package:az_cash/ui/components/loading.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranasctionsScreen extends StatefulWidget {
  const TranasctionsScreen({super.key});

  @override
  State<TranasctionsScreen> createState() => _TranasctionsScreenState();
}

class _TranasctionsScreenState extends State<TranasctionsScreen> {
  final database = AppDatabase();
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime(today.year, today.month, today.day, 0, 0, 0);
    DateTime end = DateTime(today.year, today.month, today.day, 24, 59, 59);
    int totalDepo = 0;
    int totalWd = 0;

    return FutureBuilder(
        future: database.getOrderWithUserByRange(start, end),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            List<OrderWithUser>? orders = snap.data;
            if (orders != null) {
              for (var order in orders) {
                if (order.order.type == 'deposit') {
                  totalDepo = totalDepo + order.order.amount;
                } else {
                  totalWd = totalWd + order.order.amount;
                }
              }
            }

            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.softBg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.yMMMMEEEEd().format(today),
                      ),
                      Row(
                        children: [
                          Text(
                            NumberFormat('#,##0').format(totalDepo),
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          const Text(" / "),
                          Text(
                            NumberFormat('#,##0').format(totalWd),
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: orders == null ? 0 : orders.length,
                      itemBuilder: (context, index) {
                        Order order = orders![index].order;
                        User user = orders[index].user;
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onLongPress: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return DeleteOrder(order: order);
                              },
                            );

                            setState(() {});
                          },
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  user.userName,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "(${order.userId})",
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Text(
                                                  "Crd : ${order.credit}, ",
                                                  style: TextStyle(
                                                    color: order.credit < 0
                                                        ? Colors.red.shade100
                                                        : Colors.green.shade100,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                if (order.code != "")
                                                  Text(
                                                    "WD Code : ${order.code},",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat('#,##0')
                                                  .format(order.amount),
                                              style: TextStyle(
                                                color: order.type == "withdraw"
                                                    ? Colors.red
                                                    : Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              DateFormat("hh:mm a")
                                                  .format(order.created),
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
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Loading();
          }
        });
  }
}
