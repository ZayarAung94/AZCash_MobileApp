class Transaction {
  int id;
  String clientId;
  String clientName;
  String type;
  double amount;
  double credit;
  double promotion;
  String agentId;
  DateTime createdAt;

  Transaction({
    required this.id,
    required this.clientId,
    String? clientName,
    required this.type,
    required this.amount,
    this.credit = 0,
    this.promotion = 0,
    this.agentId = "",
    DateTime? createdAt,
  })  : clientName = clientName ?? "",
        createdAt = createdAt ?? DateTime.now();

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      clientId: json['client_id'],
      clientName: json['client_name'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      credit: json['credit'].toDouble(),
      promotion: json['promotion'].toDouble(),
      agentId: json["agent_id"],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "client_id": clientId,
      "client_name": clientName,
      "type": type,
      "amount": amount,
      "credit": credit,
      "promotion": promotion,
      "agent_id": agentId,
      "created_at": createdAt.toIso8601String(),
    };
  }
}
