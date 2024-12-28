class AgentModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;

  final DateTime createdAt;

  AgentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.role = "Agent",
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
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'AgentModel(id: $id, name: $name, email: $email, phone: $phone, role: $role, , createdAt: $createdAt)';
  }
}
