import 'package:az_cash/database/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';

class OrderWidget extends StatelessWidget {
  final Transaction order;
  const OrderWidget({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
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
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "${order.type}, ",
                                style: TextStyle(
                                  color: order.type == "Withdraw" ? Colors.red[300] : Colors.green[300],
                                  fontSize: 11,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Crd : ${order.creditAmount}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat('#,##0').format(order.amount),
                        style: TextStyle(
                          color: order.type == "Withdraw" ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DateFormat("hh:mm a").format(order.createdAt),
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
  }
}
