import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _City {
  city_id
  ,city
  ,country_id
  ,last_update
}

class _DataFields extends GenericDataFields {

  late final SerialField_PG _city_id;
  late final StringField_PG _city;
  late final IntegerField_PG _country_id;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _city_id = SerialField_PG(this, 'city_id', true, true);
    _city = StringField_PG(this, 'city', true, false, 50);
    _country_id = IntegerField_PG(this, 'country_id', true, false);
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
    fields.add(_city_id);
    fields.add(_city);
    fields.add(_country_id);
    fields.add(_last_update);
  }
}

class City_ORM extends PostgressORM{
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;


  SerialField_PG get city_id => _dataFields._city_id;
  StringField_PG get city => _dataFields._city;
  IntegerField_PG get country_id => _dataFields._country_id;
  DateTimeField_PG get last_update => _dataFields._last_update;

  City_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'city', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  City_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'city', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  City_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'city', _addRecord) {
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


  Future<Either<ErrorSqlResult, Dataset>>
  select(
    {
      Columns? columns,
      Where? where,
      OrderBy? orderBy,
      int? limit, 
      int? offset
    }
  ) async
  {
    var col = columns;
    col ??= Columns();
    var whe = where;
    whe ??= Where();
    var ordBy = orderBy;
    ordBy ??= OrderBy();
    return (await sqlConnection.openQuery(
      'select', getSelectSql(col, 
      whe , ordBy, limit: limit, offset: offset)))
    .fold((l) => left(l), (r) => right(r.dataset));
  }

  Future<Either<ErrorSqlResult, City_ORM>> getCityWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(City_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int city_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._city_id)
            ..setValue(city_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
    int city_id) async{
    return getDeleteRecord(
         this,
         (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._city_id)
            ..setValue(city_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
    materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
  if (
      (proto3Json.containsKey('cityId'))) {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._city_id)
            ..setValue(proto3Json['cityId'])));
  } else {
      return left(ErrorSqlResult('City_ORM', 'materializeFromProto3Json', '',
           ['Required fields not found']));
  }
  } 
}

class _FilterCityId extends IntegerFilter {
  _FilterCityId() : super('city.city_id');
}
class _FilterCity extends StringFilter {
  _FilterCity() : super('city.city');
}
class _FilterCountryId extends IntegerFilter {
  _FilterCountryId() : super('city.country_id');
}
class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('city.last_update');
}

class Where extends OrmSelectWhere {
  final _city_id = _FilterCityId();
  final _city = _FilterCity();
  final _country_id = _FilterCountryId();
  final _last_update = _FilterLastUpdate();

  _FilterCityId get city_id => _city_id;
  _FilterCity get city => _city;
  _FilterCountryId get country_id => _country_id;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_city_id);
    filters.add(_city);
    filters.add(_country_id);
    filters.add(_last_update);
  }

}
class Columns implements OrmSelectableColumns {
  final _columns = <_City>[];
  void get city_id => _columns.add(_City.city_id);
  void get city => _columns.add(_City.city);
  void get country_id => _columns.add(_City.country_id);
  void get last_update => _columns.add(_City.last_update);

  @override
  String toString() {
    List<_City> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _City.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy{

  void city_id([ordType = OrdType.asc]){
    add(ColumnOrdenator('city.city_id', ordType));
  }
  void city([ordType = OrdType.asc]){
    add(ColumnOrdenator('city.city', ordType));
  }
  void country_id([ordType = OrdType.asc]){
    add(ColumnOrdenator('city.country_id', ordType));
  }
  void last_update([ordType = OrdType.asc]){
    add(ColumnOrdenator('city.last_update', ordType));
  }
}