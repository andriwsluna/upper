import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _FilmCategory { film_id, category_id, last_update }

class _DataFields extends GenericDataFields {
  late final IntegerField_PG _film_id;
  late final IntegerField_PG _category_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _film_id = IntegerField_PG(this, 'film_id', true, true);
    _category_id = IntegerField_PG(this, 'category_id', true, true);
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
    fields.add(_film_id);
    fields.add(_category_id);
    fields.add(_last_update);
  }
}

class Film_category_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  IntegerField_PG get film_id => _dataFields._film_id;
  IntegerField_PG get category_id => _dataFields._category_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Film_category_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'film_category', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_category_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(
            _pgConnection, 'public', 'film_category', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_category_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'film_category', _addRecord) {
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

  Future<Either<ErrorSqlResult, Film_category_ORM>> getFilmCategoryWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Film_category_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int film_id, int category_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(IntegerField_PG.clone(_dataFields._film_id)..setValue(film_id))
          ..add(IntegerField_PG.clone(_dataFields._category_id)
            ..setValue(category_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int film_id, int category_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(IntegerField_PG.clone(_dataFields._film_id)..setValue(film_id))
          ..add(IntegerField_PG.clone(_dataFields._category_id)
            ..setValue(category_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('filmId')) &&
        (proto3Json.containsKey('categoryId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(IntegerField_PG.clone(_dataFields._film_id)
              ..setValue(proto3Json['filmId']))
            ..add(IntegerField_PG.clone(_dataFields._category_id)
              ..setValue(proto3Json['categoryId'])));
    } else {
      return left(ErrorSqlResult('Film_category_ORM',
          'materializeFromProto3Json', '', ['Required fields not found']));
    }
  }
}

class _FilterFilmId extends IntegerFilter {
  _FilterFilmId() : super('film_category.film_id');
}

class _FilterCategoryId extends IntegerFilter {
  _FilterCategoryId() : super('film_category.category_id');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('film_category.last_update');
}

class Where extends OrmSelectWhere {
  final _film_id = _FilterFilmId();
  final _category_id = _FilterCategoryId();
  final _last_update = _FilterLastUpdate();

  _FilterFilmId get film_id => _film_id;
  _FilterCategoryId get category_id => _category_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_film_id);
    filters.add(_category_id);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_FilmCategory>[];
  void get film_id => _columns.add(_FilmCategory.film_id);
  void get category_id => _columns.add(_FilmCategory.category_id);
  void get last_update => _columns.add(_FilmCategory.last_update);

  @override
  String toString() {
    List<_FilmCategory> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _FilmCategory.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void film_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film_category.film_id', ordType));
  }

  void category_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film_category.category_id', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film_category.last_update', ordType));
  }
}
