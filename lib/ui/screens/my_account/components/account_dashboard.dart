import 'package:az_cash/database/controllers/agent_controller.dart';
import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/database/models/agent.dart';
import 'package:az_cash/database/models/master_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constant.dart';

class AccountDashboard extends StatelessWidget {
  const AccountDashboard({super.key});

  double getDepoCom(int amount) {
    if (amount > 3000000) {
      return 2.5;
    } else {
      return 1.5;
    }
  }

  double getWdCom(int amount) {
    if (amount > 3000000) {
      return 1;
    } else {
      return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (AppData.user!.role == "Master") {
      return StreamBuilder(
          stream: MasterProfileController().getMaster(1),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              MasterProfile main = snapshot.data!.first;
              return defaultDashboard(main.deposit, main.withdraw, 5.0, 2.0);
            }
            return defaultDashboard(0, 0, 5.0, 2.0);
          });
    } else {
      return StreamBuilder(
          stream: AgentController().getAgentById(AppData.user!.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AgentModel main = snapshot.data.first;
              return defaultDashboard(main.deposit, main.withdraw, getDepoCom(main.deposit), getWdCom(main.deposit));
            }
            return defaultDashboard(0, 0, 1.5, 0.5);
          });
    }
  }

  Container defaultDashboard(int deposit, int withdraw, double depoCom, double wdCom) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.softBg,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EPOS ID : ${AppData.user?.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    mainDataCard(
                      label: "Total Deposit",
                      value: NumberFormat("#,##0").format(deposit),
                    ),
                    mainDataCard(
                      label: "Total Withdraw",
                      value: NumberFormat("#,##0").format(withdraw),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    mainDataCard(
                      label: "Deposit Commission",
                      value: NumberFormat("#,##0").format(deposit * depoCom / 100),
                    ),
                    mainDataCard(
                      label: "Withdraw Commission",
                      value: NumberFormat("#,##0").format(withdraw * wdCom / 100),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Total Commission : ${NumberFormat("#,##0").format(deposit * depoCom / 100 + withdraw * wdCom / 100)}",
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
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
}
