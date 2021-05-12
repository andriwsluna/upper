import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Category { category_id, name, last_update }

class _DataFields extends GenericDataFields {
  late final SerialField_PG _category_id;
  late final StringField_PG _name;
  late final DateTimeField_PG _last_update;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _category_id = SerialField_PG(this, 'category_id', true, true);
    _name = StringField_PG(this, 'name', true, false, 25);
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
    fields.add(_category_id);
    fields.add(_name);
    fields.add(_last_update);
  }
}

class Category_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get category_id => _dataFields._category_id;
  StringField_PG get name => _dataFields._name;
  DateTimeField_PG get last_update => _dataFields._last_update;

  Category_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'category', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Category_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'category', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Category_ORM.fromDataset(
      Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'category', _addRecord) {
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

  Future<Either<ErrorSqlResult, Category_ORM>> getCategoryWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Category_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int category_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._category_id)
            ..setValue(category_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int category_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._category_id)
            ..setValue(category_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('categoryId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._category_id)
              ..setValue(proto3Json['categoryId'])));
    } else {
      return left(ErrorSqlResult('Category_ORM', 'materializeFromProto3Json',
          '', ['Required fields not found']));
    }
  }
}

class _FilterCategoryId extends IntegerFilter {
  _FilterCategoryId() : super('category.category_id');
}

class _FilterName extends StringFilter {
  _FilterName() : super('category.name');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('category.last_update');
}

class Where extends OrmSelectWhere {
  final _category_id = _FilterCategoryId();
  final _name = _FilterName();
  final _last_update = _FilterLastUpdate();

  _FilterCategoryId get category_id => _category_id;
  _FilterName get name => _name;
  _FilterLastUpdate get last_update => _last_update;

  Where() {
    filters.add(_category_id);
    filters.add(_name);
    filters.add(_last_update);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Category>[];
  void get category_id => _columns.add(_Category.category_id);
  void get name => _columns.add(_Category.name);
  void get last_update => _columns.add(_Category.last_update);

  @override
  String toString() {
    List<_Category> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Category.values;
    }

    var col = ' ';
    list.forEach((element) {
      col += ', ' + element.toString().replaceFirst('_', '').toLowerCase();
    });
    return col.replaceFirst(', ', '');
  }
}

class OrderBy with GenericOrderBy {
  void category_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('category.category_id', ordType));
  }

  void name([ordType = OrdType.asc]) {
    add(ColumnOrdenator('category.name', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('category.last_update', ordType));
  }
}
