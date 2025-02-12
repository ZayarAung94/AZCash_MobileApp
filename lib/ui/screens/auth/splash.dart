import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/auth/appupdate.dart';
import 'package:az_cash/ui/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    AppData.activeSession = DateTime(today.year, today.month + 1, 1, 23, 59, 59).subtract(const Duration(days: 1));

    Future getCommissionPer() async {
      final SharedPreferences spStore = await SharedPreferences.getInstance();

      AppData.depoCommission = spStore.getDouble('depoCommission') ?? 0.02;
      AppData.wdCommission = spStore.getDouble('wdCommission') ?? 0.02;
    }

    Future<void> loadData() async {
      await getCommissionPer();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: FutureBuilder(
          future: loadData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: double.infinity),
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.calculate_sharp,
                      size: 80,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "AZ Cash",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "This application for Cash In/ Cash Out Record and Management.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.softBg,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Loading Data...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              );
            } else if (snap.connectionState == ConnectionState.done) {
              if (AppData.isUpdate) {
                return const AppUpdateScreen();
              } else {
                return const LoginScreen();
              }
            } else {
              return AppWidget.noData(
                message: "Error Loading Data",
              );
            }
          }),
    );
  }
}
