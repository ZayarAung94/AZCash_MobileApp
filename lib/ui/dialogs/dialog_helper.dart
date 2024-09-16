import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static defaultDialog({
    required String title,
    required Widget body,
    required String submitBtnText,
    Function()? submitBtnTap,
    Function()? backBtnTap,
    Color? btnColor,
  }) {
    return Dialog(
      backgroundColor: AppColors.background,
      elevation: 10,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: body,
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: btnColor ?? Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: submitBtnTap ?? () {},
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Center(
                          child: Text(submitBtnText),
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
                      onPressed: backBtnTap ??
                          () {
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
}
