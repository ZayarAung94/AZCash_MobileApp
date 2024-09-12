import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SettingValueChange extends StatefulWidget {
  final String title;
  final Widget? body;
  final String? btnLabel;
  final Function()? onPressed;

  const SettingValueChange({
    super.key,
    required this.title,
    this.body,
    this.btnLabel,
    this.onPressed,
  });

  @override
  State<SettingValueChange> createState() => _SettingValueChangeState();
}

class _SettingValueChangeState extends State<SettingValueChange> {
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
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            widget.body ?? const Text("No Body"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: AppBtn.expendedBtn(
                      color: Colors.green.shade900,
                      label: widget.btnLabel ?? "Save",
                      onPressed: widget.onPressed ?? () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppBtn.expendedBtn(
                      color: AppColors.background,
                      label: "Back",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
