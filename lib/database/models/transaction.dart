class Transaction {
  final int id;
  final String clientId;
  String clientName;
  String agent; // UUID as String
  final double amount;
  double creditAmount;
  double promotionAmount;
  final String type;
  int paymentId;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.clientId,
    this.clientName = "N/A",
    required this.agent,
    required this.amount,
    this.creditAmount = 0,
    this.promotionAmount = 0,
    required this.type,
    this.paymentId = 0,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Factory constructor to create a TransactionModel from a JSON map
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      clientId: json['client_id'] as String,
      clientName: json['client_name'] as String,
      agent: json['agent'] as String,
      amount: json['amount'].toDouble(),
      creditAmount: json['credit_amount'].toDouble(),
      promotionAmount: json['promotion_amount'].toDouble(),
      type: json['type'] as String,
      paymentId: json['payment_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  // Method to convert the TransactionModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'client_name': clientName,
      'agent': agent,
      'amount': amount,
      'credit_amount': creditAmount,
      'promotion_amount': promotionAmount,
      'type': type,
      'payment_id': paymentId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'TransactionModel(id: $id, clientId: $clientId, clientName: $clientName, agent: $agent, amount: $amount, creditAmount: $creditAmount, promotionAmount: $promotionAmount, type: $type, createdAt: $createdAt)';
  }
}
