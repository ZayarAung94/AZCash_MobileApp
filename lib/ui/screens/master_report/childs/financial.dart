import 'package:az_cash/ui/components/setting_value_change.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';

import '../../../helper/btn_helper.dart';

class MasterModeFinancial extends StatelessWidget {
  const MasterModeFinancial({super.key});

  @override
  Widget build(BuildContext context) {
    final depoForm = GlobalKey<FormState>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("12/10/2024 12:00pm"),
                          Text("2,000,000"),
                        ],
                      ),
                      const Divider(),
                      AppWidget.twoDataRow(
                        label1: "Before Limit :",
                        label2: "After Limit :",
                        value1: 'value1',
                        value2: 'value2',
                      ),
                      AppWidget.twoDataRow(
                        label1: "Profit/Lose (%)",
                        label2: "Profit/Lose (K) :",
                        value1: '',
                        value2: 'value2',
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: AppBtn.expendedBtn(
            color: Colors.green.shade900,
            label: "Add MobCash Deposit",
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SettingValueChange(
                    title: 'Add MobCash Deposit',
                    btnLabel: "Add Depo",
                    onPressed: () {
                      if (depoForm.currentState!.validate()) {}
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: depoForm,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (v) {
                                if (v == null || !Validator.isDouble(v)) {
                                  return "Enter valide amount!!!";
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Deposit Amount",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (v) {
                                if (v == null || !Validator.isDouble(v)) {
                                  return "Enter valide amount!!!";
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Limit After Deposit",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
