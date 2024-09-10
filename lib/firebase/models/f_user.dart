class FUser {
  final String name;
  final String email;
  final String phone;
  final String? device;
  final String? deviceSerie;
  final String level;
  final DateTime? expireDate;
  // credited
  //

  FUser({
    required this.name,
    required this.email,
    required this.phone,
    this.device,
    this.deviceSerie,
    this.level = "Free",
    this.expireDate,
  });

  factory FUser.fromJson(Map<String, dynamic> json) {
    return FUser(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      device: json['device'],
      deviceSerie: json['deviceSerie'],
      level: json['level'],
      expireDate: json['expireDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      'email': email,
      'phone': phone,
      'device': device,
      'deviceSerie': deviceSerie,
      'level': level,
      'expireDate': expireDate,
    };
  }
}
