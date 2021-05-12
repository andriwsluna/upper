import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Inventory { inventory_id, film_id, store_id, last_update }

class _DataFields extends GenericDataFields {
  late final SerialField_PG _inventory_id;
  late final IntegerField_PG _film_id;
  late final IntegerField_PG _store_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _inventory_id = SerialField_PG(this, 'inventory_id', true, true);
    _film_id = IntegerField_PG(this, 'film_id', true, false);
    _store_id = IntegerField_PG(this, 'store_id', true, false);
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
    fields.add(_inventory_id);
    fields.add(_film_id);
    fields.add(_store_id);
    fields.add(_last_update);
  }
}

class Inventory_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get inventory_id => _dataFields._inventory_id;
  IntegerField_PG get film_id => _dataFields._film_id;
  IntegerField_PG get store_id => _dataFields._store_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Inventory_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'inventory', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Inventory_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'inventory', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Inventory_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'inventory', _addRecord) {
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

  Future<Either<ErrorSqlResult, Inventory_ORM>> getInventoryWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Inventory_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int inventory_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._inventory_id)
            ..setValue(inventory_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int inventory_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._inventory_id)
            ..setValue(inventory_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('inventoryId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._inventory_id)
              ..setValue(proto3Json['inventoryId'])));
    } else {
      return left(ErrorSqlResult('Inventory_ORM', 'materializeFromProto3Json',
          '', ['Required fields not found']));
    }
  }
}

class _FilterInventoryId extends IntegerFilter {
  _FilterInventoryId() : super('inventory.inventory_id');
}

class _FilterFilmId extends IntegerFilter {
  _FilterFilmId() : super('inventory.film_id');
}

class _FilterStoreId extends IntegerFilter {
  _FilterStoreId() : super('inventory.store_id');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('inventory.last_update');
}

class Where extends OrmSelectWhere {
  final _inventory_id = _FilterInventoryId();
  final _film_id = _FilterFilmId();
  final _store_id = _FilterStoreId();
  final _last_update = _FilterLastUpdate();

  _FilterInventoryId get inventory_id => _inventory_id;
  _FilterFilmId get film_id => _film_id;
  _FilterStoreId get store_id => _store_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_inventory_id);
    filters.add(_film_id);
    filters.add(_store_id);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Inventory>[];
  void get inventory_id => _columns.add(_Inventory.inventory_id);
  void get film_id => _columns.add(_Inventory.film_id);
  void get store_id => _columns.add(_Inventory.store_id);
  void get last_update => _columns.add(_Inventory.last_update);

  @override
  String toString() {
    List<_Inventory> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Inventory.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void inventory_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('inventory.inventory_id', ordType));
  }

  void film_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('inventory.film_id', ordType));
  }

  void store_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('inventory.store_id', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('inventory.last_update', ordType));
  }
}
