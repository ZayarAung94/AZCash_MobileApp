import 'package:az_cash/auth/user_controller.dart';
import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/database/models/agent.dart';
import 'package:az_cash/database/models/master_profile.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/app_helper.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../database/controllers/payment_controller.dart';
import '../ui/helper/snack.dart';
import '../ui/screens/auth/login.dart';
import '../ui/screens/auth/opt_login.dart';

class Auth {
  final _client = Supabase.instance.client;
  final _userController = UserController();

  Future<bool> login({required String email, required String passwd}) async {
    try {
      final res = await _client.auth.signInWithPassword(
        email: email,
        password: passwd,
      );

      await UserController().loadUser(res.user!.email!);

      AppData.activePaymentId = await PaymentController().checkAndAddPayment(
        Transaction(
          id: AppHelper.generateUniqueId(),
          clientId: 'Testing',
          agent: AppData.user!.id,
          amount: 0,
          type: "Deposit",
        ),
      );

      if (AppData.user!.role == "Master") {
        // Normal Session
        MasterProfile master = await MasterProfileController().get(1);
        await PaymentController().masterAgentUpdate(master);

        //Session Expire
      }

      return true;
    } on AuthException catch (e) {
      if (e.message == "Email not confirmed") {
        AppMessage.error("${e.message} \nCheck your email and confirm first.");
        try {
          await _client.auth.resend(
            type: OtpType.signup,
            email: email,
          );

          Get.to(() => OptLogin(email: email));
        } on AuthException catch (e) {
          AppMessage.error(e.message);
        }
      } else {
        AppMessage.error(e.message);
      }
      return false;
    }
  }

  Future logout() async {
    await _client.auth.signOut();
    AppData.user = null;
    Get.offAll(() => const LoginScreen());
  }

  Future<bool> register({
    required String email,
    required String passwd,
    required String name,
    required String phone,
  }) async {
    try {
      final userRes = await _userController.loadUser(email);

      if (userRes != null) {
        throw ('This email is already used!');
      } else {
        final res = await _client.auth.signUp(
          email: email,
          password: passwd,
        );

        AgentModel user = AgentModel(
          id: res.user!.id,
          name: name,
          email: email,
          phone: phone,
          createdAt: DateTime.now(),
        );

        await _userController.create(user);

        return true;
      }
    } on AuthException catch (e) {
      AppMessage.error(e.message);
      return false;
    }
  }

  Future<bool> optLogin(String token, String email) async {
    try {
      await _client.auth.verifyOTP(
        type: OtpType.signup,
        token: token,
        email: email,
      );

      return true;
    } on AuthException catch (e) {
      AppMessage.error(e.message);
      return false;
    }
  }

  Future forgetPassword() async {}

  Future optResend(String email) async {
    await _client.auth.resend(
      type: OtpType.signup,
      email: email,
    );

    AppMessage.normal(
      title: "Request OTP Success",
      message: "Please check your email. OTP code have send to your email.",
    );
  }
}
