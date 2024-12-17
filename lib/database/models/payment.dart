class Payment {
  int id;
  String agentId;
  String agentName;
  String agentPhone;
  int deposit;
  int withdraw;
  double depoCommission;
  double wdCommission;
  int payout;
  String status;

  Payment({
    required this.id,
    required this.agentId,
    required this.agentName,
    required this.agentPhone,
    this.deposit = 0,
    this.withdraw = 0,
    this.depoCommission = 0,
    this.wdCommission = 0,
    this.payout = 0,
    this.status = "active",
  });

  // Factory method to create a Payment instance from a JSON object
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      agentId: json['agent_id'],
      agentName: json['agent_name'],
      agentPhone: json['agent_phone'],
      deposit: json['deposit'],
      withdraw: json['withdraw'],
      depoCommission: json['depo_commission'].toDouble(),
      wdCommission: json['wd_commission'].toDouble(),
      payout: json['payout'],
      status: json['status'],
    );
  }

  // Method to convert a Payment instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent_id': agentId,
      'agent_name': agentName,
      'agent_phone': agentPhone,
      'deposit': deposit,
      'withdraw': withdraw,
      'depo_commission': depoCommission,
      'wd_commission': wdCommission,
      'payout': payout,
      'status': status,
    };
  }
}
