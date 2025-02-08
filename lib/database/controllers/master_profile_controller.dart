import 'package:az_cash/database/models/master_profile.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MasterProfileController {
  final masterPTB = Supabase.instance.client.from("master_profile");

  Future add(MasterProfile master) async {
    await masterPTB.insert(master.toJson());
  }

  Stream<List<MasterProfile>> getMaster(int? id) {
    final result = masterPTB.stream(primaryKey: ['id']).map((value) {
      return value.map((e) {
        return MasterProfile.fromJson(e);
      }).toList();
    });

    return result;
  }

  Future<MasterProfile> get(int id) async {
    final result = await masterPTB.select().eq('id', id).single();
    return MasterProfile.fromJson(result);
  }

  Future<double> getLimit(int id) async {
    final result = await masterPTB.select().eq('id', id).single();
    MasterProfile profile = MasterProfile.fromJson(result);

    return profile.limit;
  }

  Future changeLimit(int id, double limit) async {
    try {
      await masterPTB.update({'limits': limit}).eq("id", id);
      return true;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future addLimit(double amount) async {
    try {
      double limit = await getLimit(1);
      double newLimit = limit + amount;

      await changeLimit(1, newLimit);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future reduceLimit(double amount) async {
    try {
      double limit = await getLimit(1);
      double newLimit = limit - amount;

      await changeLimit(1, newLimit);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<double> getBalance(int id) async {
    final result = await masterPTB.select().eq('id', id).single();
    MasterProfile profile = MasterProfile.fromJson(result);

    return profile.balance;
  }

  Future changeBalance(int id, double balance) async {
    try {
      await masterPTB.update({'balance': balance}).eq("id", id);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future addBalance(double amount) async {
    try {
      double balance = await getBalance(1);
      double newBalance = balance + amount;

      await changeBalance(1, newBalance);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future reduceBalance(double amount) async {
    try {
      double balance = await getBalance(1);
      double newBalance = balance - amount;

      await changeBalance(1, newBalance);
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future sessionEndReset() async {
    await masterPTB.update({'deposit': 0, 'withdraw': 0}).eq("id", 1);
  }
  //
}
