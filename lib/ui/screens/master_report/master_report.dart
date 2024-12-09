import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/screens/master_report/childs/agents.dart';
import 'package:az_cash/ui/screens/master_report/childs/financial.dart';
import 'package:az_cash/ui/screens/master_report/childs/reports.dart';
import 'package:az_cash/ui/screens/master_report/childs/settings.dart';
import 'package:az_cash/ui/screens/master_report/childs/summary.dart';
import 'package:flutter/material.dart';

class MasterReportScreen extends StatefulWidget {
  const MasterReportScreen({super.key});

  @override
  State<MasterReportScreen> createState() => _MasterReportScreenState();
}

class _MasterReportScreenState extends State<MasterReportScreen> {
  int activeIndex = 0;

  List<Widget> tabScreens = [
    const MasterModSummary(),
    const MasterModReports(),
    const MasterModAgents(),
    const MasterModeFinancial(),
    const MasterModeSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          color: AppColors.background,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(width: 10),
              tabBtn(index: 0, label: "Summary"),
              tabBtn(
                index: 1,
                label: "Reports",
                icon: Icons.list_alt_outlined,
              ),
              tabBtn(
                index: 2,
                label: "Agents",
                icon: Icons.group_outlined,
              ),
              tabBtn(
                index: 3,
                label: "Financial",
                icon: Icons.monetization_on_outlined,
              ),
              tabBtn(
                index: 4,
                label: "Settings",
                icon: Icons.settings,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        Expanded(
          child: tabScreens[activeIndex],
        )
      ],
    );
  }

  Widget tabBtn({
    required int index,
    required String label,
    IconData icon = Icons.document_scanner,
    bool enable = true,
  }) {
    return GestureDetector(
      onTap: () {
        if (enable) {
          setState(() {
            activeIndex = index;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: 90,
        decoration: BoxDecoration(
          color: index == activeIndex ? AppColors.softBg : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 27,
              color: enable ? Colors.grey : Colors.grey[800],
            ),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
}
