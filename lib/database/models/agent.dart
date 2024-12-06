class AgentModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? role; // Nullable role
  final String? agentCode; // Nullable agentCode
  final DateTime created; // Creation timestamp

  AgentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.role,
    this.agentCode,
    required this.created,
  });

  // Factory constructor to create an AgentModel from JSON
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      agentCode: json['agentCode'],
      created: DateTime.parse(json['created']),
    );
  }

  // Method to convert AgentModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'agentCode': agentCode,
      'created': created.toIso8601String(),
    };
  }
}
