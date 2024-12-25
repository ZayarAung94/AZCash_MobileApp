enum OrderType {
  deposit('Deposit'),
  withdraw("Withdraw");

  final String description;
  const OrderType(this.description);

  String get() => description;
}
