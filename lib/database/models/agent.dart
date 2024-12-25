class AgentModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final int deposit;
  final int withdraw;
  final DateTime createdAt;

  AgentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.role = "Agent",
    this.deposit = 0,
    this.withdraw = 0,
    DateTime? createdAt,
  }) : createdAt = DateTime.now();

  // Factory constructor to create an AgentModel from a JSON map
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      deposit: json['deposit'] as int,
      withdraw: json['withdraw'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  // Method to convert the AgentModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'deposit': deposit,
      'withdraw': withdraw,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'AgentModel(id: $id, name: $name, email: $email, phone: $phone, role: $role, deposit: $deposit, withdraw: $withdraw, createdAt: $createdAt)';
  }
}
