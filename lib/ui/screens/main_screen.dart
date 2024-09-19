import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/history.dart';
import 'package:az_cash/ui/screens/manage_credit.dart';
import 'package:az_cash/ui/screens/master_report/master_report.dart';
import 'package:az_cash/ui/screens/my_account.dart';
import 'package:az_cash/ui/screens/promotions.dart';
import 'package:az_cash/ui/screens/report_by_transactions.dart';
import 'package:az_cash/ui/screens/report_by_user.dart';
import 'package:az_cash/ui/screens/setting.dart';
import 'package:az_cash/ui/screens/transactions.dart';
import 'package:az_cash/ui/screens/user_manage.dart';
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
    'Transactions on EPOS',
    'Report by Transactions',
    'Report by User',
    'Payment History',
    'User Management',
    'Credit Manage',
    'Master Mod',
    'Promotions',
    'App Setting',
  ];
  List<Widget> pages = [
    const MyAccount(),
    const TranasctionsScreen(),
    const ReportByTransactions(),
    const ReportByUserScreen(),
    const HistoryScreen(),
    const UserManageScreen(),
    const ManageCredit(),
    const MasterReportScreen(),
    const PromotionScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var mainScaffoldKey = GlobalKey<ScaffoldState>();
    bool canAppClose = false;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b, result) {
        if (!Get.isSnackbarOpen) {
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
          if (canAppClose) {
            //TODO: app close code
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            color: index == activeMenu
                                ? AppColors.softBg
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
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
