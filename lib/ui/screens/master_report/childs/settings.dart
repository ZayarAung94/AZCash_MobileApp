import 'package:az_cash/ui/components/setting_value_change.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';

class MasterModeSettings extends StatelessWidget {
  const MasterModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppWidget.dataCard(
          title: "MobCash Settings",
          body: Column(
            children: [
              AppWidget.settingValue(
                icon: Icons.currency_bitcoin,
                label: "Last Month's Balance",
                value: "value",
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const SettingValueChange(
                        title: "Last Month's Balance",
                        body: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                "This value is very risky and basic information. Please, carefull to change this value.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(),
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
                label: "Last Month's Limit",
                value: "value",
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const SettingValueChange(
                        title: "Last Month's Limit",
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
