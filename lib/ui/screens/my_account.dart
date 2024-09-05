import 'package:az_cash/ui/components/add_depo.dart';
import 'package:az_cash/ui/components/add_withdraw.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EPOS ID : ${AppData.userName}",
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
                          value:
                              NumberFormat("#,##0").format(AppData.totalDepo),
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
                          value: NumberFormat("#,##0").format(
                              AppData.totalDepo * AppData.depoCommission),
                        ),
                        mainDataCard(
                          label: "Withdraw Commission",
                          value: NumberFormat("#,##0")
                              .format(AppData.totalWd * AppData.wdCommission),
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
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AddDeposit();
                      },
                    );

                    setState(() {});
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
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const AddWithdraw();
                      },
                    );

                    setState(() {});
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
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Request Orders :"),
        //     Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 10.0),
        //       child: Text(
        //         "2",
        //         style: TextStyle(
        //           color: Colors.red,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        // const Divider(),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Card(
        //           color: index != 1 ? AppColors.softBg : Colors.red[900],
        //           child: Container(
        //             padding: const EdgeInsets.all(10.0),
        //             child: const Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Text(
        //                           "User Name",
        //                           style: TextStyle(
        //                             fontSize: 15,
        //                           ),
        //                         ),
        //                         SizedBox(width: 8),
        //                         Text(
        //                           "(123456789)",
        //                           style: TextStyle(
        //                             color: Colors.grey,
        //                             fontSize: 11,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     SizedBox(height: 8),
        //                     Text(
        //                       "Done !!! Payment not receive.",
        //                       style: TextStyle(
        //                         color: Colors.grey,
        //                         fontSize: 11,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.end,
        //                   children: [
        //                     Text(
        //                       "10,000",
        //                       style: TextStyle(
        //                         color: Colors.green,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     SizedBox(height: 8),
        //                     Text(
        //                       "9:30 pm",
        //                       style: TextStyle(
        //                         color: Colors.grey,
        //                         fontSize: 11,
        //                       ),
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     },
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
