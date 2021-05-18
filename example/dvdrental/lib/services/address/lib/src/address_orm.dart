import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Address {
  address_id,
  address,
  address2,
  district,
  city_id,
  postal_code,
  phone,
  last_update
}

class _DataFields extends GenericDataFields {
  late final SerialField_PG _address_id;
  late final StringField_PG _address;
  late final StringField_PG _address2;
  late final StringField_PG _district;
  late final IntegerField_PG _city_id;
  late final StringField_PG _postal_code;
  late final StringField_PG _phone;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _address_id = SerialField_PG(this, 'address_id', true, true);
    _address = StringField_PG(this, 'address', true, false, 50);
    _address2 = StringField_PG(this, 'address2', false, false, 50);
    _district = StringField_PG(this, 'district', true, false, 20);
    _city_id = IntegerField_PG(this, 'city_id', true, false);
    _postal_code = StringField_PG(this, 'postal_code', false, false, 10);
    _phone = StringField_PG(this, 'phone', true, false, 20);
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
    fields.add(_address_id);
    fields.add(_address);
    fields.add(_address2);
    fields.add(_district);
    fields.add(_city_id);
    fields.add(_postal_code);
    fields.add(_phone);
    fields.add(_last_update);
  }
}

class Address_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get address_id => _dataFields._address_id;
  StringField_PG get address => _dataFields._address;
  StringField_PG get address2 => _dataFields._address2;
  StringField_PG get district => _dataFields._district;
  IntegerField_PG get city_id => _dataFields._city_id;
  StringField_PG get postal_code => _dataFields._postal_code;
  StringField_PG get phone => _dataFields._phone;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Address_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'address', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Address_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'address', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Address_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'address', _addRecord) {
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

  Future<Either<ErrorSqlResult, Address_ORM>> getAddressWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Address_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int address_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._address_id)
            ..setValue(address_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int address_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._address_id)
            ..setValue(address_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('addressId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._address_id)
              ..setValue(proto3Json['addressId'])));
    } else {
      return left(ErrorSqlResult('Address_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterAddressId extends IntegerFilter {
  _FilterAddressId() : super('address.address_id');
}

class _FilterAddress extends StringFilter {
  _FilterAddress() : super('address.address');
}

class _FilterAddress2 extends StringFilter with NullableFilter {
  _FilterAddress2() : super('address.address2');
}

class _FilterDistrict extends StringFilter {
  _FilterDistrict() : super('address.district');
}

class _FilterCityId extends IntegerFilter {
  _FilterCityId() : super('address.city_id');
}

class _FilterPostalCode extends StringFilter with NullableFilter {
  _FilterPostalCode() : super('address.postal_code');
}

class _FilterPhone extends StringFilter {
  _FilterPhone() : super('address.phone');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('address.last_update');
}

class Where extends OrmSelectWhere {
  final _address_id = _FilterAddressId();
  final _address = _FilterAddress();
  final _address2 = _FilterAddress2();
  final _district = _FilterDistrict();
  final _city_id = _FilterCityId();
  final _postal_code = _FilterPostalCode();
  final _phone = _FilterPhone();
  final _last_update = _FilterLastUpdate();

  _FilterAddressId get address_id => _address_id;
  _FilterAddress get address => _address;
  _FilterAddress2 get address2 => _address2;
  _FilterDistrict get district => _district;
  _FilterCityId get city_id => _city_id;
  _FilterPostalCode get postal_code => _postal_code;
  _FilterPhone get phone => _phone;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_address_id);
    filters.add(_address);
    filters.add(_address2);
    filters.add(_district);
    filters.add(_city_id);
    filters.add(_postal_code);
    filters.add(_phone);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Address>[];
  void get address_id => _columns.add(_Address.address_id);
  void get address => _columns.add(_Address.address);
  void get address2 => _columns.add(_Address.address2);
  void get district => _columns.add(_Address.district);
  void get city_id => _columns.add(_Address.city_id);
  void get postal_code => _columns.add(_Address.postal_code);
  void get phone => _columns.add(_Address.phone);
  void get last_update => _columns.add(_Address.last_update);

  @override
  String toString() {
    List<_Address> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Address.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void address_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.address_id', ordType));
  }

  void address([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.address', ordType));
  }

  void address2([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.address2', ordType));
  }

  void district([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.district', ordType));
  }

  void city_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.city_id', ordType));
  }

  void postal_code([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.postal_code', ordType));
  }

  void phone([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.phone', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('address.last_update', ordType));
  }
}
