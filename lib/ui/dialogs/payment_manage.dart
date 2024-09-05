import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/payment_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PaymentManage extends StatefulWidget {
  final Payment payment;
  const PaymentManage({super.key, required this.payment});

  @override
  State<PaymentManage> createState() => _PaymentManageState();
}

class _PaymentManageState extends State<PaymentManage> {
  TextEditingController realPayoutController = TextEditingController();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Payout Manage",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: realPayoutController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                label: Text("Real Payout"),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      if (Validator.isNumber(
                          realPayoutController.text.trim())) {
                        int realPayout =
                            int.parse(realPayoutController.text.trim());
                        await PaymentController().payout(
                          id: widget.payment.id,
                          realPayout: realPayout,
                        );

                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            Get.back();
                          },
                        );
                      } else {
                        AppMessage.error('Please enter a valid number');
                      }
                    },
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: isLoading
                            ? const Text("Payout")
                            : const SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    color: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text("Cancel"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
