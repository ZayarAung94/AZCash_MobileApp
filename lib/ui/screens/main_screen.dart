import 'dart:io';

import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/manage_credit/manage_credit.dart';
import 'package:az_cash/ui/screens/master_report/master_report.dart';
import 'package:az_cash/ui/screens/my_account/agent_account.dart';
import 'package:az_cash/ui/screens/my_account/my_account.dart';
import 'package:az_cash/ui/screens/payment_history/history.dart';
import 'package:az_cash/ui/screens/promotions/promotions.dart';
import 'package:az_cash/ui/screens/report_by_transactions/report_by_transactions.dart';
import 'package:az_cash/ui/screens/report_by_user/report_by_user.dart';
import 'package:az_cash/ui/screens/settings/setting.dart';
import 'package:az_cash/ui/screens/user_manage/user_manage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeMenu = 0;

  List<String> menu = [
    'My Account',
    'Report by Transactions',
    'Report by User',
    'Payment History',
    'User Management',
    'App Setting',
  ];
  List<Widget> pages = [
    const AgentAccount(),
    const ReportByTransactions(),
    const ReportByUserScreen(),
    const HistoryScreen(),
    const UserManageScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var mainScaffoldKey = GlobalKey<ScaffoldState>();
    bool canAppClose = false;
    if (AppData.user?.role == "Master") {
      menu = [
        'My Account',
        'Report by Transactions',
        'Report by User',
        'Payment History',
        'User Management',
        'Credit Manage',
        'Promotions',
        'Master Mod',
        'App Setting',
      ];
      pages = [
        const MyAccount(),
        const ReportByTransactions(),
        const ReportByUserScreen(),
        const HistoryScreen(),
        const UserManageScreen(),
        const ManageCredit(),
        const PromotionScreen(),
        const MasterReportScreen(),
        const SettingScreen(),
      ];
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b, result) {
        if (!Get.isSnackbarOpen) {
          if (activeMenu == 0) {
            canAppClose = true;

            Get.snackbar(
              'Are you sure to close app?',
              'You want to close application click back button next time before this missage dismiss.',
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              duration: const Duration(milliseconds: 3000),
            );
            Future.delayed(
              const Duration(milliseconds: 3000),
              () => {canAppClose = false},
            );
          } else {
            setState(() {
              activeMenu = 0;
            });
          }
        } else {
          if (canAppClose) {
            exit(0);
          }
        }
      },
      child: Scaffold(
        key: mainScaffoldKey,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.softBg,
          leading: IconButton(
            onPressed: () {
              mainScaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: Text(menu[activeMenu]),
        ),
        body: pages[activeMenu],
        drawer: Drawer(
          backgroundColor: AppColors.background,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  child: const Text(
                    "AZ_CASH",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            activeMenu = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == activeMenu ? AppColors.softBg : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(menu[index]),
                        ),
                      );
                    },
                  ),
                ),
                Text("Version : ${AppData.version} (Beta)"),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
