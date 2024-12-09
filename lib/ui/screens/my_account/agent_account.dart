import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgentAccount extends StatefulWidget {
  const AgentAccount({super.key});

  @override
  State<AgentAccount> createState() => _AgentAccountState();
}

class _AgentAccountState extends State<AgentAccount> {
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
        Expanded(
          child: ListView.builder(
            itemCount: 7,
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
                                Row(
                                  children: [
                                    Text(
                                      "Crd : {order.credit}, ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  NumberFormat('#,##0').format(10000),
                                  style: const TextStyle(
                                    color: "type" == "withdraw" ? Colors.red : Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  DateFormat("hh:mm a").format(DateTime.now()),
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
