import 'package:az_cash/database/controllers/order_controller.dart';
import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _promoController = TextEditingController();
  final TextEditingController _creditController = TextEditingController();

  final database = AppDatabase();
  final userController = UsersController();
  final orderController = OrderController();

  bool isLoading = false;
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
                if (newSelection.first > 3) {
                  AppMessage.requirePremium();
                } else {
                  setState(() {
                    payType = newSelection.first;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            if (payType == 1)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: TextField(
                  controller: _promoController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    label: Text("Promotions Amount :"),
                    hintText: "If no input, all amount will be Promotions.",
                    hintStyle: TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
            if (payType == 2)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: _creditController,
                  decoration: const InputDecoration(
                    label: Text("Credit Amount :"),
                    hintText: "If no input, all amount will be Credit.",
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
                  if (_userIdController.text != "" &&
                      Validator.isNumber(_amountController.text.trim())) {
                    setState(() {
                      isLoading = true;
                    });

                    if (payType == 0) {
                      await orderController.addDeposit(
                        userId: _userIdController.text.trim(),
                        amount: int.parse(_amountController.text),
                      );
                    } else if (payType == 1) {
                    } else if (payType == 2) {
                      int? crd = int.parse(_amountController.text);

                      if (_creditController.text != "") {
                        crd = int.tryParse(_creditController.text);
                        if (crd == null) {
                          AppMessage.error(
                            "Enter valid value in Credit Amount!!!",
                          );
                          return;
                        }
                      }

                      await orderController.addCreditDepo(
                        userId: _userIdController.text.trim(),
                        amount: int.parse(_amountController.text),
                        crdAmount: crd,
                      );
                    }

                    Get.back();
                    AppMessage.copied();
                    userController.addUser(_userIdController.text.trim());
                  } else {
                    AppMessage.error(
                      "'User Id' and 'Topup Amount' are required. You must give input both.",
                    );
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
                        : const Text("Deposit"),
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
