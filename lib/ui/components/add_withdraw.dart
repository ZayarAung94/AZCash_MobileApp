import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/payment_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constant.dart';

class AddWithdraw extends StatefulWidget {
  const AddWithdraw({super.key});

  @override
  State<AddWithdraw> createState() => _AddWithdrawState();
}

class _AddWithdrawState extends State<AddWithdraw> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

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
              "Withdraw",
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
                  label: Text("Withdraw Amount :"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  label: Text("Code :"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Payment Data Off')),
                ButtonSegment(value: 1, label: Text('Payment Data On')),
              ],
              selected: const <int>{0},
              onSelectionChanged: (Set<int> newSelection) {
                AppMessage.requirePremium();
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
                      Validator.isNumber(_amountController.text.trim()) &&
                      _codeController.text != "") {
                    await database
                        .into(database.orders)
                        .insert(OrdersCompanion.insert(
                          userId: _userIdController.text,
                          amount: int.parse(_amountController.text.trim()),
                          type: 'withdraw',
                          code: _codeController.text,
                          status: 'done',
                          isCredit: false,
                          created: DateTime.now(),
                        ))
                        .then((_) {
                      int amount = int.parse(_amountController.text);

                      if (DateTime.now().isAfter(AppData.activeSession)) {
                        DateTime today = DateTime.now();
                        AppData.totalWd = amount;
                        AppData.totalDepo = 0;
                        AppData.activeSession =
                            DateTime(today.year, today.month + 1, 1, 23, 59, 59)
                                .subtract(const Duration(days: 1));
                      } else {
                        AppData.totalWd = AppData.totalWd + amount;
                      }

                      PaymentController().appStartCheck();
                    });

                    Clipboard.setData(
                      ClipboardData(
                        text:
                            "#Withdraw \nId : ${_userIdController.text} \nAmount : ${_amountController.text} \nCode : ${_codeController.text}",
                      ),
                    );

                    Get.back();
                    AppMessage.copied();
                  } else {
                    AppMessage.error(
                        '"User ID", "Withdraw Amount" and "Code" are required. You must type this all data.');
                  }
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text("Withdraw"),
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
