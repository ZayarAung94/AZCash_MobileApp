import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/depo_history.dart';

class DepoHistoryController {
  final _dpHistoryTB = Supabase.instance.client.from('deposit_history');

  Future<List<DepoHistory>> getDepoHistory(int limit) async {
    final result = await _dpHistoryTB.select().order('created_at').limit(limit);
    return result.map((e) => DepoHistory.fromJson(e)).toList();
  }

  Future<bool> addDepo(DepoHistory data) async {
    try {
      data.beforeLimit = await MasterProfileController().getLimit(1);
      await _dpHistoryTB.insert(data.toJson());
      await MasterProfileController().changeLimit(1, data.afterLimit);
      return true;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
      return false;
    }
  }
}
