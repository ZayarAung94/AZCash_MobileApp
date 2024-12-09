import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/settings/components/setting_value_change.dart';
import 'package:flutter/material.dart';

class MasterModeSettings extends StatelessWidget {
  const MasterModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final msbForm = GlobalKey<FormState>();
    final mslForm = GlobalKey<FormState>();
    final msbController = TextEditingController();
    final mslController = TextEditingController();

    return Column(
      children: [
        AppWidget.dataCard(
          title: "MobCash Settings",
          body: Column(
            children: [
              AppWidget.settingValue(
                icon: Icons.currency_bitcoin,
                label: "Monthly Start Balance",
                value: "value",
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return SettingValueChange(
                        title: "Monthly Start Balance",
                        onPressed: () {
                          if (msbForm.currentState!.validate()) {
                            AppMessage.requirePremium();
                          }
                        },
                        body: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const Text(
                                "This value is very risky and basic information. Please, carefull to change this value.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Form(
                                key: msbForm,
                                child: TextFormField(
                                  controller: msbController,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return "Please enter last month's End Balance";
                                    }
                                    if (!Validator.isDouble(v)) {
                                      return "Please enter number value";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              AppWidget.settingValue(
                icon: Icons.monetization_on_outlined,
                label: "Monthly Start Limit",
                value: "value",
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return SettingValueChange(
                        title: "Monthly Start Limit",
                        onPressed: () {
                          if (mslForm.currentState!.validate()) {
                            AppMessage.requirePremium();
                          }
                        },
                        body: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const Text(
                                "This value is very risky and basic information. Please, carefull to change this value.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Form(
                                key: mslForm,
                                child: TextFormField(
                                  controller: mslController,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return "Please enter last month's End Balance";
                                    }
                                    if (!Validator.isDouble(v)) {
                                      return "Please enter number value";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
