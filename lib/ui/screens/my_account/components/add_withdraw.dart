import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../helper/app_helper.dart';

class AddWithdraw extends StatefulWidget {
  const AddWithdraw({super.key});

  @override
  State<AddWithdraw> createState() => _AddWithdrawState();
}

class _AddWithdrawState extends State<AddWithdraw> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _crdController = TextEditingController();

  final TransactionController transactionController = TransactionController();

  bool isLoading = false;
  int payType = 0;

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
            // const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: TextField(
            //     controller: _codeController,
            //     decoration: const InputDecoration(
            //       label: Text("Code :"),
            //       floatingLabelBehavior: FloatingLabelBehavior.always,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Paided')),
                ButtonSegment(value: 1, label: Text('Payback the Credit')),
              ],
              selected: <int>{payType},
              onSelectionChanged: (Set<int> newSelection) {
                setState(() {
                  payType = newSelection.first;
                });
              },
            ),
            if (payType == 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: _crdController,
                  decoration: const InputDecoration(
                    label: Text("Credit Amount :"),
                    hintText: "If no input, all amount will be Credit Payback.",
                    hintStyle: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
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
                  if (_userIdController.text != "" && Validator.isNumber(_amountController.text.trim())) {
                    setState(() {
                      isLoading = true;
                    });

                    Transaction order = Transaction(
                      id: AppHelper.generateUniqueId(),
                      clientId: _userIdController.text.trim(),
                      type: "Withdraw",
                      amount: double.parse(_amountController.text.trim()),
                    );

                    if (payType == 0) {
                      await transactionController.addTransaction(order);
                    } else if (payType == 1) {
                      double? crd = -double.parse(_amountController.text);

                      if (_crdController.text != "") {
                        crd = double.tryParse(_crdController.text);
                        if (crd == null) {
                          AppMessage.error(
                            "Enter valid value in Credit Amount!!!",
                          );
                          return;
                        }
                      }

                      order.credit = crd;
                      await transactionController.addTransaction(order);
                    }

                    if (!Get.isSnackbarOpen) {
                      Get.back();
                      AppMessage.copied();
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  } else {
                    AppMessage.error(
                        '"User ID", "Withdraw Amount" and "Code" are required. You must type this all data.');
                  }
                },
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Withdraw"),
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
