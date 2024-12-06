import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/screens/childs/credit_history.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../constant.dart';

class PayCredit extends StatelessWidget {
  const PayCredit({super.key});

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Account :"),
                  Text("Name (11111)"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Credit :"),
                  Text("10000 K"),
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
                    int? crdAmount = int.tryParse(crdController.text.trim());

                    if (crdAmount != null) {
                      // Add Credit

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
                    Get.to(() => const CreditHistory());
                  }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
