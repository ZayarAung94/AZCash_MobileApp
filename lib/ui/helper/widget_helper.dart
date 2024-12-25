import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/under_develop.dart';
import '../constant.dart';

class AppWidget {
  static Widget oneDataRow({
    required String label1,
    required String value1,
    bool? underline = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label1,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(value1),
            ],
          ),
        ),
        if (underline!) const Divider(),
      ],
    );
  }

  static Widget twoDataRow({
    required String label1,
    required String label2,
    required String value1,
    required String value2,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label1,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(value1),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(value2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget dataCard({
    required String title,
    required Widget body,
  }) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 10,
      child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              body
            ],
          )),
    );
  }

  static Widget settingValue({
    required IconData icon,
    required String label,
    required String value,
    void Function()? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ??
          () {
            Get.dialog(
              const Dialog(
                backgroundColor: AppColors.background,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: UnderDevelop(),
                ),
              ),
            );
          },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.grey),
                const SizedBox(width: 8),
                Text(label),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 130,
                  child: Text(value,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: value == "N/A" ? Colors.red : Colors.white,
                      )),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget loading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 100,
          width: double.infinity,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(),
          ),
          child: const Column(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.softBg,
                ),
              ),
              SizedBox(height: 10),
              Text('Loading...'),
            ],
          ),
        )
      ],
    );
  }

  static Widget noData({String? message}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            message ?? "There is no data !!!",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
