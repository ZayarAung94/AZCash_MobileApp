class ClientModel {
  final String id;
  final String name;
  final String phone;
  final String agent; // UUID as String
  final int credit;
  final DateTime lastCredit;
  final String status;
  final DateTime jointAt;

  ClientModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.agent,
    this.credit = 0,
    DateTime? lastCredit,
    this.status = "Normal",
    DateTime? jointAt,
  })  : lastCredit = DateTime.now(),
        jointAt = DateTime.now();

  // Factory constructor to create a ClientModel from a JSON map
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      agent: json['agent'] as String,
      credit: json['credit'] as int,
      lastCredit: DateTime.parse(json['last_credit'] as String),
      status: json['status'] as String,
      jointAt: DateTime.parse(json['joint_at'] as String),
    );
  }

  // Method to convert the ClientModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'agent': agent,
      'credit': credit,
      'last_credit': lastCredit.toIso8601String(),
      'status': status,
      'joint_at': jointAt.toIso8601String(),
    };
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'ClientModel(id: $id, name: $name, phone: $phone, agent: $agent, credit: $credit, lastCredit: $lastCredit, status: $status, jointAt: $jointAt)';
  }
}
