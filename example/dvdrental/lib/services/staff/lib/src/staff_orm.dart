import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Staff {
  staff_id,
  first_name,
  last_name,
  address_id,
  email,
  store_id,
  active,
  username,
  password,
  last_update,
  picture
}

class _DataFields extends GenericDataFields {
  late final SerialField_PG _staff_id;
  late final StringField_PG _first_name;
  late final StringField_PG _last_name;
  late final IntegerField_PG _address_id;
  late final StringField_PG _email;
  late final IntegerField_PG _store_id;
  late final BooleanField_PG _active;
  late final StringField_PG _username;
  late final StringField_PG _password;
  late final DateTimeField_PG _last_update;
  late final StringField_PG _picture;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _staff_id = SerialField_PG(this, 'staff_id', true, true);
    _first_name = StringField_PG(this, 'first_name', true, false, 45);
    _last_name = StringField_PG(this, 'last_name', true, false, 45);
    _address_id = IntegerField_PG(this, 'address_id', true, false);
    _email = StringField_PG(this, 'email', false, false, 50);
    _store_id = IntegerField_PG(this, 'store_id', true, false);
    _active = BooleanField_PG(this, 'active', true, false);
    _username = StringField_PG(this, 'username', true, false, 16);
    _password = StringField_PG(this, 'password', false, false, 40);
    _last_update = DateTimeField_PG(this, 'last_update', true, false);
    _picture = StringField_PG(this, 'picture', false, false, -1);
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
    fields.add(_staff_id);
    fields.add(_first_name);
    fields.add(_last_name);
    fields.add(_address_id);
    fields.add(_email);
    fields.add(_store_id);
    fields.add(_active);
    fields.add(_username);
    fields.add(_password);
    fields.add(_last_update);
    fields.add(_picture);
  }
}

class Staff_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get staff_id => _dataFields._staff_id;
  StringField_PG get first_name => _dataFields._first_name;
  StringField_PG get last_name => _dataFields._last_name;
  IntegerField_PG get address_id => _dataFields._address_id;
  StringField_PG get email => _dataFields._email;
  IntegerField_PG get store_id => _dataFields._store_id;
  BooleanField_PG get active => _dataFields._active;
  StringField_PG get username => _dataFields._username;
  StringField_PG get password => _dataFields._password;
  DateTimeField_PG get last_update => _dataFields._last_update;
  StringField_PG get picture => _dataFields._picture;

  Staff_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'staff', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Staff_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'staff', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Staff_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'staff', _addRecord) {
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

  Future<Either<ErrorSqlResult, Staff_ORM>> getStaffWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Staff_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int staff_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._staff_id)..setValue(staff_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int staff_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(
              SerialField_PG.clone(_dataFields._staff_id)..setValue(staff_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('staffId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._staff_id)
              ..setValue(proto3Json['staffId'])));
    } else {
      return left(ErrorSqlResult('Staff_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterStaffId extends IntegerFilter {
  _FilterStaffId() : super('staff.staff_id');
}

class _FilterFirstName extends StringFilter {
  _FilterFirstName() : super('staff.first_name');
}

class _FilterLastName extends StringFilter {
  _FilterLastName() : super('staff.last_name');
}

class _FilterAddressId extends IntegerFilter {
  _FilterAddressId() : super('staff.address_id');
}

class _FilterEmail extends StringFilter with NullableFilter {
  _FilterEmail() : super('staff.email');
}

class _FilterStoreId extends IntegerFilter {
  _FilterStoreId() : super('staff.store_id');
}

class _FilterActive extends BooleanFilter {
  _FilterActive() : super('staff.active');
}

class _FilterUsername extends StringFilter {
  _FilterUsername() : super('staff.username');
}

class _FilterPassword extends StringFilter with NullableFilter {
  _FilterPassword() : super('staff.password');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('staff.last_update');
}

class _FilterPicture extends StringFilter with NullableFilter {
  _FilterPicture() : super('staff.picture');
}

class Where extends OrmSelectWhere {
  final _staff_id = _FilterStaffId();
  final _first_name = _FilterFirstName();
  final _last_name = _FilterLastName();
  final _address_id = _FilterAddressId();
  final _email = _FilterEmail();
  final _store_id = _FilterStoreId();
  final _active = _FilterActive();
  final _username = _FilterUsername();
  final _password = _FilterPassword();
  final _last_update = _FilterLastUpdate();
  final _picture = _FilterPicture();

  _FilterStaffId get staff_id => _staff_id;
  _FilterFirstName get first_name => _first_name;
  _FilterLastName get last_name => _last_name;
  _FilterAddressId get address_id => _address_id;
  _FilterEmail get email => _email;
  _FilterStoreId get store_id => _store_id;
  _FilterActive get active => _active;
  _FilterUsername get username => _username;
  _FilterPassword get password => _password;
  _FilterLastUpdate get last_update => _last_update;
  _FilterPicture get picture => _picture;

  Where() {
    filters.add(_staff_id);
    filters.add(_first_name);
    filters.add(_last_name);
    filters.add(_address_id);
    filters.add(_email);
    filters.add(_store_id);
    filters.add(_active);
    filters.add(_username);
    filters.add(_password);
    filters.add(_last_update);
    filters.add(_picture);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Staff>[];
  void get staff_id => _columns.add(_Staff.staff_id);
  void get first_name => _columns.add(_Staff.first_name);
  void get last_name => _columns.add(_Staff.last_name);
  void get address_id => _columns.add(_Staff.address_id);
  void get email => _columns.add(_Staff.email);
  void get store_id => _columns.add(_Staff.store_id);
  void get active => _columns.add(_Staff.active);
  void get username => _columns.add(_Staff.username);
  void get password => _columns.add(_Staff.password);
  void get last_update => _columns.add(_Staff.last_update);
  void get picture => _columns.add(_Staff.picture);

  @override
  String toString() {
    List<_Staff> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Staff.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void staff_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.staff_id', ordType));
  }

  void first_name([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.first_name', ordType));
  }

  void last_name([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.last_name', ordType));
  }

  void address_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.address_id', ordType));
  }

  void email([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.email', ordType));
  }

  void store_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.store_id', ordType));
  }

  void active([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.active', ordType));
  }

  void username([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.username', ordType));
  }

  void password([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.password', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.last_update', ordType));
  }

  void picture([ordType = OrdType.asc]) {
    add(ColumnOrdenator('staff.picture', ordType));
  }
}
