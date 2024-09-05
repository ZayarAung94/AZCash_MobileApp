import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/payment_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constant.dart';

class AddDeposit extends StatefulWidget {
  const AddDeposit({super.key});

  @override
  State<AddDeposit> createState() => _AddDepositState();
}

class _AddDepositState extends State<AddDeposit> {
  int payType = 0;
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final database = AppDatabase();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.softBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 3,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              "Deposit",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _userIdController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  label: Text("User ID :"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(
                    Icons.paste,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  label: Text("Topup Amount :"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Paided')),
                ButtonSegment(value: 1, label: Text('Promotion')),
                ButtonSegment(value: 2, label: Text('Credit')),
              ],
              selected: <int>{payType},
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              onSelectionChanged: (Set<int> newSelection) {
                if (newSelection.first > 0) {
                  AppMessage.requirePremium();
                } else {
                  setState(() {
                    payType = newSelection.first;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                color: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (_userIdController.text != "" &&
                      Validator.isNumber(_amountController.text.trim())) {
                    await database
                        .into(database.orders)
                        .insert(OrdersCompanion.insert(
                          userId: _userIdController.text.trim(),
                          amount: int.parse(_amountController.text.trim()),
                          code: '',
                          type: "deposit",
                          status: 'done',
                          isCredit: false,
                          created: DateTime.now(),
                        ))
                        .then((_) {
                      int amount = int.parse(_amountController.text);

                      if (DateTime.now().isAfter(AppData.activeSession)) {
                        DateTime today = DateTime.now();
                        AppData.totalDepo = amount;
                        AppData.totalWd = 0;
                        AppData.activeSession =
                            DateTime(today.year, today.month + 1, 1, 23, 59, 59)
                                .subtract(const Duration(days: 1));
                      } else {
                        AppData.totalDepo = AppData.totalDepo + amount;
                      }

                      PaymentController().appStartCheck();
                    });
                    Clipboard.setData(
                      ClipboardData(
                        text:
                            "#Deposit \nId : ${_userIdController.text} \nAmount : ${_amountController.text} \nP Name : ",
                      ),
                    );

                    Get.back();
                    AppMessage.copied();
                  } else {
                    AppMessage.error(
                      "'User Id' and 'Topup Amount' are required. You must give input both.",
                    );
                  }
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text("Deposit"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
