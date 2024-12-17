import 'package:az_cash/database/models/payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentController {
  final _payment = Supabase.instance.client.from('payments');

  Stream<List<Payment>> getActivePayments() {
    final result = _payment.stream(primaryKey: ['id']).eq('status', 'active').map((value) {
          return value.map((e) {
            return Payment.fromJson(e);
          }).toList();
        });

    return result;
  }
}
