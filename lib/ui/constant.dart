import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  static String email = "";
  static String userName = "Unverified";
  static String phone = "+95 9999999999";
  static String device = "Unverified";
  static String deviceSerie = "";
  static String level = "Free";
  static String expireDate = DateFormat("dd-MM-yyyy")
      .format(DateTime(DateTime.now().year, DateTime.now().month + 1, 1).subtract(const Duration(days: 1)));
}

class AppSetting {
  static bool masterMod = false;
}
