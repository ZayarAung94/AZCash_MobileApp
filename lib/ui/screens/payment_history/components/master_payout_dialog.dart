import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../database/controllers/payment_controller.dart';
import '../../../components/dialog_helper.dart';

class MasterPayoutDialog extends StatelessWidget {
  final int paymentId;
  const MasterPayoutDialog({super.key, required this.paymentId});

  @override
  Widget build(BuildContext context) {
    TextEditingController afterLimit = TextEditingController();
    return AppDialog.defaultDialog(
        title: "Master Payout",
        body: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: afterLimit,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                label: Text("After Limit :"),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
        submitBtnText: "Payout",
        submitBtnTap: () async {
          double? newLimit = double.tryParse(afterLimit.text.trim());
          if (newLimit != null) {
            double mLimit = await MasterProfileController().getLimit(1);
            double amount = newLimit - mLimit;

            await MasterProfileController().changeLimit(1, newLimit);
            await PaymentController().payout(paymentId, amount);
            Get.back(result: "reload");
          } else {
            AppMessage.error("Your input value is Wrong!");
          }
        });
  }
}
