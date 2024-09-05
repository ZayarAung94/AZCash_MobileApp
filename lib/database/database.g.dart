// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCreditMeta =
      const VerificationMeta('isCredit');
  @override
  late final GeneratedColumn<bool> isCredit = GeneratedColumn<bool>(
      'is_credit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_credit" IN (0, 1))'));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, amount, type, code, status, isCredit, created];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_credit')) {
      context.handle(_isCreditMeta,
          isCredit.isAcceptableOrUnknown(data['is_credit']!, _isCreditMeta));
    } else if (isInserting) {
      context.missing(_isCreditMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      isCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_credit'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String userId;
  final int amount;
  final String type;
  final String code;
  final String status;
  final bool isCredit;
  final DateTime created;
  const Order(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.type,
      required this.code,
      required this.status,
      required this.isCredit,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['amount'] = Variable<int>(amount);
    map['type'] = Variable<String>(type);
    map['code'] = Variable<String>(code);
    map['status'] = Variable<String>(status);
    map['is_credit'] = Variable<bool>(isCredit);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      userId: Value(userId),
      amount: Value(amount),
      type: Value(type),
      code: Value(code),
      status: Value(status),
      isCredit: Value(isCredit),
      created: Value(created),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      amount: serializer.fromJson<int>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      code: serializer.fromJson<String>(json['code']),
      status: serializer.fromJson<String>(json['status']),
      isCredit: serializer.fromJson<bool>(json['isCredit']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'amount': serializer.toJson<int>(amount),
      'type': serializer.toJson<String>(type),
      'code': serializer.toJson<String>(code),
      'status': serializer.toJson<String>(status),
      'isCredit': serializer.toJson<bool>(isCredit),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  Order copyWith(
          {int? id,
          String? userId,
          int? amount,
          String? type,
          String? code,
          String? status,
          bool? isCredit,
          DateTime? created}) =>
      Order(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        code: code ?? this.code,
        status: status ?? this.status,
        isCredit: isCredit ?? this.isCredit,
        created: created ?? this.created,
      );
  Order copyWithCompanion(OrdersCompanion data) {
    return Order(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      code: data.code.present ? data.code.value : this.code,
      status: data.status.present ? data.status.value : this.status,
      isCredit: data.isCredit.present ? data.isCredit.value : this.isCredit,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('isCredit: $isCredit, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, amount, type, code, status, isCredit, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.code == this.code &&
          other.status == this.status &&
          other.isCredit == this.isCredit &&
          other.created == this.created);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> amount;
  final Value<String> type;
  final Value<String> code;
  final Value<String> status;
  final Value<bool> isCredit;
  final Value<DateTime> created;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.isCredit = const Value.absent(),
    this.created = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int amount,
    required String type,
    required String code,
    required String status,
    required bool isCredit,
    required DateTime created,
  })  : userId = Value(userId),
        amount = Value(amount),
        type = Value(type),
        code = Value(code),
        status = Value(status),
        isCredit = Value(isCredit),
        created = Value(created);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? amount,
    Expression<String>? type,
    Expression<String>? code,
    Expression<String>? status,
    Expression<bool>? isCredit,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (isCredit != null) 'is_credit': isCredit,
      if (created != null) 'created': created,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? amount,
      Value<String>? type,
      Value<String>? code,
      Value<String>? status,
      Value<bool>? isCredit,
      Value<DateTime>? created}) {
    return OrdersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      code: code ?? this.code,
      status: status ?? this.status,
      isCredit: isCredit ?? this.isCredit,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isCredit.present) {
      map['is_credit'] = Variable<bool>(isCredit.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('isCredit: $isCredit, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _depositMeta =
      const VerificationMeta('deposit');
  @override
  late final GeneratedColumn<int> deposit = GeneratedColumn<int>(
      'deposit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _withdrawMeta =
      const VerificationMeta('withdraw');
  @override
  late final GeneratedColumn<int> withdraw = GeneratedColumn<int>(
      'withdraw', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _depositPerMeta =
      const VerificationMeta('depositPer');
  @override
  late final GeneratedColumn<int> depositPer = GeneratedColumn<int>(
      'deposit_per', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _withdrawPerMeta =
      const VerificationMeta('withdrawPer');
  @override
  late final GeneratedColumn<int> withdrawPer = GeneratedColumn<int>(
      'withdraw_per', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commissionDMeta =
      const VerificationMeta('commissionD');
  @override
  late final GeneratedColumn<int> commissionD = GeneratedColumn<int>(
      'commission_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _commissionWMeta =
      const VerificationMeta('commissionW');
  @override
  late final GeneratedColumn<int> commissionW = GeneratedColumn<int>(
      'commission_w', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<int> credit = GeneratedColumn<int>(
      'credit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _creditCarryoverMeta =
      const VerificationMeta('creditCarryover');
  @override
  late final GeneratedColumn<int> creditCarryover = GeneratedColumn<int>(
      'credit_carryover', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _payoutMeta = const VerificationMeta('payout');
  @override
  late final GeneratedColumn<int> payout = GeneratedColumn<int>(
      'payout', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _realPayoutMeta =
      const VerificationMeta('realPayout');
  @override
  late final GeneratedColumn<int> realPayout = GeneratedColumn<int>(
      'real_payout', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _overallCommissionMeta =
      const VerificationMeta('overallCommission');
  @override
  late final GeneratedColumn<int> overallCommission = GeneratedColumn<int>(
      'overall_commission', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        deposit,
        withdraw,
        depositPer,
        withdrawPer,
        commissionD,
        commissionW,
        credit,
        creditCarryover,
        payout,
        realPayout,
        overallCommission,
        created
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(Insertable<Payment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta));
    } else if (isInserting) {
      context.missing(_depositMeta);
    }
    if (data.containsKey('withdraw')) {
      context.handle(_withdrawMeta,
          withdraw.isAcceptableOrUnknown(data['withdraw']!, _withdrawMeta));
    } else if (isInserting) {
      context.missing(_withdrawMeta);
    }
    if (data.containsKey('deposit_per')) {
      context.handle(
          _depositPerMeta,
          depositPer.isAcceptableOrUnknown(
              data['deposit_per']!, _depositPerMeta));
    } else if (isInserting) {
      context.missing(_depositPerMeta);
    }
    if (data.containsKey('withdraw_per')) {
      context.handle(
          _withdrawPerMeta,
          withdrawPer.isAcceptableOrUnknown(
              data['withdraw_per']!, _withdrawPerMeta));
    } else if (isInserting) {
      context.missing(_withdrawPerMeta);
    }
    if (data.containsKey('commission_d')) {
      context.handle(
          _commissionDMeta,
          commissionD.isAcceptableOrUnknown(
              data['commission_d']!, _commissionDMeta));
    }
    if (data.containsKey('commission_w')) {
      context.handle(
          _commissionWMeta,
          commissionW.isAcceptableOrUnknown(
              data['commission_w']!, _commissionWMeta));
    }
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    }
    if (data.containsKey('credit_carryover')) {
      context.handle(
          _creditCarryoverMeta,
          creditCarryover.isAcceptableOrUnknown(
              data['credit_carryover']!, _creditCarryoverMeta));
    }
    if (data.containsKey('payout')) {
      context.handle(_payoutMeta,
          payout.isAcceptableOrUnknown(data['payout']!, _payoutMeta));
    }
    if (data.containsKey('real_payout')) {
      context.handle(
          _realPayoutMeta,
          realPayout.isAcceptableOrUnknown(
              data['real_payout']!, _realPayoutMeta));
    }
    if (data.containsKey('overall_commission')) {
      context.handle(
          _overallCommissionMeta,
          overallCommission.isAcceptableOrUnknown(
              data['overall_commission']!, _overallCommissionMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deposit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deposit'])!,
      withdraw: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}withdraw'])!,
      depositPer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deposit_per'])!,
      withdrawPer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}withdraw_per'])!,
      commissionD: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}commission_d'])!,
      commissionW: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}commission_w'])!,
      credit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit'])!,
      creditCarryover: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit_carryover'])!,
      payout: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payout'])!,
      realPayout: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}real_payout'])!,
      overallCommission: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}overall_commission'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final int deposit;
  final int withdraw;
  final int depositPer;
  final int withdrawPer;
  final int commissionD;
  final int commissionW;
  final int credit;
  final int creditCarryover;
  final int payout;
  final int realPayout;
  final int overallCommission;
  final DateTime created;
  const Payment(
      {required this.id,
      required this.deposit,
      required this.withdraw,
      required this.depositPer,
      required this.withdrawPer,
      required this.commissionD,
      required this.commissionW,
      required this.credit,
      required this.creditCarryover,
      required this.payout,
      required this.realPayout,
      required this.overallCommission,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deposit'] = Variable<int>(deposit);
    map['withdraw'] = Variable<int>(withdraw);
    map['deposit_per'] = Variable<int>(depositPer);
    map['withdraw_per'] = Variable<int>(withdrawPer);
    map['commission_d'] = Variable<int>(commissionD);
    map['commission_w'] = Variable<int>(commissionW);
    map['credit'] = Variable<int>(credit);
    map['credit_carryover'] = Variable<int>(creditCarryover);
    map['payout'] = Variable<int>(payout);
    map['real_payout'] = Variable<int>(realPayout);
    map['overall_commission'] = Variable<int>(overallCommission);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      deposit: Value(deposit),
      withdraw: Value(withdraw),
      depositPer: Value(depositPer),
      withdrawPer: Value(withdrawPer),
      commissionD: Value(commissionD),
      commissionW: Value(commissionW),
      credit: Value(credit),
      creditCarryover: Value(creditCarryover),
      payout: Value(payout),
      realPayout: Value(realPayout),
      overallCommission: Value(overallCommission),
      created: Value(created),
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      deposit: serializer.fromJson<int>(json['deposit']),
      withdraw: serializer.fromJson<int>(json['withdraw']),
      depositPer: serializer.fromJson<int>(json['depositPer']),
      withdrawPer: serializer.fromJson<int>(json['withdrawPer']),
      commissionD: serializer.fromJson<int>(json['commissionD']),
      commissionW: serializer.fromJson<int>(json['commissionW']),
      credit: serializer.fromJson<int>(json['credit']),
      creditCarryover: serializer.fromJson<int>(json['creditCarryover']),
      payout: serializer.fromJson<int>(json['payout']),
      realPayout: serializer.fromJson<int>(json['realPayout']),
      overallCommission: serializer.fromJson<int>(json['overallCommission']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deposit': serializer.toJson<int>(deposit),
      'withdraw': serializer.toJson<int>(withdraw),
      'depositPer': serializer.toJson<int>(depositPer),
      'withdrawPer': serializer.toJson<int>(withdrawPer),
      'commissionD': serializer.toJson<int>(commissionD),
      'commissionW': serializer.toJson<int>(commissionW),
      'credit': serializer.toJson<int>(credit),
      'creditCarryover': serializer.toJson<int>(creditCarryover),
      'payout': serializer.toJson<int>(payout),
      'realPayout': serializer.toJson<int>(realPayout),
      'overallCommission': serializer.toJson<int>(overallCommission),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  Payment copyWith(
          {int? id,
          int? deposit,
          int? withdraw,
          int? depositPer,
          int? withdrawPer,
          int? commissionD,
          int? commissionW,
          int? credit,
          int? creditCarryover,
          int? payout,
          int? realPayout,
          int? overallCommission,
          DateTime? created}) =>
      Payment(
        id: id ?? this.id,
        deposit: deposit ?? this.deposit,
        withdraw: withdraw ?? this.withdraw,
        depositPer: depositPer ?? this.depositPer,
        withdrawPer: withdrawPer ?? this.withdrawPer,
        commissionD: commissionD ?? this.commissionD,
        commissionW: commissionW ?? this.commissionW,
        credit: credit ?? this.credit,
        creditCarryover: creditCarryover ?? this.creditCarryover,
        payout: payout ?? this.payout,
        realPayout: realPayout ?? this.realPayout,
        overallCommission: overallCommission ?? this.overallCommission,
        created: created ?? this.created,
      );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      deposit: data.deposit.present ? data.deposit.value : this.deposit,
      withdraw: data.withdraw.present ? data.withdraw.value : this.withdraw,
      depositPer:
          data.depositPer.present ? data.depositPer.value : this.depositPer,
      withdrawPer:
          data.withdrawPer.present ? data.withdrawPer.value : this.withdrawPer,
      commissionD:
          data.commissionD.present ? data.commissionD.value : this.commissionD,
      commissionW:
          data.commissionW.present ? data.commissionW.value : this.commissionW,
      credit: data.credit.present ? data.credit.value : this.credit,
      creditCarryover: data.creditCarryover.present
          ? data.creditCarryover.value
          : this.creditCarryover,
      payout: data.payout.present ? data.payout.value : this.payout,
      realPayout:
          data.realPayout.present ? data.realPayout.value : this.realPayout,
      overallCommission: data.overallCommission.present
          ? data.overallCommission.value
          : this.overallCommission,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('deposit: $deposit, ')
          ..write('withdraw: $withdraw, ')
          ..write('depositPer: $depositPer, ')
          ..write('withdrawPer: $withdrawPer, ')
          ..write('commissionD: $commissionD, ')
          ..write('commissionW: $commissionW, ')
          ..write('credit: $credit, ')
          ..write('creditCarryover: $creditCarryover, ')
          ..write('payout: $payout, ')
          ..write('realPayout: $realPayout, ')
          ..write('overallCommission: $overallCommission, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      deposit,
      withdraw,
      depositPer,
      withdrawPer,
      commissionD,
      commissionW,
      credit,
      creditCarryover,
      payout,
      realPayout,
      overallCommission,
      created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.deposit == this.deposit &&
          other.withdraw == this.withdraw &&
          other.depositPer == this.depositPer &&
          other.withdrawPer == this.withdrawPer &&
          other.commissionD == this.commissionD &&
          other.commissionW == this.commissionW &&
          other.credit == this.credit &&
          other.creditCarryover == this.creditCarryover &&
          other.payout == this.payout &&
          other.realPayout == this.realPayout &&
          other.overallCommission == this.overallCommission &&
          other.created == this.created);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<int> deposit;
  final Value<int> withdraw;
  final Value<int> depositPer;
  final Value<int> withdrawPer;
  final Value<int> commissionD;
  final Value<int> commissionW;
  final Value<int> credit;
  final Value<int> creditCarryover;
  final Value<int> payout;
  final Value<int> realPayout;
  final Value<int> overallCommission;
  final Value<DateTime> created;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.deposit = const Value.absent(),
    this.withdraw = const Value.absent(),
    this.depositPer = const Value.absent(),
    this.withdrawPer = const Value.absent(),
    this.commissionD = const Value.absent(),
    this.commissionW = const Value.absent(),
    this.credit = const Value.absent(),
    this.creditCarryover = const Value.absent(),
    this.payout = const Value.absent(),
    this.realPayout = const Value.absent(),
    this.overallCommission = const Value.absent(),
    this.created = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int deposit,
    required int withdraw,
    required int depositPer,
    required int withdrawPer,
    this.commissionD = const Value.absent(),
    this.commissionW = const Value.absent(),
    this.credit = const Value.absent(),
    this.creditCarryover = const Value.absent(),
    this.payout = const Value.absent(),
    this.realPayout = const Value.absent(),
    this.overallCommission = const Value.absent(),
    this.created = const Value.absent(),
  })  : deposit = Value(deposit),
        withdraw = Value(withdraw),
        depositPer = Value(depositPer),
        withdrawPer = Value(withdrawPer);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<int>? deposit,
    Expression<int>? withdraw,
    Expression<int>? depositPer,
    Expression<int>? withdrawPer,
    Expression<int>? commissionD,
    Expression<int>? commissionW,
    Expression<int>? credit,
    Expression<int>? creditCarryover,
    Expression<int>? payout,
    Expression<int>? realPayout,
    Expression<int>? overallCommission,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deposit != null) 'deposit': deposit,
      if (withdraw != null) 'withdraw': withdraw,
      if (depositPer != null) 'deposit_per': depositPer,
      if (withdrawPer != null) 'withdraw_per': withdrawPer,
      if (commissionD != null) 'commission_d': commissionD,
      if (commissionW != null) 'commission_w': commissionW,
      if (credit != null) 'credit': credit,
      if (creditCarryover != null) 'credit_carryover': creditCarryover,
      if (payout != null) 'payout': payout,
      if (realPayout != null) 'real_payout': realPayout,
      if (overallCommission != null) 'overall_commission': overallCommission,
      if (created != null) 'created': created,
    });
  }

  PaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? deposit,
      Value<int>? withdraw,
      Value<int>? depositPer,
      Value<int>? withdrawPer,
      Value<int>? commissionD,
      Value<int>? commissionW,
      Value<int>? credit,
      Value<int>? creditCarryover,
      Value<int>? payout,
      Value<int>? realPayout,
      Value<int>? overallCommission,
      Value<DateTime>? created}) {
    return PaymentsCompanion(
      id: id ?? this.id,
      deposit: deposit ?? this.deposit,
      withdraw: withdraw ?? this.withdraw,
      depositPer: depositPer ?? this.depositPer,
      withdrawPer: withdrawPer ?? this.withdrawPer,
      commissionD: commissionD ?? this.commissionD,
      commissionW: commissionW ?? this.commissionW,
      credit: credit ?? this.credit,
      creditCarryover: creditCarryover ?? this.creditCarryover,
      payout: payout ?? this.payout,
      realPayout: realPayout ?? this.realPayout,
      overallCommission: overallCommission ?? this.overallCommission,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<int>(deposit.value);
    }
    if (withdraw.present) {
      map['withdraw'] = Variable<int>(withdraw.value);
    }
    if (depositPer.present) {
      map['deposit_per'] = Variable<int>(depositPer.value);
    }
    if (withdrawPer.present) {
      map['withdraw_per'] = Variable<int>(withdrawPer.value);
    }
    if (commissionD.present) {
      map['commission_d'] = Variable<int>(commissionD.value);
    }
    if (commissionW.present) {
      map['commission_w'] = Variable<int>(commissionW.value);
    }
    if (credit.present) {
      map['credit'] = Variable<int>(credit.value);
    }
    if (creditCarryover.present) {
      map['credit_carryover'] = Variable<int>(creditCarryover.value);
    }
    if (payout.present) {
      map['payout'] = Variable<int>(payout.value);
    }
    if (realPayout.present) {
      map['real_payout'] = Variable<int>(realPayout.value);
    }
    if (overallCommission.present) {
      map['overall_commission'] = Variable<int>(overallCommission.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('deposit: $deposit, ')
          ..write('withdraw: $withdraw, ')
          ..write('depositPer: $depositPer, ')
          ..write('withdrawPer: $withdrawPer, ')
          ..write('commissionD: $commissionD, ')
          ..write('commissionW: $commissionW, ')
          ..write('credit: $credit, ')
          ..write('creditCarryover: $creditCarryover, ')
          ..write('payout: $payout, ')
          ..write('realPayout: $realPayout, ')
          ..write('overallCommission: $overallCommission, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders, payments];
}

typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  required String userId,
  required int amount,
  required String type,
  required String code,
  required String status,
  required bool isCredit,
  required DateTime created,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> amount,
  Value<String> type,
  Value<String> code,
  Value<String> status,
  Value<bool> isCredit,
  Value<DateTime> created,
});

class $$OrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder> {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrdersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrdersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> isCredit = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            userId: userId,
            amount: amount,
            type: type,
            code: code,
            status: status,
            isCredit: isCredit,
            created: created,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int amount,
            required String type,
            required String code,
            required String status,
            required bool isCredit,
            required DateTime created,
          }) =>
              OrdersCompanion.insert(
            id: id,
            userId: userId,
            amount: amount,
            type: type,
            code: code,
            status: status,
            isCredit: isCredit,
            created: created,
          ),
        ));
}

class $$OrdersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCredit => $state.composableBuilder(
      column: $state.table.isCredit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$OrdersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCredit => $state.composableBuilder(
      column: $state.table.isCredit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PaymentsTableCreateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  required int deposit,
  required int withdraw,
  required int depositPer,
  required int withdrawPer,
  Value<int> commissionD,
  Value<int> commissionW,
  Value<int> credit,
  Value<int> creditCarryover,
  Value<int> payout,
  Value<int> realPayout,
  Value<int> overallCommission,
  Value<DateTime> created,
});
typedef $$PaymentsTableUpdateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  Value<int> deposit,
  Value<int> withdraw,
  Value<int> depositPer,
  Value<int> withdrawPer,
  Value<int> commissionD,
  Value<int> commissionW,
  Value<int> credit,
  Value<int> creditCarryover,
  Value<int> payout,
  Value<int> realPayout,
  Value<int> overallCommission,
  Value<DateTime> created,
});

class $$PaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentsTable,
    Payment,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder> {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PaymentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PaymentsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> deposit = const Value.absent(),
            Value<int> withdraw = const Value.absent(),
            Value<int> depositPer = const Value.absent(),
            Value<int> withdrawPer = const Value.absent(),
            Value<int> commissionD = const Value.absent(),
            Value<int> commissionW = const Value.absent(),
            Value<int> credit = const Value.absent(),
            Value<int> creditCarryover = const Value.absent(),
            Value<int> payout = const Value.absent(),
            Value<int> realPayout = const Value.absent(),
            Value<int> overallCommission = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
          }) =>
              PaymentsCompanion(
            id: id,
            deposit: deposit,
            withdraw: withdraw,
            depositPer: depositPer,
            withdrawPer: withdrawPer,
            commissionD: commissionD,
            commissionW: commissionW,
            credit: credit,
            creditCarryover: creditCarryover,
            payout: payout,
            realPayout: realPayout,
            overallCommission: overallCommission,
            created: created,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int deposit,
            required int withdraw,
            required int depositPer,
            required int withdrawPer,
            Value<int> commissionD = const Value.absent(),
            Value<int> commissionW = const Value.absent(),
            Value<int> credit = const Value.absent(),
            Value<int> creditCarryover = const Value.absent(),
            Value<int> payout = const Value.absent(),
            Value<int> realPayout = const Value.absent(),
            Value<int> overallCommission = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
          }) =>
              PaymentsCompanion.insert(
            id: id,
            deposit: deposit,
            withdraw: withdraw,
            depositPer: depositPer,
            withdrawPer: withdrawPer,
            commissionD: commissionD,
            commissionW: commissionW,
            credit: credit,
            creditCarryover: creditCarryover,
            payout: payout,
            realPayout: realPayout,
            overallCommission: overallCommission,
            created: created,
          ),
        ));
}

class $$PaymentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get deposit => $state.composableBuilder(
      column: $state.table.deposit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get withdraw => $state.composableBuilder(
      column: $state.table.withdraw,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get depositPer => $state.composableBuilder(
      column: $state.table.depositPer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get withdrawPer => $state.composableBuilder(
      column: $state.table.withdrawPer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get commissionD => $state.composableBuilder(
      column: $state.table.commissionD,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get commissionW => $state.composableBuilder(
      column: $state.table.commissionW,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get credit => $state.composableBuilder(
      column: $state.table.credit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creditCarryover => $state.composableBuilder(
      column: $state.table.creditCarryover,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get payout => $state.composableBuilder(
      column: $state.table.payout,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get realPayout => $state.composableBuilder(
      column: $state.table.realPayout,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get overallCommission => $state.composableBuilder(
      column: $state.table.overallCommission,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PaymentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get deposit => $state.composableBuilder(
      column: $state.table.deposit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get withdraw => $state.composableBuilder(
      column: $state.table.withdraw,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get depositPer => $state.composableBuilder(
      column: $state.table.depositPer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get withdrawPer => $state.composableBuilder(
      column: $state.table.withdrawPer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get commissionD => $state.composableBuilder(
      column: $state.table.commissionD,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get commissionW => $state.composableBuilder(
      column: $state.table.commissionW,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get credit => $state.composableBuilder(
      column: $state.table.credit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creditCarryover => $state.composableBuilder(
      column: $state.table.creditCarryover,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get payout => $state.composableBuilder(
      column: $state.table.payout,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get realPayout => $state.composableBuilder(
      column: $state.table.realPayout,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get overallCommission => $state.composableBuilder(
      column: $state.table.overallCommission,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
}
