import 'package:az_cash/database/models/agent.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../ui/helper/snack.dart';

class AgentController {
  final _agentTB = Supabase.instance.client.from('agents');

  Future<List<AgentModel>?> getAgents() async {
    try {
      final result = await _agentTB.select().eq('role', "Agent").order('created_at');

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

  Stream getAgentById(String id) {
    return _agentTB.stream(primaryKey: ['id']).eq('id', id).map((e) {
          return e.map((json) {
            return AgentModel.fromJson(json);
          }).toList();
        });
  }
}
