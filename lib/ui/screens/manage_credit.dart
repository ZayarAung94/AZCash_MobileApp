import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/components/pay_credit.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';

class ManageCredit extends StatefulWidget {
  const ManageCredit({super.key});

  @override
  State<ManageCredit> createState() => _ManageCreditState();
}

class _ManageCreditState extends State<ManageCredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBg,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                hintText: "Search by ID...",
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: UsersController().getCreditUser(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    List<User> data = snap.data;

                    if (data.isEmpty) {
                      return AppWidget.noData();
                    }

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.softBg,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Credit : ",
                              ),
                              Text(
                                NumberFormat('#,##0').format(2000),
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              User user = data[index];
                              return GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return PayCredit(user: user);
                                    },
                                  );

                                  setState(() {});
                                },
                                child: Card(
                                  margin: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  color: AppColors.background,
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.userName,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text("(${user.userId})"),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  NumberFormat("#,##0").format(
                                                    user.totalCredit,
                                                  ),
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(
                                                          "dd/MM/yyyy hh:mm a")
                                                      .format(
                                                          user.lastCreditDate!),
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return AppWidget.loading();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
