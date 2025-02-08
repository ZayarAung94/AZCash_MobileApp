import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/depo_history.dart';

class DepoHistoryController {
  final _dpHistoryTB = Supabase.instance.client.from('deposit_history');

  Future getDepoHistory(int limit) async {
    List<DepoHistory> history = [];
    final result = await _dpHistoryTB.select().order('created_at').limit(limit);
    for (var e in result) {
      history.add(DepoHistory.fromJson(e));
    }

    return history;
  }

  Future<bool> addDepo(DepoHistory data) async {
    double limit = await MasterProfileController().getLimit(1);
    data.beforeLimit = limit;
    try {
      await _dpHistoryTB.insert(data.toJson());
      await MasterProfileController().changeLimit(1, data.afterLimit);
      return true;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
      return false;
    }
  }
}
