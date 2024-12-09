import 'package:az_cash/ui/components/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearAllData extends StatelessWidget {
  const ClearAllData({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDialog.defaultDialog(
        title: "Clear All Data",
        body: const Text("This is risky function. After delete all data, you can't undo. You will lose all data."),
        submitBtnText: "Clear All",
        submitBtnTap: () async {
          // await AppDatabase().clearAllData();

          Get.back();
        });
  }
}
