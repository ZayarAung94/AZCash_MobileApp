import 'package:az_cash/database/controllers/payment_controller.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/firebase/controllers/appdata_controller.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/auth/appupdate.dart';
import 'package:az_cash/ui/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();
    DateTime today = DateTime.now();
    DateTime start = DateTime(today.year, today.month, 1, 0, 0, 0);
    DateTime end = DateTime(today.year, today.month, today.day, 23, 59, 59);

    AppData.activeSession = DateTime(today.year, today.month + 1, 1, 23, 59, 59)
        .subtract(const Duration(days: 1));

    FirebaseAppData().checkUpdate();

    Future getCommissionPer() async {
      final SharedPreferences spStore = await SharedPreferences.getInstance();

      AppData.depoCommission = spStore.getDouble('depoCommission') ?? 0.02;
      AppData.wdCommission = spStore.getDouble('wdCommission') ?? 0.02;
    }

    getCommissionPer();

    database.getOrderByRange(start, end).then((orders) {
      for (var order in orders) {
        if (order.type == "deposit" && order.status == "done") {
          AppData.totalDepo = AppData.totalDepo + order.amount;
        } else if (order.type == 'withdraw' && order.status == 'done') {
          AppData.totalWd = AppData.totalWd + order.amount;
        }
      }
    });

    Future.delayed(
      const Duration(seconds: 3),
      () => {
        if (AppData.isUpdate)
          {Get.offAll(() => const AppUpdateScreen())}
        else
          {
            Get.offAll(() => const LoginScreen()),
            PaymentController().appStartCheck()
          }
      },
    );

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
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
            "Loading...",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
