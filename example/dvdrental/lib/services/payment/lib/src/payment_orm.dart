import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Payment {
  payment_id,
  customer_id,
  staff_id,
  rental_id,
  amount,
  payment_date
}

class _DataFields extends GenericDataFields {
  late final SerialField_PG _payment_id;
  late final IntegerField_PG _customer_id;
  late final IntegerField_PG _staff_id;
  late final IntegerField_PG _rental_id;
  late final NumericField_PG _amount;
  late final DateTimeField_PG _payment_date;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _payment_id = SerialField_PG(this, 'payment_id', true, true);
    _customer_id = IntegerField_PG(this, 'customer_id', true, false);
    _staff_id = IntegerField_PG(this, 'staff_id', true, false);
    _rental_id = IntegerField_PG(this, 'rental_id', true, false);
    _amount = NumericField_PG(this, 'amount', true, false);
    _payment_date = DateTimeField_PG(this, 'payment_date', true, false);
  }

  GenericField getCooField(_DataFields origin, String field) {
    return origin.fields
        .firstWhere((element) => getFieldName(element) == field);
  }

  void _cloneField(_DataFields origin) {
    fields.forEach((element) {
      element.copy(getCooField(origin, getFieldName(element)));
    });
  }

  @override
  void backup() {
    _backup = _DataFields();
    _backup._cloneField(this);
  }

  @override
  void restore() {
    if (assigned) {
      _cloneField(_backup);
      finalize();
    }
  }

  void _addFields() {
    fields.add(_payment_id);
    fields.add(_customer_id);
    fields.add(_staff_id);
    fields.add(_rental_id);
    fields.add(_amount);
    fields.add(_payment_date);
  }
}

class Payment_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get payment_id => _dataFields._payment_id;
  IntegerField_PG get customer_id => _dataFields._customer_id;
  IntegerField_PG get staff_id => _dataFields._staff_id;
  IntegerField_PG get rental_id => _dataFields._rental_id;
  NumericField_PG get amount => _dataFields._amount;
  DateTimeField_PG get payment_date => _dataFields._payment_date;

  Payment_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'payment', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Payment_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'payment', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Payment_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'payment', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
    if (dataset.isNotempty) {
      dataset.first();
      for (var i = 1; i <= dataset.count; i++) {
        newRecord();
        _dataFields.fields.forEach((element) {
          element.loadDataFromDataset(dataset);
        });
        _dataFields.finalize();
        dataset.next();
      }
    }
  }

  Future<Either<ErrorSqlResult, Dataset>> select(
      {Columns? columns,
      Where? where,
      OrderBy? orderBy,
      int? limit,
      int? offset}) async {
    var col = columns;
    col ??= Columns();
    var whe = where;
    whe ??= Where();
    var ordBy = orderBy;
    ordBy ??= OrderBy();
    return (await sqlConnection.openQuery('select',
            getSelectSql(col, whe, ordBy, limit: limit, offset: offset)))
        .fold((l) => left(l), (r) => right(r.dataset));
  }

  Future<Either<ErrorSqlResult, Payment_ORM>> getPaymentWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Payment_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int payment_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._payment_id)
            ..setValue(payment_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int payment_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._payment_id)
            ..setValue(payment_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('paymentId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._payment_id)
              ..setValue(proto3Json['paymentId'])));
    } else {
      return left(ErrorSqlResult('Payment_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterPaymentId extends IntegerFilter {
  _FilterPaymentId() : super('payment.payment_id');
}

class _FilterCustomerId extends IntegerFilter {
  _FilterCustomerId() : super('payment.customer_id');
}

class _FilterStaffId extends IntegerFilter {
  _FilterStaffId() : super('payment.staff_id');
}

class _FilterRentalId extends IntegerFilter {
  _FilterRentalId() : super('payment.rental_id');
}

class _FilterAmount extends NumericFilter {
  _FilterAmount() : super('payment.amount');
}

class _FilterPaymentDate extends DateTimeFilter {
  _FilterPaymentDate() : super('payment.payment_date');
}

class Where extends OrmSelectWhere {
  final _payment_id = _FilterPaymentId();
  final _customer_id = _FilterCustomerId();
  final _staff_id = _FilterStaffId();
  final _rental_id = _FilterRentalId();
  final _amount = _FilterAmount();
  final _payment_date = _FilterPaymentDate();

  _FilterPaymentId get payment_id => _payment_id;
  _FilterCustomerId get customer_id => _customer_id;
  _FilterStaffId get staff_id => _staff_id;
  _FilterRentalId get rental_id => _rental_id;
  _FilterAmount get amount => _amount;
  _FilterPaymentDate get payment_date => _payment_date;

  Where() {
    filters.add(_payment_id);
    filters.add(_customer_id);
    filters.add(_staff_id);
    filters.add(_rental_id);
    filters.add(_amount);
    filters.add(_payment_date);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Payment>[];
  void get payment_id => _columns.add(_Payment.payment_id);
  void get customer_id => _columns.add(_Payment.customer_id);
  void get staff_id => _columns.add(_Payment.staff_id);
  void get rental_id => _columns.add(_Payment.rental_id);
  void get amount => _columns.add(_Payment.amount);
  void get payment_date => _columns.add(_Payment.payment_date);

  @override
  String toString() {
    List<_Payment> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Payment.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void payment_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.payment_id', ordType));
  }

  void customer_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.customer_id', ordType));
  }

  void staff_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.staff_id', ordType));
  }

  void rental_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.rental_id', ordType));
  }

  void amount([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.amount', ordType));
  }

  void payment_date([ordType = OrdType.asc]) {
    add(ColumnOrdenator('payment.payment_date', ordType));
  }
}
