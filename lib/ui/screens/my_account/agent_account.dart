import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/components/order_widget.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/my_account/components/account_dashboard.dart';
import 'package:flutter/material.dart';

class AgentAccount extends StatefulWidget {
  const AgentAccount({super.key});

  @override
  State<AgentAccount> createState() => _AgentAccountState();
}

class _AgentAccountState extends State<AgentAccount> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AccountDashboard(),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              "Last Transactions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          FutureBuilder(
            future: TransactionController().getByLimit(5),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                List<Transaction> transactions = snap.data ?? [];
                return ListView.builder(
                  itemCount: transactions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Transaction order = transactions[index];
                    return OrderWidget(order: order);
                  },
                );
              } else {
                return AppWidget.loading();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget mainDataCard({
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Card(
        elevation: 6,
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 5),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget wdAddress() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Withdraw Address",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
          Text("Myanmar, Shwepyitha, AZ E-Shop")
        ],
      ),
    );
  }
}
