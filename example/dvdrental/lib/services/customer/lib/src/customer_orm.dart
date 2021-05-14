import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Customer {
  customer_id
  ,store_id
  ,first_name
  ,last_name
  ,email
  ,address_id
  ,activebool
  ,create_date
  ,last_update
  ,active
}

class _DataFields extends GenericDataFields {

  late final SerialField_PG _customer_id;
  late final IntegerField_PG _store_id;
  late final StringField_PG _first_name;
  late final StringField_PG _last_name;
  late final StringField_PG _email;
  late final IntegerField_PG _address_id;
  late final BooleanField_PG _activebool;
  late final DateField_PG _create_date;
  late final DateTimeField_PG _last_update;
  late final IntegerField_PG _active;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _customer_id = SerialField_PG(this, 'customer_id', true, true);
    _store_id = IntegerField_PG(this, 'store_id', true, false);
    _first_name = StringField_PG(this, 'first_name', true, false, 45);
    _last_name = StringField_PG(this, 'last_name', true, false, 45);
    _email = StringField_PG(this, 'email', false, false, 50);
    _address_id = IntegerField_PG(this, 'address_id', true, false);
    _activebool = BooleanField_PG(this, 'activebool', true, false);
    _create_date = DateField_PG(this, 'create_date', true, false);
    _last_update = DateTimeField_PG(this, 'last_update', false, false);
    _active = IntegerField_PG(this, 'active', false, false);
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
    fields.add(_customer_id);
    fields.add(_store_id);
    fields.add(_first_name);
    fields.add(_last_name);
    fields.add(_email);
    fields.add(_address_id);
    fields.add(_activebool);
    fields.add(_create_date);
    fields.add(_last_update);
    fields.add(_active);
  }
}

class Customer_ORM extends PostgressORM{
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;


  SerialField_PG get customer_id => _dataFields._customer_id;
  IntegerField_PG get store_id => _dataFields._store_id;
  StringField_PG get first_name => _dataFields._first_name;
  StringField_PG get last_name => _dataFields._last_name;
  StringField_PG get email => _dataFields._email;
  IntegerField_PG get address_id => _dataFields._address_id;
  BooleanField_PG get activebool => _dataFields._activebool;
  DateField_PG get create_date => _dataFields._create_date;
  DateTimeField_PG get last_update => _dataFields._last_update;
  IntegerField_PG get active => _dataFields._active;

  Customer_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'customer', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Customer_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'customer', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Customer_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'customer', _addRecord) {
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

  Future<Either<ErrorSqlResult, Customer_ORM>> getCustomerWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Customer_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int customer_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._customer_id)
            ..setValue(customer_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
    int customer_id) async{
    return getDeleteRecord(
         this,
         (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._customer_id)
            ..setValue(customer_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
    materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
  if (
      (proto3Json.containsKey('customerId'))) {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._customer_id)
            ..setValue(proto3Json['customerId'])));
  } else {
      return left(ErrorSqlResult('Customer_ORM', 'materializeFromProto3Json', '',
           ['Required fields not found']));
  }
  } 
}

class _FilterCustomerId extends IntegerFilter {
  _FilterCustomerId() : super('customer.customer_id');
}
class _FilterStoreId extends IntegerFilter {
  _FilterStoreId() : super('customer.store_id');
}
class _FilterFirstName extends StringFilter {
  _FilterFirstName() : super('customer.first_name');
}
class _FilterLastName extends StringFilter {
  _FilterLastName() : super('customer.last_name');
}
class _FilterEmail extends StringFilter with NullableFilter {
  _FilterEmail() : super('customer.email');
}
class _FilterAddressId extends IntegerFilter {
  _FilterAddressId() : super('customer.address_id');
}
class _FilterActivebool extends BooleanFilter {
  _FilterActivebool() : super('customer.activebool');
}
class _FilterCreateDate extends DateFilter {
  _FilterCreateDate() : super('customer.create_date');
}
class _FilterLastUpdate extends DateTimeFilter with NullableFilter {
  _FilterLastUpdate() : super('customer.last_update');
}
class _FilterActive extends IntegerFilter with NullableFilter {
  _FilterActive() : super('customer.active');
}

class Where extends OrmSelectWhere {
  final _customer_id = _FilterCustomerId();
  final _store_id = _FilterStoreId();
  final _first_name = _FilterFirstName();
  final _last_name = _FilterLastName();
  final _email = _FilterEmail();
  final _address_id = _FilterAddressId();
  final _activebool = _FilterActivebool();
  final _create_date = _FilterCreateDate();
  final _last_update = _FilterLastUpdate();
  final _active = _FilterActive();

  _FilterCustomerId get customer_id => _customer_id;
  _FilterStoreId get store_id => _store_id;
  _FilterFirstName get first_name => _first_name;
  _FilterLastName get last_name => _last_name;
  _FilterEmail get email => _email;
  _FilterAddressId get address_id => _address_id;
  _FilterActivebool get activebool => _activebool;
  _FilterCreateDate get create_date => _create_date;
  _FilterLastUpdate get last_update => _last_update;
  _FilterActive get active => _active;

  Where() {
    filters.add(_customer_id);
    filters.add(_store_id);
    filters.add(_first_name);
    filters.add(_last_name);
    filters.add(_email);
    filters.add(_address_id);
    filters.add(_activebool);
    filters.add(_create_date);
    filters.add(_last_update);
    filters.add(_active);
  }

}
class Columns implements OrmSelectableColumns {
  final _columns = <_Customer>[];
  void get customer_id => _columns.add(_Customer.customer_id);
  void get store_id => _columns.add(_Customer.store_id);
  void get first_name => _columns.add(_Customer.first_name);
  void get last_name => _columns.add(_Customer.last_name);
  void get email => _columns.add(_Customer.email);
  void get address_id => _columns.add(_Customer.address_id);
  void get activebool => _columns.add(_Customer.activebool);
  void get create_date => _columns.add(_Customer.create_date);
  void get last_update => _columns.add(_Customer.last_update);
  void get active => _columns.add(_Customer.active);

  @override
  String toString() {
    List<_Customer> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Customer.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy{

  void customer_id([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.customer_id', ordType));
  }
  void store_id([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.store_id', ordType));
  }
  void first_name([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.first_name', ordType));
  }
  void last_name([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.last_name', ordType));
  }
  void email([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.email', ordType));
  }
  void address_id([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.address_id', ordType));
  }
  void activebool([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.activebool', ordType));
  }
  void create_date([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.create_date', ordType));
  }
  void last_update([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.last_update', ordType));
  }
  void active([ordType = OrdType.asc]){
    add(ColumnOrdenator('customer.active', ordType));
  }
}