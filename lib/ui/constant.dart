import 'package:az_cash/database/models/agent.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color.fromRGBO(13, 38, 69, 1);
  static const Color softBg = Color.fromRGBO(30, 50, 73, 1);
}

class AppData {
  static double version = 1.003;
  static bool isUpdate = false;

  static DateTime activeSession = DateTime.now();

  static int totalDepo = 0;
  static int totalWd = 0;
  static double depoCommission = 0.02;
  static double wdCommission = 0.02;

  static AgentModel? user;

  static int activePaymentId = 0;
}

class AppSetting {
  static bool masterMod = false;
}
