import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMessage {
  static normal({required String title, required String message}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }

  static error(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        'Opps!!! Something is wrong',
        message,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.red.withOpacity(0.3),
        colorText: Colors.white,
      );
    }
  }

  static copied() {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        'Copied data to your Keyboard',
        "Data is copied to your keyboard. Past and send to your Master Agent.",
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }

  static requirePremium() {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        'Opps!!! Require Premium',
        "This Furture can be use Premium VIP User only.",
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.amber.withOpacity(0.3),
        colorText: Colors.white,
        mainButton: TextButton(
          onPressed: () {},
          child: const Column(
            children: [
              Text("Get"),
              Text("Premium"),
            ],
          ),
        ),
      );
    }
  }
}
