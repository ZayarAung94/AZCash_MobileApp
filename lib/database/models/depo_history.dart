class DepoHistory {
  final int id;
  final int amount;
  double beforeLimit;
  final double afterLimit;
  final String type;
  final DateTime createdAt;

  DepoHistory({
    required this.id,
    required this.amount,
    required this.beforeLimit,
    required this.afterLimit,
    this.type = "deposit",
    required this.createdAt,
  });

  // Factory method to create an instance from a JSON map
  factory DepoHistory.fromJson(Map<String, dynamic> json) {
    return DepoHistory(
      id: json['id'],
      amount: json['amount'],
      beforeLimit: json['before_limit'].toDouble(),
      afterLimit: json['after_limit'].toDouble(),
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'before_limit': beforeLimit,
      'amount': amount,
      'after_limit': afterLimit,
      'type': type,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
