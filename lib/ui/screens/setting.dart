import 'package:az_cash/auth/auth.dart';
import 'package:az_cash/ui/components/under_develop.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/dialogs/commission_setting.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          settingTitle("Profile"),
          profileWidget(),
          const Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            elevation: 5,
            child: SizedBox(
              width: double.infinity,
              height: 100,
            ),
          ),
          settingValue(
            icon: Icons.phone_android,
            label: "Phone Number",
            value: "${AppData.user?.phone}",
          ),
          settingValue(
            icon: Icons.lock,
            label: "Change Password",
            value: "",
          ),
          settingValue(
            icon: Icons.lock,
            label: "Agent Code",
            value: "${AppData.user?.agentCode}",
          ),
          settingValue(
            icon: Icons.star,
            label: "Account Role",
            value: "${AppData.user?.role}",
          ),
          settingValue(
            icon: Icons.logout_rounded,
            label: "Log Out",
            value: "",
            onTap: () async {
              try {
                await Auth().logout();
              } catch (e) {
                AppMessage.error("Something is wrong!");
              }
            },
          ),
          settingTitle("Master Settings"),
          settingValue(
            icon: Icons.group_outlined,
            label: "Master",
            value: "N/A",
            onTap: () {
              AppMessage.requirePremium();
            },
          ),
          settingValue(
            icon: Icons.group_outlined,
            label: "Promo Code",
            value: "N/A",
            onTap: () {
              AppMessage.requirePremium();
            },
          ),
          settingValue(
            icon: Icons.group_add,
            label: "Reffial Link",
            value: "N/A",
            onTap: () {
              AppMessage.requirePremium();
            },
          ),
          settingValue(
            icon: Icons.money_outlined,
            label: "Deposit Commmission",
            value: "${AppData.depoCommission * 100} %",
            onTap: () async {
              await Get.dialog(const CommissionSetting());

              setState(() {});
            },
          ),
          settingValue(
            icon: Icons.money_outlined,
            label: "Withdraw Commmission",
            value: "${AppData.wdCommission * 100} %",
            onTap: () async {
              await Get.dialog(const CommissionSetting());
              setState(() {});
            },
          ),
          settingValue(
            icon: Icons.verified_user_outlined,
            label: "Master Mod",
            value: AppData.user!.role == "Master" ? "ON" : "OFF",
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget settingValue({
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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

  Container profileWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.softBg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person_3,
                  size: 35,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${AppData.user?.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${AppData.user?.email}",
                    style: const TextStyle(fontSize: 11),
                  )
                ],
              )
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Container settingTitle(String label) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
