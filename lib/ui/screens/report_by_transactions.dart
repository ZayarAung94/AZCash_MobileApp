import 'package:az_cash/database/controllers/order_controller.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';

class ReportByTransactions extends StatefulWidget {
  const ReportByTransactions({super.key});

  @override
  State<ReportByTransactions> createState() => _ReportByTransactionsState();
}

class _ReportByTransactionsState extends State<ReportByTransactions> {
  DateTime selectedDate = DateTime.now();
  String selectedItem = "Today";
  List<String> dropDownOptions = [
    'Custom',
    'Today',
    'Yesterday',
  ];

  final database = AppDatabase();

  int totalDepo = 0;
  int totalWd = 0;

  @override
  Widget build(BuildContext context) {
    if (selectedItem == "Yesterday") {
      selectedDate = DateTime.now().subtract(const Duration(days: 1));
    } else if (selectedItem == "Today") {
      selectedDate = DateTime.now();
    }

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.softBg),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: AppColors.softBg,
                    alignment: AlignmentDirectional.bottomStart,
                    value: selectedItem,
                    onChanged: (newValue) {
                      setState(() {
                        selectedItem = newValue ?? "Today";
                        totalDepo = 0;
                        totalWd = 0;
                      });
                    },
                    items: dropDownOptions.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: const OutlineInputBorder(),
                      hintText:
                          DateFormat("dd/MM/yyyy (EEEE)").format(selectedDate),
                    ),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2023),
                        lastDate: DateTime.now(),
                      );

                      if (newDate != null) {
                        setState(() {
                          selectedItem = "Custom";
                          selectedDate = newDate;
                          totalDepo = 0;
                          totalWd = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: FutureBuilder(
              future: database.getOrderWithUserByRange(
                  DateTime(selectedDate.year, selectedDate.month,
                      selectedDate.day, 0, 0, 0),
                  DateTime(selectedDate.year, selectedDate.month,
                      selectedDate.day, 23, 59, 59)),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.softBg,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat.yMMMMEEEEd().format(selectedDate),
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
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    if (order.code != "")
                                                      Text(
                                                        "WD Code : ${order.code}, ",
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
                                                    color:
                                                        order.type == "withdraw"
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
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return const Loading();
                }
              }),
        )
      ],
    );
  }

  Container reportDataRow({
    required String label1,
    required String label2,
    required String value1,
    required String value2,
    Color? value1Color,
    Color? value2Color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        children: [
          reportData(
            label: label1,
            value: value1,
            valueColor: value1Color,
          ),
          const SizedBox(width: 25),
          reportData(
            label: label2,
            value: value2,
            valueColor: value2Color,
          ),
        ],
      ),
    );
  }

  Widget reportData({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
