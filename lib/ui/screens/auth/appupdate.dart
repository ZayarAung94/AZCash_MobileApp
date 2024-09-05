import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';

class AppUpdateScreen extends StatelessWidget {
  const AppUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri teleChannelUrl = Uri.parse('https://t.me/azCashAC');

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.calculate_sharp,
                size: 80,
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            const Text(
              "AZ Cash",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Application Update is avaliable!"),
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () async {
                if (!await launchUrl(teleChannelUrl)) {
                  AppMessage.error('Could not launch $teleChannelUrl .');
                }
              },
              color: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Text("Get UPDATE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
