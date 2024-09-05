import 'package:az_cash/ui/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class CommissionSetting extends StatefulWidget {
  const CommissionSetting({super.key});

  @override
  State<CommissionSetting> createState() => _CommissionSettingState();
}

class _CommissionSettingState extends State<CommissionSetting> {
  TextEditingController depoCommController = TextEditingController();
  TextEditingController wdCommController = TextEditingController();

  bool isLoading = true;

  Future changeCommissionPer() async {
    final SharedPreferences spStore = await SharedPreferences.getInstance();

    if (Validator.isDouble(depoCommController.text.trim())) {
      double newDepoComm = double.parse(depoCommController.text.trim());
      AppData.depoCommission = newDepoComm / 100;
      await spStore.setDouble('depoCommission', newDepoComm / 100);
    }

    if (Validator.isDouble(wdCommController.text.trim())) {
      double newWdComm = double.parse(wdCommController.text.trim());
      AppData.wdCommission = newWdComm / 100;
      await spStore.setDouble('wdCommission', newWdComm / 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Commission Setting",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            commissionInput(
              label: "Deposit Commission (%)",
              initValue: "${AppData.depoCommission * 100}",
              controller: depoCommController,
            ),
            commissionInput(
              label: "Withdraw Commission (%)",
              initValue: "${AppData.wdCommission * 100}",
              controller: wdCommController,
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
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
                      onPressed: () {
                        setState(() {
                          isLoading = !isLoading;
                          changeCommissionPer();
                        });

                        Future.delayed(const Duration(seconds: 1), () {
                          Get.back();
                        });
                      },
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Center(
                          child: isLoading
                              ? const Text("Save")
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
                          child: Text("Back"),
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
      ),
    );
  }

  Widget commissionInput({
    required String label,
    required String initValue,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          SizedBox(
            width: 70,
            height: 35,
            child: TextFormField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(),
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: initValue,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: const OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
