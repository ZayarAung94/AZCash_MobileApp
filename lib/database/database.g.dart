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
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<int> credit = GeneratedColumn<int>(
      'credit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _promotionMeta =
      const VerificationMeta('promotion');
  @override
  late final GeneratedColumn<int> promotion = GeneratedColumn<int>(
      'promotion', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _agentCodeMeta =
      const VerificationMeta('agentCode');
  @override
  late final GeneratedColumn<String> agentCode = GeneratedColumn<String>(
      'agent_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        amount,
        type,
        code,
        status,
        credit,
        promotion,
        agentCode,
        created
      ];
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
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    }
    if (data.containsKey('promotion')) {
      context.handle(_promotionMeta,
          promotion.isAcceptableOrUnknown(data['promotion']!, _promotionMeta));
    }
    if (data.containsKey('agent_code')) {
      context.handle(_agentCodeMeta,
          agentCode.isAcceptableOrUnknown(data['agent_code']!, _agentCodeMeta));
    } else if (isInserting) {
      context.missing(_agentCodeMeta);
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
      credit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit'])!,
      promotion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}promotion'])!,
      agentCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agent_code'])!,
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
  final int credit;
  final int promotion;
  final String agentCode;
  final DateTime created;
  const Order(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.type,
      required this.code,
      required this.status,
      required this.credit,
      required this.promotion,
      required this.agentCode,
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
    map['credit'] = Variable<int>(credit);
    map['promotion'] = Variable<int>(promotion);
    map['agent_code'] = Variable<String>(agentCode);
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
      credit: Value(credit),
      promotion: Value(promotion),
      agentCode: Value(agentCode),
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
      credit: serializer.fromJson<int>(json['credit']),
      promotion: serializer.fromJson<int>(json['promotion']),
      agentCode: serializer.fromJson<String>(json['agentCode']),
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
      'credit': serializer.toJson<int>(credit),
      'promotion': serializer.toJson<int>(promotion),
      'agentCode': serializer.toJson<String>(agentCode),
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
          int? credit,
          int? promotion,
          String? agentCode,
          DateTime? created}) =>
      Order(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        code: code ?? this.code,
        status: status ?? this.status,
        credit: credit ?? this.credit,
        promotion: promotion ?? this.promotion,
        agentCode: agentCode ?? this.agentCode,
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
      credit: data.credit.present ? data.credit.value : this.credit,
      promotion: data.promotion.present ? data.promotion.value : this.promotion,
      agentCode: data.agentCode.present ? data.agentCode.value : this.agentCode,
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
          ..write('credit: $credit, ')
          ..write('promotion: $promotion, ')
          ..write('agentCode: $agentCode, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, amount, type, code, status,
      credit, promotion, agentCode, created);
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
          other.credit == this.credit &&
          other.promotion == this.promotion &&
          other.agentCode == this.agentCode &&
          other.created == this.created);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> amount;
  final Value<String> type;
  final Value<String> code;
  final Value<String> status;
  final Value<int> credit;
  final Value<int> promotion;
  final Value<String> agentCode;
  final Value<DateTime> created;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.credit = const Value.absent(),
    this.promotion = const Value.absent(),
    this.agentCode = const Value.absent(),
    this.created = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int amount,
    required String type,
    required String code,
    required String status,
    this.credit = const Value.absent(),
    this.promotion = const Value.absent(),
    required String agentCode,
    required DateTime created,
  })  : userId = Value(userId),
        amount = Value(amount),
        type = Value(type),
        code = Value(code),
        status = Value(status),
        agentCode = Value(agentCode),
        created = Value(created);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? amount,
    Expression<String>? type,
    Expression<String>? code,
    Expression<String>? status,
    Expression<int>? credit,
    Expression<int>? promotion,
    Expression<String>? agentCode,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (credit != null) 'credit': credit,
      if (promotion != null) 'promotion': promotion,
      if (agentCode != null) 'agent_code': agentCode,
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
      Value<int>? credit,
      Value<int>? promotion,
      Value<String>? agentCode,
      Value<DateTime>? created}) {
    return OrdersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      code: code ?? this.code,
      status: status ?? this.status,
      credit: credit ?? this.credit,
      promotion: promotion ?? this.promotion,
      agentCode: agentCode ?? this.agentCode,
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
    if (credit.present) {
      map['credit'] = Variable<int>(credit.value);
    }
    if (promotion.present) {
      map['promotion'] = Variable<int>(promotion.value);
    }
    if (agentCode.present) {
      map['agent_code'] = Variable<String>(agentCode.value);
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
          ..write('credit: $credit, ')
          ..write('promotion: $promotion, ')
          ..write('agentCode: $agentCode, ')
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

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Unidentified'));
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Normal'));
  static const VerificationMeta _isPartnerMeta =
      const VerificationMeta('isPartner');
  @override
  late final GeneratedColumn<bool> isPartner = GeneratedColumn<bool>(
      'is_partner', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_partner" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _joinedDateMeta =
      const VerificationMeta('joinedDate');
  @override
  late final GeneratedColumn<DateTime> joinedDate = GeneratedColumn<DateTime>(
      'joined_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _lastTransitionMeta =
      const VerificationMeta('lastTransition');
  @override
  late final GeneratedColumn<DateTime> lastTransition =
      GeneratedColumn<DateTime>('last_transition', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _totalCreditMeta =
      const VerificationMeta('totalCredit');
  @override
  late final GeneratedColumn<int> totalCredit = GeneratedColumn<int>(
      'total_credit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastCreditDateMeta =
      const VerificationMeta('lastCreditDate');
  @override
  late final GeneratedColumn<DateTime> lastCreditDate =
      GeneratedColumn<DateTime>('last_credit_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _facebookMeta =
      const VerificationMeta('facebook');
  @override
  late final GeneratedColumn<String> facebook = GeneratedColumn<String>(
      'facebook', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _viberMeta = const VerificationMeta('viber');
  @override
  late final GeneratedColumn<String> viber = GeneratedColumn<String>(
      'viber', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telegramMeta =
      const VerificationMeta('telegram');
  @override
  late final GeneratedColumn<String> telegram = GeneratedColumn<String>(
      'telegram', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        userName,
        phone,
        status,
        isPartner,
        joinedDate,
        lastTransition,
        totalCredit,
        lastCreditDate,
        facebook,
        viber,
        telegram
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
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
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('is_partner')) {
      context.handle(_isPartnerMeta,
          isPartner.isAcceptableOrUnknown(data['is_partner']!, _isPartnerMeta));
    }
    if (data.containsKey('joined_date')) {
      context.handle(
          _joinedDateMeta,
          joinedDate.isAcceptableOrUnknown(
              data['joined_date']!, _joinedDateMeta));
    }
    if (data.containsKey('last_transition')) {
      context.handle(
          _lastTransitionMeta,
          lastTransition.isAcceptableOrUnknown(
              data['last_transition']!, _lastTransitionMeta));
    }
    if (data.containsKey('total_credit')) {
      context.handle(
          _totalCreditMeta,
          totalCredit.isAcceptableOrUnknown(
              data['total_credit']!, _totalCreditMeta));
    }
    if (data.containsKey('last_credit_date')) {
      context.handle(
          _lastCreditDateMeta,
          lastCreditDate.isAcceptableOrUnknown(
              data['last_credit_date']!, _lastCreditDateMeta));
    }
    if (data.containsKey('facebook')) {
      context.handle(_facebookMeta,
          facebook.isAcceptableOrUnknown(data['facebook']!, _facebookMeta));
    }
    if (data.containsKey('viber')) {
      context.handle(
          _viberMeta, viber.isAcceptableOrUnknown(data['viber']!, _viberMeta));
    }
    if (data.containsKey('telegram')) {
      context.handle(_telegramMeta,
          telegram.isAcceptableOrUnknown(data['telegram']!, _telegramMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      isPartner: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_partner'])!,
      joinedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_date'])!,
      lastTransition: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_transition'])!,
      totalCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_credit'])!,
      lastCreditDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_credit_date']),
      facebook: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}facebook']),
      viber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}viber']),
      telegram: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telegram']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String userId;
  final String userName;
  final String phone;
  final String status;
  final bool isPartner;
  final DateTime joinedDate;
  final DateTime lastTransition;
  final int totalCredit;
  final DateTime? lastCreditDate;
  final String? facebook;
  final String? viber;
  final String? telegram;
  const User(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.phone,
      required this.status,
      required this.isPartner,
      required this.joinedDate,
      required this.lastTransition,
      required this.totalCredit,
      this.lastCreditDate,
      this.facebook,
      this.viber,
      this.telegram});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['user_name'] = Variable<String>(userName);
    map['phone'] = Variable<String>(phone);
    map['status'] = Variable<String>(status);
    map['is_partner'] = Variable<bool>(isPartner);
    map['joined_date'] = Variable<DateTime>(joinedDate);
    map['last_transition'] = Variable<DateTime>(lastTransition);
    map['total_credit'] = Variable<int>(totalCredit);
    if (!nullToAbsent || lastCreditDate != null) {
      map['last_credit_date'] = Variable<DateTime>(lastCreditDate);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String>(facebook);
    }
    if (!nullToAbsent || viber != null) {
      map['viber'] = Variable<String>(viber);
    }
    if (!nullToAbsent || telegram != null) {
      map['telegram'] = Variable<String>(telegram);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      userId: Value(userId),
      userName: Value(userName),
      phone: Value(phone),
      status: Value(status),
      isPartner: Value(isPartner),
      joinedDate: Value(joinedDate),
      lastTransition: Value(lastTransition),
      totalCredit: Value(totalCredit),
      lastCreditDate: lastCreditDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCreditDate),
      facebook: facebook == null && nullToAbsent
          ? const Value.absent()
          : Value(facebook),
      viber:
          viber == null && nullToAbsent ? const Value.absent() : Value(viber),
      telegram: telegram == null && nullToAbsent
          ? const Value.absent()
          : Value(telegram),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      userName: serializer.fromJson<String>(json['userName']),
      phone: serializer.fromJson<String>(json['phone']),
      status: serializer.fromJson<String>(json['status']),
      isPartner: serializer.fromJson<bool>(json['isPartner']),
      joinedDate: serializer.fromJson<DateTime>(json['joinedDate']),
      lastTransition: serializer.fromJson<DateTime>(json['lastTransition']),
      totalCredit: serializer.fromJson<int>(json['totalCredit']),
      lastCreditDate: serializer.fromJson<DateTime?>(json['lastCreditDate']),
      facebook: serializer.fromJson<String?>(json['facebook']),
      viber: serializer.fromJson<String?>(json['viber']),
      telegram: serializer.fromJson<String?>(json['telegram']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'userName': serializer.toJson<String>(userName),
      'phone': serializer.toJson<String>(phone),
      'status': serializer.toJson<String>(status),
      'isPartner': serializer.toJson<bool>(isPartner),
      'joinedDate': serializer.toJson<DateTime>(joinedDate),
      'lastTransition': serializer.toJson<DateTime>(lastTransition),
      'totalCredit': serializer.toJson<int>(totalCredit),
      'lastCreditDate': serializer.toJson<DateTime?>(lastCreditDate),
      'facebook': serializer.toJson<String?>(facebook),
      'viber': serializer.toJson<String?>(viber),
      'telegram': serializer.toJson<String?>(telegram),
    };
  }

  User copyWith(
          {int? id,
          String? userId,
          String? userName,
          String? phone,
          String? status,
          bool? isPartner,
          DateTime? joinedDate,
          DateTime? lastTransition,
          int? totalCredit,
          Value<DateTime?> lastCreditDate = const Value.absent(),
          Value<String?> facebook = const Value.absent(),
          Value<String?> viber = const Value.absent(),
          Value<String?> telegram = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        phone: phone ?? this.phone,
        status: status ?? this.status,
        isPartner: isPartner ?? this.isPartner,
        joinedDate: joinedDate ?? this.joinedDate,
        lastTransition: lastTransition ?? this.lastTransition,
        totalCredit: totalCredit ?? this.totalCredit,
        lastCreditDate:
            lastCreditDate.present ? lastCreditDate.value : this.lastCreditDate,
        facebook: facebook.present ? facebook.value : this.facebook,
        viber: viber.present ? viber.value : this.viber,
        telegram: telegram.present ? telegram.value : this.telegram,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      userName: data.userName.present ? data.userName.value : this.userName,
      phone: data.phone.present ? data.phone.value : this.phone,
      status: data.status.present ? data.status.value : this.status,
      isPartner: data.isPartner.present ? data.isPartner.value : this.isPartner,
      joinedDate:
          data.joinedDate.present ? data.joinedDate.value : this.joinedDate,
      lastTransition: data.lastTransition.present
          ? data.lastTransition.value
          : this.lastTransition,
      totalCredit:
          data.totalCredit.present ? data.totalCredit.value : this.totalCredit,
      lastCreditDate: data.lastCreditDate.present
          ? data.lastCreditDate.value
          : this.lastCreditDate,
      facebook: data.facebook.present ? data.facebook.value : this.facebook,
      viber: data.viber.present ? data.viber.value : this.viber,
      telegram: data.telegram.present ? data.telegram.value : this.telegram,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('phone: $phone, ')
          ..write('status: $status, ')
          ..write('isPartner: $isPartner, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('lastTransition: $lastTransition, ')
          ..write('totalCredit: $totalCredit, ')
          ..write('lastCreditDate: $lastCreditDate, ')
          ..write('facebook: $facebook, ')
          ..write('viber: $viber, ')
          ..write('telegram: $telegram')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      userName,
      phone,
      status,
      isPartner,
      joinedDate,
      lastTransition,
      totalCredit,
      lastCreditDate,
      facebook,
      viber,
      telegram);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.userName == this.userName &&
          other.phone == this.phone &&
          other.status == this.status &&
          other.isPartner == this.isPartner &&
          other.joinedDate == this.joinedDate &&
          other.lastTransition == this.lastTransition &&
          other.totalCredit == this.totalCredit &&
          other.lastCreditDate == this.lastCreditDate &&
          other.facebook == this.facebook &&
          other.viber == this.viber &&
          other.telegram == this.telegram);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> userName;
  final Value<String> phone;
  final Value<String> status;
  final Value<bool> isPartner;
  final Value<DateTime> joinedDate;
  final Value<DateTime> lastTransition;
  final Value<int> totalCredit;
  final Value<DateTime?> lastCreditDate;
  final Value<String?> facebook;
  final Value<String?> viber;
  final Value<String?> telegram;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.userName = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
    this.isPartner = const Value.absent(),
    this.joinedDate = const Value.absent(),
    this.lastTransition = const Value.absent(),
    this.totalCredit = const Value.absent(),
    this.lastCreditDate = const Value.absent(),
    this.facebook = const Value.absent(),
    this.viber = const Value.absent(),
    this.telegram = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.userName = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
    this.isPartner = const Value.absent(),
    this.joinedDate = const Value.absent(),
    this.lastTransition = const Value.absent(),
    this.totalCredit = const Value.absent(),
    this.lastCreditDate = const Value.absent(),
    this.facebook = const Value.absent(),
    this.viber = const Value.absent(),
    this.telegram = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? userName,
    Expression<String>? phone,
    Expression<String>? status,
    Expression<bool>? isPartner,
    Expression<DateTime>? joinedDate,
    Expression<DateTime>? lastTransition,
    Expression<int>? totalCredit,
    Expression<DateTime>? lastCreditDate,
    Expression<String>? facebook,
    Expression<String>? viber,
    Expression<String>? telegram,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (userName != null) 'user_name': userName,
      if (phone != null) 'phone': phone,
      if (status != null) 'status': status,
      if (isPartner != null) 'is_partner': isPartner,
      if (joinedDate != null) 'joined_date': joinedDate,
      if (lastTransition != null) 'last_transition': lastTransition,
      if (totalCredit != null) 'total_credit': totalCredit,
      if (lastCreditDate != null) 'last_credit_date': lastCreditDate,
      if (facebook != null) 'facebook': facebook,
      if (viber != null) 'viber': viber,
      if (telegram != null) 'telegram': telegram,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? userName,
      Value<String>? phone,
      Value<String>? status,
      Value<bool>? isPartner,
      Value<DateTime>? joinedDate,
      Value<DateTime>? lastTransition,
      Value<int>? totalCredit,
      Value<DateTime?>? lastCreditDate,
      Value<String?>? facebook,
      Value<String?>? viber,
      Value<String?>? telegram}) {
    return UsersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      isPartner: isPartner ?? this.isPartner,
      joinedDate: joinedDate ?? this.joinedDate,
      lastTransition: lastTransition ?? this.lastTransition,
      totalCredit: totalCredit ?? this.totalCredit,
      lastCreditDate: lastCreditDate ?? this.lastCreditDate,
      facebook: facebook ?? this.facebook,
      viber: viber ?? this.viber,
      telegram: telegram ?? this.telegram,
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
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isPartner.present) {
      map['is_partner'] = Variable<bool>(isPartner.value);
    }
    if (joinedDate.present) {
      map['joined_date'] = Variable<DateTime>(joinedDate.value);
    }
    if (lastTransition.present) {
      map['last_transition'] = Variable<DateTime>(lastTransition.value);
    }
    if (totalCredit.present) {
      map['total_credit'] = Variable<int>(totalCredit.value);
    }
    if (lastCreditDate.present) {
      map['last_credit_date'] = Variable<DateTime>(lastCreditDate.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String>(facebook.value);
    }
    if (viber.present) {
      map['viber'] = Variable<String>(viber.value);
    }
    if (telegram.present) {
      map['telegram'] = Variable<String>(telegram.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userName: $userName, ')
          ..write('phone: $phone, ')
          ..write('status: $status, ')
          ..write('isPartner: $isPartner, ')
          ..write('joinedDate: $joinedDate, ')
          ..write('lastTransition: $lastTransition, ')
          ..write('totalCredit: $totalCredit, ')
          ..write('lastCreditDate: $lastCreditDate, ')
          ..write('facebook: $facebook, ')
          ..write('viber: $viber, ')
          ..write('telegram: $telegram')
          ..write(')'))
        .toString();
  }
}

class $AgentsTable extends Agents with TableInfo<$AgentsTable, Agent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agentCodeMeta =
      const VerificationMeta('agentCode');
  @override
  late final GeneratedColumn<String> agentCode = GeneratedColumn<String>(
      'agent_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _joinedDateMeta =
      const VerificationMeta('joinedDate');
  @override
  late final GeneratedColumn<DateTime> joinedDate = GeneratedColumn<DateTime>(
      'joined_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, name, agentCode, joinedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agents';
  @override
  VerificationContext validateIntegrity(Insertable<Agent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('agent_code')) {
      context.handle(_agentCodeMeta,
          agentCode.isAcceptableOrUnknown(data['agent_code']!, _agentCodeMeta));
    } else if (isInserting) {
      context.missing(_agentCodeMeta);
    }
    if (data.containsKey('joined_date')) {
      context.handle(
          _joinedDateMeta,
          joinedDate.isAcceptableOrUnknown(
              data['joined_date']!, _joinedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Agent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Agent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      agentCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agent_code'])!,
      joinedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_date'])!,
    );
  }

  @override
  $AgentsTable createAlias(String alias) {
    return $AgentsTable(attachedDatabase, alias);
  }
}

class Agent extends DataClass implements Insertable<Agent> {
  final int id;
  final String name;
  final String agentCode;
  final DateTime joinedDate;
  const Agent(
      {required this.id,
      required this.name,
      required this.agentCode,
      required this.joinedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['agent_code'] = Variable<String>(agentCode);
    map['joined_date'] = Variable<DateTime>(joinedDate);
    return map;
  }

  AgentsCompanion toCompanion(bool nullToAbsent) {
    return AgentsCompanion(
      id: Value(id),
      name: Value(name),
      agentCode: Value(agentCode),
      joinedDate: Value(joinedDate),
    );
  }

  factory Agent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Agent(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      agentCode: serializer.fromJson<String>(json['agentCode']),
      joinedDate: serializer.fromJson<DateTime>(json['joinedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'agentCode': serializer.toJson<String>(agentCode),
      'joinedDate': serializer.toJson<DateTime>(joinedDate),
    };
  }

  Agent copyWith(
          {int? id, String? name, String? agentCode, DateTime? joinedDate}) =>
      Agent(
        id: id ?? this.id,
        name: name ?? this.name,
        agentCode: agentCode ?? this.agentCode,
        joinedDate: joinedDate ?? this.joinedDate,
      );
  Agent copyWithCompanion(AgentsCompanion data) {
    return Agent(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      agentCode: data.agentCode.present ? data.agentCode.value : this.agentCode,
      joinedDate:
          data.joinedDate.present ? data.joinedDate.value : this.joinedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Agent(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('agentCode: $agentCode, ')
          ..write('joinedDate: $joinedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, agentCode, joinedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Agent &&
          other.id == this.id &&
          other.name == this.name &&
          other.agentCode == this.agentCode &&
          other.joinedDate == this.joinedDate);
}

class AgentsCompanion extends UpdateCompanion<Agent> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> agentCode;
  final Value<DateTime> joinedDate;
  const AgentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.agentCode = const Value.absent(),
    this.joinedDate = const Value.absent(),
  });
  AgentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String agentCode,
    this.joinedDate = const Value.absent(),
  })  : name = Value(name),
        agentCode = Value(agentCode);
  static Insertable<Agent> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? agentCode,
    Expression<DateTime>? joinedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (agentCode != null) 'agent_code': agentCode,
      if (joinedDate != null) 'joined_date': joinedDate,
    });
  }

  AgentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? agentCode,
      Value<DateTime>? joinedDate}) {
    return AgentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      agentCode: agentCode ?? this.agentCode,
      joinedDate: joinedDate ?? this.joinedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (agentCode.present) {
      map['agent_code'] = Variable<String>(agentCode.value);
    }
    if (joinedDate.present) {
      map['joined_date'] = Variable<DateTime>(joinedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('agentCode: $agentCode, ')
          ..write('joinedDate: $joinedDate')
          ..write(')'))
        .toString();
  }
}

class $MobCashDepoTable extends MobCashDepo
    with TableInfo<$MobCashDepoTable, MobCashDepoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MobCashDepoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _beforeLimitMeta =
      const VerificationMeta('beforeLimit');
  @override
  late final GeneratedColumn<double> beforeLimit = GeneratedColumn<double>(
      'before_limit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _afterLimitMeta =
      const VerificationMeta('afterLimit');
  @override
  late final GeneratedColumn<double> afterLimit = GeneratedColumn<double>(
      'after_limit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, created, beforeLimit, afterLimit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mob_cash_depo';
  @override
  VerificationContext validateIntegrity(Insertable<MobCashDepoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('before_limit')) {
      context.handle(
          _beforeLimitMeta,
          beforeLimit.isAcceptableOrUnknown(
              data['before_limit']!, _beforeLimitMeta));
    } else if (isInserting) {
      context.missing(_beforeLimitMeta);
    }
    if (data.containsKey('after_limit')) {
      context.handle(
          _afterLimitMeta,
          afterLimit.isAcceptableOrUnknown(
              data['after_limit']!, _afterLimitMeta));
    } else if (isInserting) {
      context.missing(_afterLimitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MobCashDepoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MobCashDepoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      beforeLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}before_limit'])!,
      afterLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}after_limit'])!,
    );
  }

  @override
  $MobCashDepoTable createAlias(String alias) {
    return $MobCashDepoTable(attachedDatabase, alias);
  }
}

class MobCashDepoData extends DataClass implements Insertable<MobCashDepoData> {
  final int id;
  final int amount;
  final DateTime created;
  final double beforeLimit;
  final double afterLimit;
  const MobCashDepoData(
      {required this.id,
      required this.amount,
      required this.created,
      required this.beforeLimit,
      required this.afterLimit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['created'] = Variable<DateTime>(created);
    map['before_limit'] = Variable<double>(beforeLimit);
    map['after_limit'] = Variable<double>(afterLimit);
    return map;
  }

  MobCashDepoCompanion toCompanion(bool nullToAbsent) {
    return MobCashDepoCompanion(
      id: Value(id),
      amount: Value(amount),
      created: Value(created),
      beforeLimit: Value(beforeLimit),
      afterLimit: Value(afterLimit),
    );
  }

  factory MobCashDepoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MobCashDepoData(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      created: serializer.fromJson<DateTime>(json['created']),
      beforeLimit: serializer.fromJson<double>(json['beforeLimit']),
      afterLimit: serializer.fromJson<double>(json['afterLimit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'created': serializer.toJson<DateTime>(created),
      'beforeLimit': serializer.toJson<double>(beforeLimit),
      'afterLimit': serializer.toJson<double>(afterLimit),
    };
  }

  MobCashDepoData copyWith(
          {int? id,
          int? amount,
          DateTime? created,
          double? beforeLimit,
          double? afterLimit}) =>
      MobCashDepoData(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        created: created ?? this.created,
        beforeLimit: beforeLimit ?? this.beforeLimit,
        afterLimit: afterLimit ?? this.afterLimit,
      );
  MobCashDepoData copyWithCompanion(MobCashDepoCompanion data) {
    return MobCashDepoData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      created: data.created.present ? data.created.value : this.created,
      beforeLimit:
          data.beforeLimit.present ? data.beforeLimit.value : this.beforeLimit,
      afterLimit:
          data.afterLimit.present ? data.afterLimit.value : this.afterLimit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MobCashDepoData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('created: $created, ')
          ..write('beforeLimit: $beforeLimit, ')
          ..write('afterLimit: $afterLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, created, beforeLimit, afterLimit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MobCashDepoData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.created == this.created &&
          other.beforeLimit == this.beforeLimit &&
          other.afterLimit == this.afterLimit);
}

class MobCashDepoCompanion extends UpdateCompanion<MobCashDepoData> {
  final Value<int> id;
  final Value<int> amount;
  final Value<DateTime> created;
  final Value<double> beforeLimit;
  final Value<double> afterLimit;
  const MobCashDepoCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.created = const Value.absent(),
    this.beforeLimit = const Value.absent(),
    this.afterLimit = const Value.absent(),
  });
  MobCashDepoCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required DateTime created,
    required double beforeLimit,
    required double afterLimit,
  })  : amount = Value(amount),
        created = Value(created),
        beforeLimit = Value(beforeLimit),
        afterLimit = Value(afterLimit);
  static Insertable<MobCashDepoData> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<DateTime>? created,
    Expression<double>? beforeLimit,
    Expression<double>? afterLimit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (created != null) 'created': created,
      if (beforeLimit != null) 'before_limit': beforeLimit,
      if (afterLimit != null) 'after_limit': afterLimit,
    });
  }

  MobCashDepoCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<DateTime>? created,
      Value<double>? beforeLimit,
      Value<double>? afterLimit}) {
    return MobCashDepoCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      created: created ?? this.created,
      beforeLimit: beforeLimit ?? this.beforeLimit,
      afterLimit: afterLimit ?? this.afterLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (beforeLimit.present) {
      map['before_limit'] = Variable<double>(beforeLimit.value);
    }
    if (afterLimit.present) {
      map['after_limit'] = Variable<double>(afterLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MobCashDepoCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('created: $created, ')
          ..write('beforeLimit: $beforeLimit, ')
          ..write('afterLimit: $afterLimit')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AgentsTable agents = $AgentsTable(this);
  late final $MobCashDepoTable mobCashDepo = $MobCashDepoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [orders, payments, users, agents, mobCashDepo];
}

typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  required String userId,
  required int amount,
  required String type,
  required String code,
  required String status,
  Value<int> credit,
  Value<int> promotion,
  required String agentCode,
  required DateTime created,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> amount,
  Value<String> type,
  Value<String> code,
  Value<String> status,
  Value<int> credit,
  Value<int> promotion,
  Value<String> agentCode,
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
            Value<int> credit = const Value.absent(),
            Value<int> promotion = const Value.absent(),
            Value<String> agentCode = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            userId: userId,
            amount: amount,
            type: type,
            code: code,
            status: status,
            credit: credit,
            promotion: promotion,
            agentCode: agentCode,
            created: created,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int amount,
            required String type,
            required String code,
            required String status,
            Value<int> credit = const Value.absent(),
            Value<int> promotion = const Value.absent(),
            required String agentCode,
            required DateTime created,
          }) =>
              OrdersCompanion.insert(
            id: id,
            userId: userId,
            amount: amount,
            type: type,
            code: code,
            status: status,
            credit: credit,
            promotion: promotion,
            agentCode: agentCode,
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

  ColumnFilters<int> get credit => $state.composableBuilder(
      column: $state.table.credit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get promotion => $state.composableBuilder(
      column: $state.table.promotion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get agentCode => $state.composableBuilder(
      column: $state.table.agentCode,
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

  ColumnOrderings<int> get credit => $state.composableBuilder(
      column: $state.table.credit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get promotion => $state.composableBuilder(
      column: $state.table.promotion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get agentCode => $state.composableBuilder(
      column: $state.table.agentCode,
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

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String userId,
  Value<String> userName,
  Value<String> phone,
  Value<String> status,
  Value<bool> isPartner,
  Value<DateTime> joinedDate,
  Value<DateTime> lastTransition,
  Value<int> totalCredit,
  Value<DateTime?> lastCreditDate,
  Value<String?> facebook,
  Value<String?> viber,
  Value<String?> telegram,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<String> userName,
  Value<String> phone,
  Value<String> status,
  Value<bool> isPartner,
  Value<DateTime> joinedDate,
  Value<DateTime> lastTransition,
  Value<int> totalCredit,
  Value<DateTime?> lastCreditDate,
  Value<String?> facebook,
  Value<String?> viber,
  Value<String?> telegram,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> isPartner = const Value.absent(),
            Value<DateTime> joinedDate = const Value.absent(),
            Value<DateTime> lastTransition = const Value.absent(),
            Value<int> totalCredit = const Value.absent(),
            Value<DateTime?> lastCreditDate = const Value.absent(),
            Value<String?> facebook = const Value.absent(),
            Value<String?> viber = const Value.absent(),
            Value<String?> telegram = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            userId: userId,
            userName: userName,
            phone: phone,
            status: status,
            isPartner: isPartner,
            joinedDate: joinedDate,
            lastTransition: lastTransition,
            totalCredit: totalCredit,
            lastCreditDate: lastCreditDate,
            facebook: facebook,
            viber: viber,
            telegram: telegram,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            Value<String> userName = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> isPartner = const Value.absent(),
            Value<DateTime> joinedDate = const Value.absent(),
            Value<DateTime> lastTransition = const Value.absent(),
            Value<int> totalCredit = const Value.absent(),
            Value<DateTime?> lastCreditDate = const Value.absent(),
            Value<String?> facebook = const Value.absent(),
            Value<String?> viber = const Value.absent(),
            Value<String?> telegram = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            userId: userId,
            userName: userName,
            phone: phone,
            status: status,
            isPartner: isPartner,
            joinedDate: joinedDate,
            lastTransition: lastTransition,
            totalCredit: totalCredit,
            lastCreditDate: lastCreditDate,
            facebook: facebook,
            viber: viber,
            telegram: telegram,
          ),
        ));
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isPartner => $state.composableBuilder(
      column: $state.table.isPartner,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get joinedDate => $state.composableBuilder(
      column: $state.table.joinedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastTransition => $state.composableBuilder(
      column: $state.table.lastTransition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalCredit => $state.composableBuilder(
      column: $state.table.totalCredit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastCreditDate => $state.composableBuilder(
      column: $state.table.lastCreditDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get facebook => $state.composableBuilder(
      column: $state.table.facebook,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get viber => $state.composableBuilder(
      column: $state.table.viber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get telegram => $state.composableBuilder(
      column: $state.table.telegram,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phone => $state.composableBuilder(
      column: $state.table.phone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isPartner => $state.composableBuilder(
      column: $state.table.isPartner,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get joinedDate => $state.composableBuilder(
      column: $state.table.joinedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastTransition => $state.composableBuilder(
      column: $state.table.lastTransition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalCredit => $state.composableBuilder(
      column: $state.table.totalCredit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastCreditDate => $state.composableBuilder(
      column: $state.table.lastCreditDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get facebook => $state.composableBuilder(
      column: $state.table.facebook,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get viber => $state.composableBuilder(
      column: $state.table.viber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get telegram => $state.composableBuilder(
      column: $state.table.telegram,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AgentsTableCreateCompanionBuilder = AgentsCompanion Function({
  Value<int> id,
  required String name,
  required String agentCode,
  Value<DateTime> joinedDate,
});
typedef $$AgentsTableUpdateCompanionBuilder = AgentsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> agentCode,
  Value<DateTime> joinedDate,
});

class $$AgentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AgentsTable,
    Agent,
    $$AgentsTableFilterComposer,
    $$AgentsTableOrderingComposer,
    $$AgentsTableCreateCompanionBuilder,
    $$AgentsTableUpdateCompanionBuilder> {
  $$AgentsTableTableManager(_$AppDatabase db, $AgentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AgentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AgentsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> agentCode = const Value.absent(),
            Value<DateTime> joinedDate = const Value.absent(),
          }) =>
              AgentsCompanion(
            id: id,
            name: name,
            agentCode: agentCode,
            joinedDate: joinedDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String agentCode,
            Value<DateTime> joinedDate = const Value.absent(),
          }) =>
              AgentsCompanion.insert(
            id: id,
            name: name,
            agentCode: agentCode,
            joinedDate: joinedDate,
          ),
        ));
}

class $$AgentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AgentsTable> {
  $$AgentsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get agentCode => $state.composableBuilder(
      column: $state.table.agentCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get joinedDate => $state.composableBuilder(
      column: $state.table.joinedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AgentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AgentsTable> {
  $$AgentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get agentCode => $state.composableBuilder(
      column: $state.table.agentCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get joinedDate => $state.composableBuilder(
      column: $state.table.joinedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MobCashDepoTableCreateCompanionBuilder = MobCashDepoCompanion
    Function({
  Value<int> id,
  required int amount,
  required DateTime created,
  required double beforeLimit,
  required double afterLimit,
});
typedef $$MobCashDepoTableUpdateCompanionBuilder = MobCashDepoCompanion
    Function({
  Value<int> id,
  Value<int> amount,
  Value<DateTime> created,
  Value<double> beforeLimit,
  Value<double> afterLimit,
});

class $$MobCashDepoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MobCashDepoTable,
    MobCashDepoData,
    $$MobCashDepoTableFilterComposer,
    $$MobCashDepoTableOrderingComposer,
    $$MobCashDepoTableCreateCompanionBuilder,
    $$MobCashDepoTableUpdateCompanionBuilder> {
  $$MobCashDepoTableTableManager(_$AppDatabase db, $MobCashDepoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MobCashDepoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MobCashDepoTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<double> beforeLimit = const Value.absent(),
            Value<double> afterLimit = const Value.absent(),
          }) =>
              MobCashDepoCompanion(
            id: id,
            amount: amount,
            created: created,
            beforeLimit: beforeLimit,
            afterLimit: afterLimit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int amount,
            required DateTime created,
            required double beforeLimit,
            required double afterLimit,
          }) =>
              MobCashDepoCompanion.insert(
            id: id,
            amount: amount,
            created: created,
            beforeLimit: beforeLimit,
            afterLimit: afterLimit,
          ),
        ));
}

class $$MobCashDepoTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MobCashDepoTable> {
  $$MobCashDepoTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get beforeLimit => $state.composableBuilder(
      column: $state.table.beforeLimit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get afterLimit => $state.composableBuilder(
      column: $state.table.afterLimit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MobCashDepoTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MobCashDepoTable> {
  $$MobCashDepoTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get created => $state.composableBuilder(
      column: $state.table.created,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get beforeLimit => $state.composableBuilder(
      column: $state.table.beforeLimit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get afterLimit => $state.composableBuilder(
      column: $state.table.afterLimit,
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
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AgentsTableTableManager get agents =>
      $$AgentsTableTableManager(_db, _db.agents);
  $$MobCashDepoTableTableManager get mobCashDepo =>
      $$MobCashDepoTableTableManager(_db, _db.mobCashDepo);
}
