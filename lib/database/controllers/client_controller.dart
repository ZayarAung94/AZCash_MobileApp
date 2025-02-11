import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientController {
  final _clientTB = Supabase.instance.client.from('clients');

  Future<void> addClient(ClientModel client) async {
    try {
      await _clientTB.insert(client.toJson());
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<List<ClientModel>?> getClients() async {
    try {
      final result = AppData.user!.role == "Master"
          ? await _clientTB.select().order('joint_at')
          : await _clientTB.select().eq('agent', AppData.user!.id).order('joint_at');

      return result.map((json) => ClientModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
    return null;
  }

  Future<ClientModel?> getClientWithId(String id) async {
    try {
      final result = await _clientTB.select().eq('id', id).single();
      return ClientModel.fromJson(result);
    } on PostgrestException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  Future<List<ClientModel>> getClientsWithCredit() async {
    final result = await _clientTB.select().neq("credit", 0).order('last_credit');
    return result.map((json) => ClientModel.fromJson(json)).toList();
  }
}
