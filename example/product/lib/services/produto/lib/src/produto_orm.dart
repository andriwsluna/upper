import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Produto {
  id,
  code,
  description,
  is_active,
  price,
  full_description,
  insert_date,
  update_date
}

class _DataFields extends GenericDataFields {
  late final IntegerField_PG _id;
  late final StringField_PG _code;
  late final StringField_PG _description;
  late final BooleanField_PG _is_active;
  late final NumericField_PG _price;
  late final StringField_PG _full_description;
  late final DateField_PG _insert_date;
  late final DateTimeField_PG _update_date;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _id = IntegerField_PG(this, 'id', true, true);
    _code = StringField_PG(this, 'code', false, false, 50);
    _description = StringField_PG(this, 'description', false, false, 200);
    _is_active = BooleanField_PG(this, 'is_active', false, false);
    _price = NumericField_PG(this, 'price', false, false);
    _full_description =
        StringField_PG(this, 'full_description', false, false, -1);
    _insert_date = DateField_PG(this, 'insert_date', false, false);
    _update_date = DateTimeField_PG(this, 'update_date', false, false);
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
    fields.add(_id);
    fields.add(_code);
    fields.add(_description);
    fields.add(_is_active);
    fields.add(_price);
    fields.add(_full_description);
    fields.add(_insert_date);
    fields.add(_update_date);
  }
}

class Produto_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  IntegerField_PG get id => _dataFields._id;
  StringField_PG get code => _dataFields._code;
  StringField_PG get description => _dataFields._description;
  BooleanField_PG get is_active => _dataFields._is_active;
  NumericField_PG get price => _dataFields._price;
  StringField_PG get full_description => _dataFields._full_description;
  DateField_PG get insert_date => _dataFields._insert_date;
  DateTimeField_PG get update_date => _dataFields._update_date;

  Produto_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'produto', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Produto_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'produto', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Produto_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'produto', _addRecord) {
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

  Future<Either<ErrorSqlResult, Produto_ORM>> getProdutoWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Produto_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(IntegerField_PG.clone(_dataFields._id)..setValue(id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(IntegerField_PG.clone(_dataFields._id)..setValue(id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('id'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(IntegerField_PG.clone(_dataFields._id)
              ..setValue(proto3Json['id'])));
    } else {
      return left(ErrorSqlResult('Produto_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterId extends IntegerFilter {
  _FilterId() : super('produto.id');
}

class _FilterCode extends StringFilter with NullableFilter {
  _FilterCode() : super('produto.code');
}

class _FilterDescription extends StringFilter with NullableFilter {
  _FilterDescription() : super('produto.description');
}

class _FilterIsActive extends BooleanFilter with NullableFilter {
  _FilterIsActive() : super('produto.is_active');
}

class _FilterPrice extends NumericFilter with NullableFilter {
  _FilterPrice() : super('produto.price');
}

class _FilterFullDescription extends StringFilter with NullableFilter {
  _FilterFullDescription() : super('produto.full_description');
}

class _FilterInsertDate extends DateFilter with NullableFilter {
  _FilterInsertDate() : super('produto.insert_date');
}

class _FilterUpdateDate extends DateTimeFilter with NullableFilter {
  _FilterUpdateDate() : super('produto.update_date');
}

class Where extends OrmSelectWhere {
  final _id = _FilterId();
  final _code = _FilterCode();
  final _description = _FilterDescription();
  final _is_active = _FilterIsActive();
  final _price = _FilterPrice();
  final _full_description = _FilterFullDescription();
  final _insert_date = _FilterInsertDate();
  final _update_date = _FilterUpdateDate();

  _FilterId get id => _id;
  _FilterCode get code => _code;
  _FilterDescription get description => _description;
  _FilterIsActive get is_active => _is_active;
  _FilterPrice get price => _price;
  _FilterFullDescription get full_description => _full_description;
  _FilterInsertDate get insert_date => _insert_date;
  _FilterUpdateDate get update_date => _update_date;

  Where() {
    filters.add(_id);
    filters.add(_code);
    filters.add(_description);
    filters.add(_is_active);
    filters.add(_price);
    filters.add(_full_description);
    filters.add(_insert_date);
    filters.add(_update_date);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Produto>[];
  void get id => _columns.add(_Produto.id);
  void get code => _columns.add(_Produto.code);
  void get description => _columns.add(_Produto.description);
  void get is_active => _columns.add(_Produto.is_active);
  void get price => _columns.add(_Produto.price);
  void get full_description => _columns.add(_Produto.full_description);
  void get insert_date => _columns.add(_Produto.insert_date);
  void get update_date => _columns.add(_Produto.update_date);

  @override
  String toString() {
    List<_Produto> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Produto.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.id', ordType));
  }

  void code([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.code', ordType));
  }

  void description([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.description', ordType));
  }

  void is_active([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.is_active', ordType));
  }

  void price([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.price', ordType));
  }

  void full_description([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.full_description', ordType));
  }

  void insert_date([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.insert_date', ordType));
  }

  void update_date([ordType = OrdType.asc]) {
    add(ColumnOrdenator('produto.update_date', ordType));
  }
}
