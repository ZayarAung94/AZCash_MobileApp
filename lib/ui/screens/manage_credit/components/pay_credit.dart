import 'package:az_cash/database/controllers/transaction_controller.dart';
import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/helper/app_helper.dart';
import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/screens/manage_credit/childs/credit_history.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constant.dart';

class PayCredit extends StatelessWidget {
  final ClientModel client;
  const PayCredit({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final TextEditingController crdController = TextEditingController();

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
              "Pay Credit",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Account :"),
                  Text("${client.name} (${client.id})"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Credit :"),
                  Text("${client.credit} K"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: TextField(
                controller: crdController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  labelText: "Pay Amount (K)",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppBtn.expendedBtn(
                  color: Colors.green,
                  label: "Paid Credit",
                  onPressed: () async {
                    double? crdAmount = double.tryParse(crdController.text.trim());

                    if (crdAmount != null) {
                      // Add Credit
                      crdAmount = -double.parse(crdController.text.trim());
                      Transaction order = Transaction(
                        id: AppHelper.generateUniqueId(),
                        clientId: client.id,
                        agent: client.agent,
                        amount: 0,
                        type: "Deposit",
                        creditAmount: crdAmount,
                      );

                      await TransactionController().addTransaction(order);

                      Get.back();
                    } else {
                      AppMessage.error("Enter Valide Amount!");
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppBtn.expendedBtn(
                  color: Colors.grey,
                  label: 'View Credit History',
                  onPressed: () {
                    Get.to(() => CreditHistory(client: client));
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
