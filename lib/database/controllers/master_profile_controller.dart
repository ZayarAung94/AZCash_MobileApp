import 'package:az_cash/database/models/master_profile.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MasterProfileController {
  final masterPTB = Supabase.instance.client.from("master_profile");

  Future<void> add(MasterProfile master) async {
    await masterPTB.insert(master.toJson());
  }

  Stream<List<MasterProfile>> getMaster(int? id) {
    return masterPTB.stream(primaryKey: ['id']).map((value) {
      return value.map(MasterProfile.fromJson).toList();
    });
  }

  Future<MasterProfile> get(int id) async {
    final result = await masterPTB.select().eq('id', id).single();
    return MasterProfile.fromJson(result);
  }

  Future<double> getLimit(int id) async {
    return (await get(id)).limit;
  }

  Future<void> changeLimit(int id, double limit) async {
    await _updateField(id, 'limits', limit);
  }

  Future<void> addLimit(double amount) async {
    await _changeLimitBy(amount);
  }

  Future<void> reduceLimit(double amount) async {
    await _changeLimitBy(-amount);
  }

  Future<double> getBalance(int id) async {
    return (await get(id)).balance;
  }

  Future<void> changeBalance(int id, double balance) async {
    await _updateField(id, 'balance', balance);
  }

  Future<void> addBalance(double amount) async {
    await _changeBalanceBy(amount);
  }

  Future<void> reduceBalance(double amount) async {
    await _changeBalanceBy(-amount);
  }

  Future<void> sessionEndReset() async {
    await masterPTB.update({'deposit': 0, 'withdraw': 0}).eq("id", 1);
  }

  Future<void> _updateField(int id, String field, double value) async {
    try {
      await masterPTB.update({field: value}).eq("id", id);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<void> _changeLimitBy(double amount) async {
    try {
      double limit = await getLimit(1);
      await changeLimit(1, limit + amount);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<void> _changeBalanceBy(double amount) async {
    try {
      double balance = await getBalance(1);
      await changeBalance(1, balance + amount);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }
}
