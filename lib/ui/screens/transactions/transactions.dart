import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/transactions/components/delete_order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranasctionsScreen extends StatefulWidget {
  const TranasctionsScreen({super.key});

  @override
  State<TranasctionsScreen> createState() => _TranasctionsScreenState();
}

class _TranasctionsScreenState extends State<TranasctionsScreen> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int totalDepo = 0;
    int totalWd = 0;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onLongPress: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const DeleteOrder();
                      },
                    );

                    setState(() {});
                  },
                  child: Column(
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
                                    const Row(
                                      children: [
                                        Text(
                                          "user.userName",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "({order.userId})",
                                          style: TextStyle(
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
                                          "Crd : {order.credit}, ",
                                          style: TextStyle(
                                            color: 1 < 0 ? Colors.red.shade100 : Colors.green.shade100,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      NumberFormat('#,##0').format(10000),
                                      style: const TextStyle(
                                        color: "order.type" == "withdraw" ? Colors.red : Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      DateFormat("hh:mm a").format(DateTime.now()),
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
  }
}
