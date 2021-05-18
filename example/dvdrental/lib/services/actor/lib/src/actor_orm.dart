import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Actor { actor_id, first_name, last_name, last_update }

class _DataFields extends GenericDataFields {
  late final SerialField_PG _actor_id;
  late final StringField_PG _first_name;
  late final StringField_PG _last_name;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _actor_id = SerialField_PG(this, 'actor_id', true, true);
    _first_name = StringField_PG(this, 'first_name', true, false, 45);
    _last_name = StringField_PG(this, 'last_name', true, false, 45);
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
    fields.add(_actor_id);
    fields.add(_first_name);
    fields.add(_last_name);
    fields.add(_last_update);
  }
}

class Actor_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get actor_id => _dataFields._actor_id;
  StringField_PG get first_name => _dataFields._first_name;
  StringField_PG get last_name => _dataFields._last_name;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Actor_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'actor', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Actor_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'actor', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Actor_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'actor', _addRecord) {
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

  Future<Either<ErrorSqlResult, Actor_ORM>> getActorWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Actor_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int actor_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._actor_id)..setValue(actor_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int actor_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._actor_id)..setValue(actor_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('actorId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._actor_id)
              ..setValue(proto3Json['actorId'])));
    } else {
      return left(ErrorSqlResult('Actor_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterActorId extends IntegerFilter {
  _FilterActorId() : super('actor.actor_id');
}

class _FilterFirstName extends StringFilter {
  _FilterFirstName() : super('actor.first_name');
}

class _FilterLastName extends StringFilter {
  _FilterLastName() : super('actor.last_name');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('actor.last_update');
}

class Where extends OrmSelectWhere {
  final _actor_id = _FilterActorId();
  final _first_name = _FilterFirstName();
  final _last_name = _FilterLastName();
  final _last_update = _FilterLastUpdate();

  _FilterActorId get actor_id => _actor_id;
  _FilterFirstName get first_name => _first_name;
  _FilterLastName get last_name => _last_name;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_actor_id);
    filters.add(_first_name);
    filters.add(_last_name);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Actor>[];
  void get actor_id => _columns.add(_Actor.actor_id);
  void get first_name => _columns.add(_Actor.first_name);
  void get last_name => _columns.add(_Actor.last_name);
  void get last_update => _columns.add(_Actor.last_update);

  @override
  String toString() {
    List<_Actor> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Actor.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void actor_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('actor.actor_id', ordType));
  }

  void first_name([ordType = OrdType.asc]) {
    add(ColumnOrdenator('actor.first_name', ordType));
  }

  void last_name([ordType = OrdType.asc]) {
    add(ColumnOrdenator('actor.last_name', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('actor.last_update', ordType));
  }
}
