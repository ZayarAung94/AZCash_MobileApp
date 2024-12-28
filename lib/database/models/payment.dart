class PaymentModel {
  final int id;
  final String agentId; // UUID as String
  String agentName;
  final DateTime sessionStart;
  final DateTime sessionEnd;
  final int deposit;
  final int withdraw;
  final int payout;
  final double depoCom; // Deposit commission
  final double wdCom; // Withdraw commission
  final DateTime createdAt;

  PaymentModel({
    required this.id,
    required this.agentId,
    required this.agentName,
    required this.sessionStart,
    required this.sessionEnd,
    required this.deposit,
    required this.withdraw,
    required this.payout,
    required this.depoCom,
    required this.wdCom,
    required this.createdAt,
  });

  // Factory constructor to create a PaymentModel from a JSON map
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as int,
      agentId: json['agent_id'] as String,
      agentName: json['agent_name'],
      sessionStart: DateTime.parse(json['session_start'] as String),
      sessionEnd: DateTime.parse(json['session_end'] as String),
      deposit: json['deposit'] as int,
      withdraw: json['withdraw'] as int,
      payout: json['payout'] as int,
      depoCom: (json['depo_com'] as num).toDouble(),
      wdCom: (json['wd_com'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  // Method to convert the PaymentModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent_id': agentId,
      'agent_name': agentName,
      'session_start': sessionStart.toIso8601String(),
      'session_end': sessionEnd.toIso8601String(),
      'deposit': deposit,
      'withdraw': withdraw,
      'payout': payout,
      'depo_com': depoCom,
      'wd_com': wdCom,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'PaymentModel(id: $id, agentId: $agentId, sessionStart: $sessionStart, sessionEnd: $sessionEnd, deposit: $deposit, withdraw: $withdraw, payout: $payout, depoCom: $depoCom, wdCom: $wdCom, createdAt: $createdAt)';
  }
}
