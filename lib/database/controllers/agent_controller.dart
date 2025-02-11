import 'package:az_cash/database/models/agent.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../ui/helper/snack.dart';

class AgentController {
  final _agentTB = Supabase.instance.client.from('agents');

  Future<List<AgentModel>?> getAgents() async {
    try {
      final result = await _agentTB.select().eq('role', "Agent").order('created_at');
      return result.map((json) => AgentModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
    return null;
  }

  Stream<List<AgentModel>> getAgentById(String id) {
    return _agentTB
        .stream(primaryKey: ['id'])
        .eq('id', id)
        .map((e) => e.map((json) => AgentModel.fromJson(json)).toList());
  }

  Future<String> getAgentNameById(String id) async {
    final result = await _agentTB.select().eq("id", id).single();
    return result['name'];
  }

  Future<List<AgentModel>> getMasterAgents() async {
    final result = await _agentTB.select().eq('role', "Master");
    return result.map((json) => AgentModel.fromJson(json)).toList();
  }
}
