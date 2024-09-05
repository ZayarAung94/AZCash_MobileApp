import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';

class MasterMainScreen extends StatelessWidget {
  const MasterMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: const Text("Master Settings"),
      ),
    );
  }
}
