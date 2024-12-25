import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/components/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../helper/widget_helper.dart';

class ReportByTransactions extends StatefulWidget {
  const ReportByTransactions({super.key});

  @override
  State<ReportByTransactions> createState() => _ReportByTransactionsState();
}

class _ReportByTransactionsState extends State<ReportByTransactions> {
  String selectedItem = "Today";
  List<String> dropDownOptions = [
    'Exact Peroid',
    'Today',
    'Yesterday',
    'Current Month',
    'Last Month',
  ];

  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  int totalDepo = 0;
  int totalWd = 0;

  @override
  Widget build(BuildContext context) {
    DateTimeRange dateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );

    if (selectedItem == "Yesterday") {
      dateRange = DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 1)),
        end: DateTime.now().subtract(const Duration(days: 1)),
      );
    } else if (selectedItem == "Current Month") {
      dateRange = DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month, 1),
        end: DateTime.now(),
      );
    } else if (selectedItem == "Last Month") {
      dateRange = DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month - 1, 1),
        end: DateTime(DateTime.now().year, DateTime.now().month, 1).subtract(const Duration(days: 1)),
      );
    } else if (selectedItem == "Exact Peroid") {
      dateRange = selectedDateRange;
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
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: const OutlineInputBorder(),
                  hintText:
                      '${DateFormat("dd/MM/yyyy").format(dateRange.start)} - ${DateFormat("dd/MM/yyyy").format(dateRange.end)}',
                ),
                onTap: () async {
                  DateTimeRange? newSelected = await showDateRangePicker(
                    context: context,
                    initialDateRange: dateRange,
                    firstDate: DateTime(2024),
                    lastDate: DateTime.now(),
                  );

                  if (newSelected != null) {
                    setState(() {
                      selectedItem = "Exact Peroid";
                      selectedDateRange = newSelected;
                    });
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Column(
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   width: double.infinity,
              //   decoration: const BoxDecoration(
              //     color: AppColors.softBg,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         '${DateFormat("dd/MM/yyyy").format(dateRange.start)} - ${DateFormat("dd/MM/yyyy").format(dateRange.end)}',
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             NumberFormat('#,##0').format(totalDepo),
              //             style: const TextStyle(
              //               color: Colors.green,
              //             ),
              //           ),
              //           const Text(" / "),
              //           Text(
              //             NumberFormat('#,##0').format(totalWd),
              //             style: const TextStyle(
              //               color: Colors.red,
              //             ),
              //           ),
              //           const SizedBox(width: 20),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: FutureBuilder(
                    future: TransactionController().getByDateRange(dateRange),
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.done) {
                        List<Transaction?> orders = snap.data ?? [];
                        if (orders.isEmpty) {
                          return AppWidget.noData();
                        }
                        return ListView.builder(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              Transaction? order = orders[index];
                              if (order == null) {
                                return const SizedBox();
                              } else {
                                return OrderWidget(order: order);
                              }
                            });
                      } else {
                        return AppWidget.loading();
                      }
                    }),
              ),
            ],
          ),
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
