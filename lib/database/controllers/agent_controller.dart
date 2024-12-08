import 'package:az_cash/database/models/agent.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../ui/helper/snack.dart';

class AgentController {
  final _agentTB = Supabase.instance.client.from('users');

  Future<List<AgentModel>?> getAgents() async {
    try {
      final result = await _agentTB.select().eq('role', "Agent").order('created');

      List<AgentModel> clients = [];
      for (var json in result) {
        AgentModel client = AgentModel.fromJson(json);
        clients.add(client);
      }

      return clients;
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
    return null;
  }
}
