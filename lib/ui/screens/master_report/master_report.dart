import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';

class MasterReportScreen extends StatefulWidget {
  const MasterReportScreen({super.key});

  @override
  State<MasterReportScreen> createState() => _MasterReportScreenState();
}

class _MasterReportScreenState extends State<MasterReportScreen> {
  int activeIndex = 0;

  List<Widget> tabScreens = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
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
                index: 4,
                label: "Financial",
                icon: Icons.monetization_on_outlined,
              ),
              tabBtn(
                index: 5,
                label: "Settings",
                icon: Icons.settings,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
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
        width: 100,
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
