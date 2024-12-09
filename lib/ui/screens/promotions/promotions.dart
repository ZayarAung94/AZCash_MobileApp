import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
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
                      "Total : ${DateFormat("dd/MM/yyyy").format(dateRange.start)} - ${DateFormat("dd/MM/yyyy").format(dateRange.end)}",
                    ),
                    Text(
                      NumberFormat('#,##0').format(2000),
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
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
                                      SizedBox(height: 8),
                                      Text(
                                        "Order Trans (K) : {order.amount}",
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
                                        NumberFormat('#,##0').format(10000),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
