class PaymentModel {
  final String id;
  final String agentCode;
  final String status;
  final int deposit;
  final int withdraw;
  final double depoComm;
  final double wdComm;
  final int credit;
  final int realPayout;
  final DateTime createdAt;

  PaymentModel({
    required this.id,
    required this.agentCode,
    this.status = "Active Session",
    this.deposit = 0,
    this.withdraw = 0,
    this.depoComm = 1.5,
    this.wdComm = 1,
    this.credit = 0,
    this.realPayout = 0,
    required this.createdAt,
  });

  // Factory constructor to create a PaymentModel from a JSON map
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      agentCode: json['agent_code'],
      status: json['status'],
      deposit: json['deposit'],
      withdraw: json['withdraw'],
      depoComm: json['depo_comm'].toDouble(),
      wdComm: json['wd_comm'].toDouble(),
      credit: json['credit'],
      realPayout: json['real_payout'],
      createdAt: json['created_at'],
    );
  }

  // Method to convert a PaymentModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agent_code': agentCode,
      'status': status,
      'deposit': deposit,
      'withdraw': withdraw,
      'depo_comm': depoComm,
      'wd_comm': wdComm,
      'credit': credit,
      'real_payout': realPayout,
      'created_at': createdAt,
    };
  }
}
