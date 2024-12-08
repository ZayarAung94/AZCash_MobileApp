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

  Future<List<ClientModel>?> getClient() async {
    try {
      late PostgrestList result;

      if (AppData.user!.role == "Master") {
        result = await _clientTB.select().order('last_transition');
      } else {
        result = await _clientTB.select().eq('agent_code', AppData.user!.agentCode).order('last_transition');
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
}
