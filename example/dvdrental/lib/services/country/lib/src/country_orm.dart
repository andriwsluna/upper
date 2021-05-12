import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Country { country_id, country, last_update }

class _DataFields extends GenericDataFields {
  late final SerialField_PG _country_id;
  late final StringField_PG _country;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _country_id = SerialField_PG(this, 'country_id', true, true);
    _country = StringField_PG(this, 'country', true, false, 50);
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
    fields.add(_country_id);
    fields.add(_country);
    fields.add(_last_update);
  }
}

class Country_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get country_id => _dataFields._country_id;
  StringField_PG get country => _dataFields._country;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Country_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'country', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Country_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'country', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Country_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'country', _addRecord) {
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

  Future<Either<ErrorSqlResult, Country_ORM>> getCountryWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Country_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int country_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._country_id)
            ..setValue(country_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int country_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._country_id)
            ..setValue(country_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('countryId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._country_id)
              ..setValue(proto3Json['countryId'])));
    } else {
      return left(ErrorSqlResult('Country_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterCountryId extends IntegerFilter {
  _FilterCountryId() : super('country.country_id');
}

class _FilterCountry extends StringFilter {
  _FilterCountry() : super('country.country');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('country.last_update');
}

class Where extends OrmSelectWhere {
  final _country_id = _FilterCountryId();
  final _country = _FilterCountry();
  final _last_update = _FilterLastUpdate();

  _FilterCountryId get country_id => _country_id;
  _FilterCountry get country => _country;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_country_id);
    filters.add(_country);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Country>[];
  void get country_id => _columns.add(_Country.country_id);
  void get country => _columns.add(_Country.country);
  void get last_update => _columns.add(_Country.last_update);

  @override
  String toString() {
    List<_Country> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Country.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void country_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('country.country_id', ordType));
  }

  void country([ordType = OrdType.asc]) {
    add(ColumnOrdenator('country.country', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('country.last_update', ordType));
  }
}
