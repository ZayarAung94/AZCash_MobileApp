import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class CreditHistory extends StatelessWidget {
  const CreditHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // final orderController = OrderController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: const Text("Name's Credits"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // Order order = data[index];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'deposit' == "deposit" ? "Credit" : "Credit Payback",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "(11111)",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Order Trans (K) : 100000",
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
                              NumberFormat('#,##0').format(100000),
                              style: const TextStyle(
                                color: 1 > 0 ? Colors.red : Colors.green,
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
      ),
    );
  }
}
