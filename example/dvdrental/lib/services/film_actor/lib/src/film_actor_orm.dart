import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _FilmActor { actor_id, film_id, last_update }

class _DataFields extends GenericDataFields {
  late final IntegerField_PG _actor_id;
  late final IntegerField_PG _film_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _actor_id = IntegerField_PG(this, 'actor_id', true, true);
    _film_id = IntegerField_PG(this, 'film_id', true, true);
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
    fields.add(_film_id);
    fields.add(_last_update);
  }
}

class Film_actor_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  IntegerField_PG get actor_id => _dataFields._actor_id;
  IntegerField_PG get film_id => _dataFields._film_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Film_actor_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'film_actor', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_actor_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(
            _pgConnection, 'public', 'film_actor', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_actor_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'film_actor', _addRecord) {
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

  Future<Either<ErrorSqlResult, Film_actor_ORM>> getFilmActorWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Film_actor_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int actor_id, int film_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(
              IntegerField_PG.clone(_dataFields._actor_id)..setValue(actor_id))
          ..add(
              IntegerField_PG.clone(_dataFields._film_id)..setValue(film_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int actor_id, int film_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(
              IntegerField_PG.clone(_dataFields._actor_id)..setValue(actor_id))
          ..add(
              IntegerField_PG.clone(_dataFields._film_id)..setValue(film_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('actorId')) &&
        (proto3Json.containsKey('filmId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(IntegerField_PG.clone(_dataFields._actor_id)
              ..setValue(proto3Json['actorId']))
            ..add(IntegerField_PG.clone(_dataFields._film_id)
              ..setValue(proto3Json['filmId'])));
    } else {
      return left(ErrorSqlResult('Film_actor_ORM', 'materializeFromProto3Json',
          '', ['Required fields not found']));
    }
  }
}

class _FilterActorId extends IntegerFilter {
  _FilterActorId() : super('film_actor.actor_id');
}

class _FilterFilmId extends IntegerFilter {
  _FilterFilmId() : super('film_actor.film_id');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('film_actor.last_update');
}

class Where extends OrmSelectWhere {
  final _actor_id = _FilterActorId();
  final _film_id = _FilterFilmId();
  final _last_update = _FilterLastUpdate();

  _FilterActorId get actor_id => _actor_id;
  _FilterFilmId get film_id => _film_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_actor_id);
    filters.add(_film_id);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_FilmActor>[];
  void get actor_id => _columns.add(_FilmActor.actor_id);
  void get film_id => _columns.add(_FilmActor.film_id);
  void get last_update => _columns.add(_FilmActor.last_update);

  @override
  String toString() {
    List<_FilmActor> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _FilmActor.values;
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
    add(ColumnOrdenator('film_actor.actor_id', ordType));
  }

  void film_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film_actor.film_id', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film_actor.last_update', ordType));
  }
}
