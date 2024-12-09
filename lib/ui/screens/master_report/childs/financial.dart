import 'package:az_cash/database/controllers/depo_history.dart';
import 'package:az_cash/database/models/depo_history.dart';
import 'package:az_cash/ui/helper/app_helper.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/settings/components/setting_value_change.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../helper/btn_helper.dart';

class MasterModeFinancial extends StatefulWidget {
  const MasterModeFinancial({super.key});

  @override
  State<MasterModeFinancial> createState() => _MasterModeFinancialState();
}

class _MasterModeFinancialState extends State<MasterModeFinancial> {
  final depoForm = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController beforeLimitController = TextEditingController();
  TextEditingController afterLimitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: DepoHistoryController().getDepoHistory(10),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  List<DepoHistory> histories = snap.data;
                  if (histories.isEmpty) {
                    return AppWidget.noData();
                  }
                  return ListView.builder(
                    itemCount: histories.length,
                    itemBuilder: (context, index) {
                      DepoHistory history = histories[index];
                      double loseAmount = (history.afterLimit - history.beforeLimit) - history.amount;
                      double losePer = (loseAmount / history.amount) * 100;
                      return Card(
                        elevation: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat("dd/MM/yyyy hh:mm a").format(history.createdAt)),
                                  Text(NumberFormat("#,##0.00").format(history.amount)),
                                ],
                              ),
                              const Divider(),
                              AppWidget.twoDataRow(
                                label1: "Before Limit :",
                                label2: "After Limit :",
                                value1: NumberFormat("#,##0.00").format(history.beforeLimit),
                                value2: NumberFormat("#,##0.00").format(history.afterLimit),
                              ),
                              AppWidget.twoDataRow(
                                label1: "Profit/Lose (%)",
                                label2: "Profit/Lose (K) :",
                                value1: '${NumberFormat("#,##0.00").format(losePer)} %',
                                value2: NumberFormat("#,##0.00").format(loseAmount),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return AppWidget.loading();
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: AppBtn.expendedBtn(
            color: Colors.green.shade900,
            label: "Add MobCash Deposit",
            onPressed: () async {
              var result = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SettingValueChange(
                    title: 'Add MobCash Deposit',
                    btnLabel: "Add Depo",
                    onPressed: () {
                      if (depoForm.currentState!.validate()) {
                        DepoHistoryController()
                            .addDepo(
                          DepoHistory(
                            id: AppHelper.generateUniqueId(),
                            amount: int.parse(amountController.text.trim()),
                            beforeLimit: 0,
                            afterLimit: double.parse(afterLimitController.text.trim()),
                            createdAt: DateTime.now(),
                          ),
                        )
                            .then((_) {
                          Get.back(result: "reload");
                        });
                      }
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: depoForm,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: amountController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              validator: (v) {
                                if (v == null || !Validator.isDouble(v)) {
                                  return "Enter valide amount!!!";
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Deposit Amount",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                            ),
                            // const SizedBox(height: 10),
                            // TextFormField(
                            //   controller: beforeLimitController,
                            //   keyboardType: const TextInputType.numberWithOptions(),
                            //   validator: (v) {
                            //     if (v == null || !Validator.isDouble(v)) {
                            //       return "Enter valide amount!!!";
                            //     }

                            //     return null;
                            //   },
                            //   decoration: const InputDecoration(
                            //     labelText: "Limit Before Deposit",
                            //     floatingLabelBehavior: FloatingLabelBehavior.always,
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: afterLimitController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              validator: (v) {
                                if (v == null || !Validator.isDouble(v)) {
                                  return "Enter valide amount!!!";
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Limit After Deposit",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );

              if (result == "reload") setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
