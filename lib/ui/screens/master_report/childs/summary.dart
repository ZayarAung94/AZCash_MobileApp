import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';

class MasterModSummary extends StatelessWidget {
  const MasterModSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppWidget.dataCard(
            title: "MobCash's Reports",
            body: Column(
              children: [
                AppWidget.oneDataRow(
                  label1: "Balance : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Limits : ",
                  value1: "100,000",
                ),
              ],
            ),
          ),
          AppWidget.dataCard(
            title: "Monthly Promotions & Credits",
            body: Column(
              children: [
                AppWidget.oneDataRow(
                  label1: "Promotions Amounts (K) : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Promotions User : ",
                  value1: "1,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Total Credit Amounts (K) : ",
                  value1: "0",
                ),
                AppWidget.oneDataRow(
                  label1: "Active Credit Users : ",
                  value1: "0",
                ),
              ],
            ),
          ),
          AppWidget.dataCard(
            title: 'Monthly Summary',
            body: Column(
              children: [
                AppWidget.oneDataRow(
                  label1: "Total Deposit : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Total Withdraw : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Deposit Commission (K) : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Withdraw Commission (K) : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Active Agents : ",
                  value1: "23",
                ),
                AppWidget.oneDataRow(
                  label1: "Active Users : ",
                  value1: "110",
                ),
                AppWidget.oneDataRow(
                  label1: "Deposit Orders : ",
                  value1: "2,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Withdraw Orders : ",
                  value1: "1,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Agent's Deposit Commissions : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Agent's Withdraw Commissions : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Agent's Total Commissions : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "MobCash's Depo Lose (%) :",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "MobCash's Depo Lose (K) :",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Total Net Profits :",
                  value1: "100,000",
                ),
              ],
            ),
          ),
          AppWidget.dataCard(
            title: "Overall Promotions & Credits",
            body: Column(
              children: [
                AppWidget.oneDataRow(
                  label1: "Promotions Amounts (K) : ",
                  value1: "100,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Promotions User : ",
                  value1: "1,000",
                ),
                AppWidget.oneDataRow(
                  label1: "Total Credit Amounts (K) : ",
                  value1: "0",
                ),
                AppWidget.oneDataRow(
                  label1: "Active Credit Users : ",
                  value1: "0",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
