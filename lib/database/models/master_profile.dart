class MasterProfile {
  final int id;
  final double balance;
  final double limit;
  final DateTime createdAt;

  MasterProfile({
    required this.id,
    required this.balance,
    required this.limit,
    required this.createdAt,
  });

  // Factory method to create an instance from a JSON map
  factory MasterProfile.fromJson(Map<String, dynamic> json) {
    return MasterProfile(
      id: json['id'],
      balance: json['balance'].toDouble(),
      limit: json['limit'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'limit': limit,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
