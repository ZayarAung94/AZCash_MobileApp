import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/components/loading.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/dialogs/payment_manage.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final database = AppDatabase();

  String getStatus(Payment p) {
    DateTime now = DateTime.now();
    if (now.month == p.created.month) {
      return "Ongoing...";
    } else {
      if (p.realPayout > 0) {
        return "Payout";
      } else {
        return "Processing...";
      }
    }
  }

  Color getPaymentColor(String s) {
    if (s == "Ongoing...") {
      return Colors.green;
    } else if (s == "Processing...") {
      return Colors.red;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: database.select(database.payments).get(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            var payments = snap.data;
            return ListView.builder(
              itemCount: payments!.length,
              itemBuilder: (context, index) {
                index = payments.length - (index + 1);
                Payment payment = payments[index];
                String title = getStatus(payment);

                String depositPer = "${payment.depositPer} %";
                String withdrawPer = "${payment.withdrawPer} %";
                String commissionD = NumberFormat("#,##0")
                    .format(payment.deposit * payment.depositPer / 100);
                String commissionW = NumberFormat("#,##0")
                    .format(payment.withdraw * payment.withdrawPer / 100);
                String payout = NumberFormat("#,##0").format(
                    (payment.deposit * payment.depositPer / 100) +
                        (payment.withdraw * payment.withdrawPer / 100));
                String realPayout =
                    NumberFormat("#,##0").format(payment.realPayout);
                String overallCommission =
                    "${NumberFormat("#,##0.0").format((payment.realPayout / (payment.deposit + payment.withdraw)) * 100)} %";

                if (title != "Payout") {
                  depositPer = "${AppData.depoCommission * 100} %";
                  withdrawPer = "${AppData.wdCommission * 100} %";
                  commissionD = NumberFormat("#,##0")
                      .format(payment.deposit * AppData.depoCommission);
                  commissionW = NumberFormat("#,##0")
                      .format(payment.withdraw * AppData.wdCommission);
                  payout = NumberFormat("#,##0").format(
                      (payment.deposit * AppData.depoCommission) +
                          (payment.withdraw * AppData.wdCommission));
                }
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat("dd/MM/yyy (EEEE)")
                                      .format(payment.created),
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: getPaymentColor(title),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () async {
                                if (payment.created.month !=
                                    DateTime.now().month) {
                                  if (payment.realPayout == 0) {
                                    await Get.dialog(
                                      Dialog(
                                        backgroundColor: AppColors.background,
                                        child: PaymentManage(payment: payment),
                                      ),
                                    );

                                    setState(() {});
                                  } else {
                                    AppMessage.error(
                                        "This Payment is already payout. You can't edit it!!!");
                                  }
                                } else {
                                  AppMessage.error(
                                      "This payemnt is Ongoing. You can't Payout right now.");
                                }
                              },
                              icon: const Icon(
                                Icons.settings_outlined,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: AppColors.softBg,
                        child: Column(
                          children: [
                            reportDataRow(
                              label1: 'Deposit :',
                              label2: 'Withdraw :',
                              value1:
                                  NumberFormat("#,###").format(payment.deposit),
                              value2: NumberFormat("#,###")
                                  .format(payment.withdraw),
                            ),
                            reportDataRow(
                              label1: 'Deposit (%) :',
                              label2: 'Withdraw (%) :',
                              value1: depositPer,
                              value2: withdrawPer,
                            ),
                            reportDataRow(
                              label1: 'Commission (D) :',
                              label2: 'Commission (W) :',
                              value1: commissionD,
                              value2: commissionW,
                            ),
                            reportDataRow(
                              label1: 'Credit :',
                              label2: 'Credit Carryover :',
                              value1: '0',
                              value2: '0',
                            ),
                            reportDataRow(
                              label1: 'Payout (K) :',
                              label2: 'Real Payout :',
                              value1: payout,
                              value2: realPayout,
                            ),
                            reportDataRow(
                              label1: 'Overall Comm.. (%) :',
                              label2: '',
                              value1: overallCommission,
                              value2: '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Loading();
          }
        });
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
        horizontal: 8,
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
            ),
          ),
        ],
      ),
    );
  }
}
