import 'package:az_cash/database/controllers/agent_controller.dart';
import 'package:az_cash/database/controllers/master_profile_controller.dart';
import 'package:az_cash/database/models/agent.dart';
import 'package:az_cash/database/models/payment.dart';
import 'package:az_cash/database/models/transaction.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/app_helper.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/master_profile.dart';

class PaymentController {
  final _payment = Supabase.instance.client.from('payments');

  Future add(PaymentModel payment) async {
    try {
      await _payment.insert(payment.toJson());
    } on PostgrestException catch (e) {
      AppMessage.error(e.message);
    }
  }

  Stream<List<PaymentModel>> getActivePayment() {
    final result = _payment.stream(primaryKey: ['id']).eq('id', AppData.activePaymentId).map((value) {
          return value.map((e) {
            return PaymentModel.fromJson(e);
          }).toList();
        });

    return result;
  }

  Future getActivePayments() async {
    String now = DateTime.now().toIso8601String();
    final result = await _payment.select().lte('session_start', now).gte('session_end', now);

    return result.map((json) {
      return PaymentModel.fromJson(json);
    }).toList();
  }

  Future<List<PaymentModel>> getOwnPayments() async {
    final results = await _payment.select().eq('agent_id', AppData.user!.id).order('created_at').limit(12);

    List<PaymentModel> result = results.map((json) {
      return PaymentModel.fromJson(json);
    }).toList();

    return result;
  }

  Future<List<PaymentModel>> getPaymentsById(String id) async {
    final results = await _payment.select().eq('agent_id', id).order('created_at').limit(12);
    List<PaymentModel> result = results.map((json) {
      return PaymentModel.fromJson(json);
    }).toList();

    return result;
  }

  Future<PaymentModel?> getActivePaymentOfAgent(String id) async {
    final now = DateTime.now().toIso8601String();
    try {
      final result =
          await _payment.select().eq("agent_id", id).lte('session_start', now).gte('session_end', now).single();
      PaymentModel payment = PaymentModel.fromJson(result);

      return payment;
    } catch (e) {
      return null;
    }
  }

  // Check Session and Create Payout
  Future<int> checkAndAddPayment(Transaction order) async {
    PaymentModel? agentPayment = await getActivePaymentOfAgent(order.agent);

    if (agentPayment == null) {
      final now = DateTime.now();
      final sessionStart = DateTime(now.year, now.month, 1);
      final sessionEnd = DateTime(now.year, now.month + 1, 1);
      String agentName = await AgentController().getAgentNameById(order.agent);

      PaymentModel newPayment = PaymentModel(
        id: AppHelper.generateUniqueId(),
        agentId: order.agent,
        agentName: agentName,
        sessionStart: sessionStart,
        sessionEnd: sessionEnd,
        deposit: 0,
        withdraw: 0,
        payout: 0,
        createdAt: now,
      );

      if (order.agent == AppData.user!.id) {
        MasterProfile master = await MasterProfileController().get(1);
        await sessionEndMasterUpdate(master);
        await MasterProfileController().sessionEndReset();
      }
      await add(newPayment);
      return newPayment.id;
    } else {
      return agentPayment.id;
    }
  }

  Future masterAgentUpdate(MasterProfile master) async {
    await _payment.update({'deposit': master.deposit, 'withdraw': master.withdraw}).eq("id", AppData.activePaymentId);
  }

  Future sessionEndMasterUpdate(MasterProfile master) async {
    final masters = await AgentController().getMasterAgents();
    DateTime now = DateTime.now();
    DateTime endTime = DateTime(now.year, now.month, 1);
    String endIso = endTime.toIso8601String();

    if (masters.isNotEmpty) {
      for (AgentModel agent in masters) {
        await _payment
            .update({'deposit': master.deposit, 'withdraw': master.withdraw})
            .eq("agent_id", agent.id)
            .eq('session_end', endIso);
      }
    }
  }

  Future payout(int id, double amount) async {
    await _payment.update({"payout": amount.toInt()}).eq('id', id);
  }

//
}
