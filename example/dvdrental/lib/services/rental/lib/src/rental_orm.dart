import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Rental {
  rental_id,
  rental_date,
  inventory_id,
  customer_id,
  return_date,
  staff_id,
  last_update
}

class _DataFields extends GenericDataFields {
  late final SerialField_PG _rental_id;
  late final DateTimeField_PG _rental_date;
  late final IntegerField_PG _inventory_id;
  late final IntegerField_PG _customer_id;
  late final DateTimeField_PG _return_date;
  late final IntegerField_PG _staff_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _rental_id = SerialField_PG(this, 'rental_id', true, true);
    _rental_date = DateTimeField_PG(this, 'rental_date', true, false);
    _inventory_id = IntegerField_PG(this, 'inventory_id', true, false);
    _customer_id = IntegerField_PG(this, 'customer_id', true, false);
    _return_date = DateTimeField_PG(this, 'return_date', false, false);
    _staff_id = IntegerField_PG(this, 'staff_id', true, false);
    _last_update = DateTimeField_PG(this, 'last_update', true, false);
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
    fields.add(_rental_id);
    fields.add(_rental_date);
    fields.add(_inventory_id);
    fields.add(_customer_id);
    fields.add(_return_date);
    fields.add(_staff_id);
    fields.add(_last_update);
  }
}

class Rental_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get rental_id => _dataFields._rental_id;
  DateTimeField_PG get rental_date => _dataFields._rental_date;
  IntegerField_PG get inventory_id => _dataFields._inventory_id;
  IntegerField_PG get customer_id => _dataFields._customer_id;
  DateTimeField_PG get return_date => _dataFields._return_date;
  IntegerField_PG get staff_id => _dataFields._staff_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Rental_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'rental', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Rental_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'rental', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Rental_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'rental', _addRecord) {
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

  Future<Either<ErrorSqlResult, Rental_ORM>> getRentalWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Rental_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int rental_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._rental_id)
            ..setValue(rental_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int rental_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._rental_id)
            ..setValue(rental_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('rentalId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._rental_id)
              ..setValue(proto3Json['rentalId'])));
    } else {
      return left(ErrorSqlResult('Rental_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterRentalId extends IntegerFilter {
  _FilterRentalId() : super('rental.rental_id');
}

class _FilterRentalDate extends DateTimeFilter {
  _FilterRentalDate() : super('rental.rental_date');
}

class _FilterInventoryId extends IntegerFilter {
  _FilterInventoryId() : super('rental.inventory_id');
}

class _FilterCustomerId extends IntegerFilter {
  _FilterCustomerId() : super('rental.customer_id');
}

class _FilterReturnDate extends DateTimeFilter with NullableFilter {
  _FilterReturnDate() : super('rental.return_date');
}

class _FilterStaffId extends IntegerFilter {
  _FilterStaffId() : super('rental.staff_id');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('rental.last_update');
}

class Where extends OrmSelectWhere {
  final _rental_id = _FilterRentalId();
  final _rental_date = _FilterRentalDate();
  final _inventory_id = _FilterInventoryId();
  final _customer_id = _FilterCustomerId();
  final _return_date = _FilterReturnDate();
  final _staff_id = _FilterStaffId();
  final _last_update = _FilterLastUpdate();

  _FilterRentalId get rental_id => _rental_id;
  _FilterRentalDate get rental_date => _rental_date;
  _FilterInventoryId get inventory_id => _inventory_id;
  _FilterCustomerId get customer_id => _customer_id;
  _FilterReturnDate get return_date => _return_date;
  _FilterStaffId get staff_id => _staff_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_rental_id);
    filters.add(_rental_date);
    filters.add(_inventory_id);
    filters.add(_customer_id);
    filters.add(_return_date);
    filters.add(_staff_id);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Rental>[];
  void get rental_id => _columns.add(_Rental.rental_id);
  void get rental_date => _columns.add(_Rental.rental_date);
  void get inventory_id => _columns.add(_Rental.inventory_id);
  void get customer_id => _columns.add(_Rental.customer_id);
  void get return_date => _columns.add(_Rental.return_date);
  void get staff_id => _columns.add(_Rental.staff_id);
  void get last_update => _columns.add(_Rental.last_update);

  @override
  String toString() {
    List<_Rental> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Rental.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void rental_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.rental_id', ordType));
  }

  void rental_date([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.rental_date', ordType));
  }

  void inventory_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.inventory_id', ordType));
  }

  void customer_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.customer_id', ordType));
  }

  void return_date([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.return_date', ordType));
  }

  void staff_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.staff_id', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('rental.last_update', ordType));
  }
}
