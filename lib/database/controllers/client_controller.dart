import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientController {
  final _clientTB = Supabase.instance.client.from('clients');

  Future addClient(ClientModel client) async {
    try {
      await _clientTB.insert(client.toJson());
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Future<List<ClientModel>?> getClients() async {
    try {
      late PostgrestList result;

      if (AppData.user!.role == "Master") {
        result = await _clientTB.select().order('joint_at');
      } else {
        result = await _clientTB.select().eq('agent', AppData.user!.id).order('joint_at');
      }
      List<ClientModel> clients = [];
      for (var json in result) {
        ClientModel client = ClientModel.fromJson(json);
        clients.add(client);
      }

      return clients;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
    return null;
  }

  Future<ClientModel?> getClientWithId(String id) async {
    try {
      final result = await _clientTB.select().eq('id', id).single();

      ClientModel client = ClientModel.fromJson(result);
      return client;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
      return null;
    }
  }
}
