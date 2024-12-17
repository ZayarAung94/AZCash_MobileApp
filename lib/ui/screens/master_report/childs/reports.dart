import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/models/payment.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/master_report/childs/agents_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class MasterModReports extends StatelessWidget {
  const MasterModReports({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: PaymentController().getActivePayments(),
        builder: (context, snap) {
          if (snap.hasData) {
            List<Payment> payments = snap.data as List<Payment>;
            return ListView.builder(
              itemCount: payments.length,
              itemBuilder: (context, index) {
                Payment payment = payments[index];
                double depoComms = 1.5;
                double wdComms = 0.5;

                if (payment.deposit > 3000000) {
                  depoComms = 2.5;
                  wdComms = 1;
                }
                if (payment.agentId == AppData.user!.id) {
                  return const SizedBox();
                }
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(payment.agentName),
                            Text("(${payment.agentPhone})"),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        AppWidget.twoDataRow(
                          label1: 'Deposit :',
                          label2: "Withdraw :",
                          value1: NumberFormat("#,##0").format(payment.deposit),
                          value2: NumberFormat("#,##0").format(payment.withdraw),
                        ),
                        AppWidget.twoDataRow(
                          label1: 'Depo Commis (%):',
                          label2: "Wd Commis (%):",
                          value1: "$depoComms %",
                          value2: "$wdComms %",
                        ),
                        AppWidget.twoDataRow(
                          label1: 'Depo Com (K) :',
                          label2: "Wd Com (K) :",
                          value1: NumberFormat("#,##0").format(payment.deposit * (depoComms / 100)),
                          value2: NumberFormat("#,##0").format(payment.withdraw * (wdComms / 100)),
                        ),
                        AppWidget.twoDataRow(
                          label1: 'Total :',
                          label2: "Real Payout",
                          value1: NumberFormat("#,##0")
                              .format((payment.deposit * (depoComms / 100)) + (payment.withdraw * (wdComms / 100))),
                          value2: '0',
                        ),
                        const SizedBox(height: 10),
                        AppBtn.expendedBtn(
                          color: AppColors.softBg,
                          label: "Views Orders",
                          onPressed: () {
                            Get.to(() => const AgentsOrders());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (snap.hasError) {
            return const Text("Error");
          }

          return AppWidget.loading();
        });
  }
}
