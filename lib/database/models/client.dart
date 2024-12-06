class ClientModel {
  final int id;
  final String name;
  final String phone;
  final String agentCode;
  final DateTime jointDate;
  final DateTime lastTransition;
  final int totalCredit;
  final DateTime lastCredit;
  final int totalPromotion;
  final int promotionTimes;

  ClientModel({
    required this.id,
    required this.name,
    required this.phone,
    this.agentCode = "",
    DateTime? jointDate,
    DateTime? lastTransition,
    this.totalCredit = 0,
    DateTime? lastCredit,
    this.totalPromotion = 0,
    this.promotionTimes = 0,
  })  : jointDate = jointDate ?? DateTime.now(),
        lastTransition = lastTransition ?? DateTime.now(),
        lastCredit = lastCredit ?? DateTime.now();

  // Factory constructor for creating a UserModel from JSON
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      jointDate: DateTime.parse(json['joint_date']),
      lastTransition: DateTime.parse(json['last_transition']),
      totalCredit: json['total_credit'],
      lastCredit: DateTime.parse(json['last_credit']),
      totalPromotion: json['total_promotion'],
      promotionTimes: json['promotion_times'],
    );
  }

  // Method to convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'joint_date': jointDate.toIso8601String(),
      'last_transition': lastTransition.toIso8601String(),
      'total_credit': totalCredit,
      'last_credit': lastCredit.toIso8601String(),
      'total_promotion': totalPromotion,
      'promotion_times': promotionTimes,
    };
  }
}
