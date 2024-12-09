import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportByUserScreen extends StatefulWidget {
  const ReportByUserScreen({super.key});

  @override
  State<ReportByUserScreen> createState() => _ReportByUserScreenState();
}

class _ReportByUserScreenState extends State<ReportByUserScreen> {
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
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.softBg,
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("report.userName"),
                                SizedBox(width: 10),
                                Text(
                                  "({report.userId})",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Hello",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    reportDataRow(
                      label1: "Total Deposit :",
                      label2: "Total Withdraw :",
                      value1: NumberFormat("#,##0").format(1000),
                      value2: NumberFormat("#,##0").format(1000),
                      value1Color: Colors.green[200],
                      value2Color: Colors.red[200],
                    ),
                    reportDataRow(
                      label1: 'Commission (D) :',
                      label2: 'Commission (W) :',
                      value1: NumberFormat("#,##0").format(10),
                      value2: NumberFormat("#,##0").format(10),
                    ),
                    reportDataRow(
                      label1: 'Depo Times :',
                      label2: 'Wd Times :',
                      value1: "100",
                      value2: "200",
                    ),
                  ],
                ),
              );
            },
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
