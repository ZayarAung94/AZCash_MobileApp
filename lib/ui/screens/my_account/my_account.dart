import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/my_account/components/add_depo.dart';
import 'package:az_cash/ui/screens/my_account/components/add_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                          value: NumberFormat("#,##0").format(AppData.totalDepo),
                        ),
                        mainDataCard(
                          label: "Total Withdraw",
                          value: NumberFormat("#,##0").format(AppData.totalWd),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        mainDataCard(
                          label: "Deposit Commission",
                          value: NumberFormat("#,##0").format(AppData.totalDepo * AppData.depoCommission),
                        ),
                        mainDataCard(
                          label: "Withdraw Commission",
                          value: NumberFormat("#,##0").format(AppData.totalWd * AppData.wdCommission),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Total Commission : ${NumberFormat("#,##0").format(AppData.totalDepo * AppData.depoCommission + AppData.totalWd * AppData.wdCommission)}",
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AddDeposit();
                      },
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text("Top up account"),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AddWithdraw();
                      },
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text("Withdraw funds"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: MaterialButton(
        //     color: AppColors.softBg,
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(10),
        //       ),
        //     ),
        //     onPressed: () {
        //       AppMessage.requirePremium();
        //     },
        //     child: const SizedBox(
        //       width: double.infinity,
        //       height: 60,
        //       child: Center(
        //         child: Text("Add Order from Agent"),
        //       ),
        //     ),
        //   ),
        // )
      ],
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
