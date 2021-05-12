import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Store { store_id, manager_staff_id, address_id, last_update }

class _DataFields extends GenericDataFields {
  late final SerialField_PG _store_id;
  late final IntegerField_PG _manager_staff_id;
  late final IntegerField_PG _address_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _store_id = SerialField_PG(this, 'store_id', true, true);
    _manager_staff_id = IntegerField_PG(this, 'manager_staff_id', true, false);
    _address_id = IntegerField_PG(this, 'address_id', true, false);
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
    fields.add(_store_id);
    fields.add(_manager_staff_id);
    fields.add(_address_id);
    fields.add(_last_update);
  }
}

class Store_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get store_id => _dataFields._store_id;
  IntegerField_PG get manager_staff_id => _dataFields._manager_staff_id;
  IntegerField_PG get address_id => _dataFields._address_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Store_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'store', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Store_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'store', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Store_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'store', _addRecord) {
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

  Future<Either<ErrorSqlResult, Store_ORM>> getStoreWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Store_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int store_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._store_id)..setValue(store_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int store_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._store_id)..setValue(store_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('storeId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._store_id)
              ..setValue(proto3Json['storeId'])));
    } else {
      return left(ErrorSqlResult('Store_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterStoreId extends IntegerFilter {
  _FilterStoreId() : super('store.store_id');
}

class _FilterManagerStaffId extends IntegerFilter {
  _FilterManagerStaffId() : super('store.manager_staff_id');
}

class _FilterAddressId extends IntegerFilter {
  _FilterAddressId() : super('store.address_id');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('store.last_update');
}

class Where extends OrmSelectWhere {
  final _store_id = _FilterStoreId();
  final _manager_staff_id = _FilterManagerStaffId();
  final _address_id = _FilterAddressId();
  final _last_update = _FilterLastUpdate();

  _FilterStoreId get store_id => _store_id;
  _FilterManagerStaffId get manager_staff_id => _manager_staff_id;
  _FilterAddressId get address_id => _address_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_store_id);
    filters.add(_manager_staff_id);
    filters.add(_address_id);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Store>[];
  void get store_id => _columns.add(_Store.store_id);
  void get manager_staff_id => _columns.add(_Store.manager_staff_id);
  void get address_id => _columns.add(_Store.address_id);
  void get last_update => _columns.add(_Store.last_update);

  @override
  String toString() {
    List<_Store> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Store.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void store_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('store.store_id', ordType));
  }

  void manager_staff_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('store.manager_staff_id', ordType));
  }

  void address_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('store.address_id', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('store.last_update', ordType));
  }
}
