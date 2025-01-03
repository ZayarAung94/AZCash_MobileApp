import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/models/payment.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PayoutSheet extends StatelessWidget {
  final PaymentModel payment;
  const PayoutSheet({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    TextEditingController payoutController = TextEditingController();

    double getDepoCom(int amount) {
      if (amount > 3000000) {
        return 2.5 / 100;
      } else {
        return 1.5 / 100;
      }
    }

    double getWdCom(int amount) {
      if (amount > 3000000) {
        return 1 / 100;
      } else {
        return 0.5 / 100;
      }
    }

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
              "Commission Payout",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${DateFormat("dd/MM/yyyy").format(payment.sessionStart)} ~ ${DateFormat("dd/MM/yyyy").format(payment.sessionEnd.subtract(const Duration(hours: 1)))}",
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.softBg,
              child: Column(
                children: [
                  reportDataRow(
                    label1: 'Deposit :',
                    label2: 'Withdraw :',
                    value1: NumberFormat("#,###").format(payment.deposit),
                    value2: NumberFormat("#,##0").format(payment.withdraw),
                  ),
                  reportDataRow(
                    label1: 'Commission :',
                    label2: '',
                    value1: NumberFormat("#,##0").format(
                        payment.deposit * getDepoCom(payment.deposit) + payment.withdraw * getWdCom(payment.deposit)),
                    value2: '',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: payoutController,
                decoration: const InputDecoration(
                  label: Text("Real Payout :"),
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
                  double? payout = double.tryParse(payoutController.text.trim());
                  if (payout != null) {
                    await PaymentController().payout(payment.id, payout);
                    Get.back(result: "reload");
                  } else {
                    AppMessage.error("Your input payout is something wrong!");
                  }
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text("Payout"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container reportDataRow({
    required String label1,
    required String label2,
    required String value1,
    required String value2,
    Color? value1Color,
    Color? value2Color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: Row(
        children: [
          reportData(
            label: label1,
            value: value1,
            valueColor: value1Color,
          ),
          const SizedBox(width: 25),
          reportData(
            label: label2,
            value: value2,
            valueColor: value2Color,
          ),
        ],
      ),
    );
  }

  Widget reportData({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
