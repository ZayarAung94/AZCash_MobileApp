import 'package:az_cash/database/models/payment.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentController {
  final _payment = Supabase.instance.client.from('payments');

  Stream<List<PaymentModel>> getActivePayments() {
    final result = _payment.stream(primaryKey: ['id']).eq('agent_id', AppData.user!.id).map((value) {
          return value.map((e) {
            return PaymentModel.fromJson(e);
          }).toList();
        });

    return result;
  }

  Future getOwnPayments() async {
    final results = await _payment.select().eq('agent', AppData.user!.id);

    List<PaymentModel> result = results.map((json) {
      return PaymentModel.fromJson(json);
    }).toList();

    return result;
  }
}
