import 'package:az_cash/database/models/agent.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../ui/constant.dart';

class UserController {
  final userTb = Supabase.instance.client.from("users");

  Future create(AgentModel user) async {
    try {
      await userTb.insert(user.toJson());

      AppData.user = user;
    } catch (e) {
      AppMessage.error("Something is wrong on created account!");
    }
  }

  Future<AgentModel?> loadUser(String email) async {
    try {
      final result = await userTb.select().eq("email", email).single();
      AppData.user = AgentModel.fromJson(result);
    } catch (e) {
      AppMessage.error('Something is wrong on your account. Contact to Customer Support!');
    }

    return AppData.user;
  }
}
