import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'package:dartz/dartz.dart';
import 'package:data_db/data_db.dart';
import 'package:postgres/postgres.dart';
import 'package:static_postgres_orm/src/domain/orm_filter.dart';

enum _Film {
  film_id,
  title,
  description,
  release_year,
  language_id,
  rental_duration,
  rental_rate,
  length,
  replacement_cost,
  rating,
  last_update,
  special_features,
  fulltext,
  squares
}

class _DataFields extends GenericDataFields {
  late final SerialField_PG _film_id;
  late final StringField_PG _title;
  late final StringField_PG _description;
  late final IntegerField_PG _release_year;
  late final IntegerField_PG _language_id;
  late final IntegerField_PG _rental_duration;
  late final NumericField_PG _rental_rate;
  late final IntegerField_PG _length;
  late final NumericField_PG _replacement_cost;
  late final StringField_PG _rating;
  late final DateTimeField_PG _last_update;
  late final StringField_PG _special_features;
  late final StringField_PG _fulltext;
  late final StringField_PG _squares;

  _DataFields() : super() {
    fields = <GenericField>[];
    _createFields();
    _addFields();
  }

  _DataFields get _backup => getBackup(this) as _DataFields;
  set _backup(_DataFields v) => setBackup(this, v);

  void _createFields() {
    _film_id = SerialField_PG(this, 'film_id', true, true);
    _title = StringField_PG(this, 'title', true, false, 255);
    _description = StringField_PG(this, 'description', false, false, -1);
    _release_year = IntegerField_PG(this, 'release_year', false, false);
    _language_id = IntegerField_PG(this, 'language_id', true, false);
    _rental_duration = IntegerField_PG(this, 'rental_duration', true, false);
    _rental_rate = NumericField_PG(this, 'rental_rate', true, false);
    _length = IntegerField_PG(this, 'length', false, false);
    _replacement_cost = NumericField_PG(this, 'replacement_cost', true, false);
    _rating = StringField_PG(this, 'rating', false, false, -1);
    _last_update = DateTimeField_PG(this, 'last_update', true, false);
    _special_features =
        StringField_PG(this, 'special_features', false, false, -1);
    _fulltext = StringField_PG(this, 'fulltext', true, false, -1);
    _squares = StringField_PG(this, 'squares', false, false, -1);
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
    fields.add(_title);
    fields.add(_description);
    fields.add(_release_year);
    fields.add(_language_id);
    fields.add(_rental_duration);
    fields.add(_rental_rate);
    fields.add(_length);
    fields.add(_replacement_cost);
    fields.add(_rating);
    fields.add(_last_update);
    fields.add(_special_features);
    fields.add(_fulltext);
    fields.add(_squares);
  }
}

class Film_ORM extends PostgressORM {
  static final NewRecordEvent _addRecord = NewRecordEvent();
  _DataFields get _dataFields => getRecords(this)[rowIndex] as _DataFields;

  SerialField_PG get film_id => _dataFields._film_id;
  StringField_PG get title => _dataFields._title;
  StringField_PG get description => _dataFields._description;
  IntegerField_PG get release_year => _dataFields._release_year;
  IntegerField_PG get language_id => _dataFields._language_id;
  IntegerField_PG get rental_duration => _dataFields._rental_duration;
  NumericField_PG get rental_rate => _dataFields._rental_rate;
  IntegerField_PG get length => _dataFields._length;
  NumericField_PG get replacement_cost => _dataFields._replacement_cost;
  StringField_PG get rating => _dataFields._rating;
  DateTimeField_PG get last_update => _dataFields._last_update;
  StringField_PG get special_features => _dataFields._special_features;
  StringField_PG get fulltext => _dataFields._fulltext;
  StringField_PG get squares => _dataFields._squares;

  Film_ORM(Postgres_SqlConnection sqlConnection)
      : super(sqlConnection, 'public', 'film', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_ORM.fromConnection(PostgreSQLExecutionContext _pgConnection)
      : super.fromConnection(_pgConnection, 'public', 'film', _addRecord) {
    _addRecord.action = _executeAddRecord;
    getRecords(this).add(_DataFields());
  }

  Film_ORM.fromDataset(Postgres_SqlConnection sqlConnection, Dataset dataset)
      : super(sqlConnection, 'public', 'film', _addRecord) {
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

  Future<Either<ErrorSqlResult, Film_ORM>> getFilmWhere(
      OrmSelectWhere where) async {
    return (await sqlConnection.openQuery(
            'select', getSelectSql(Columns(), where, OrderBy())))
        .fold((l) => left(l), (r) {
      return right(Film_ORM.fromDataset(
          sqlConnection as Postgres_SqlConnection, r.dataset));
    });
  }

  GenericDataFields _executeAddRecord() => _DataFields();

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>> materialize(
      int film_id) async {
    return getMaterialize(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._film_id)..setValue(film_id)));
  }

  Future<Either<ErrorSqlResult, ExecuteSuccesSqlResult>> deleteRecord(
      int film_id) async {
    return getDeleteRecord(
        this,
        (<GenericField>[])
          ..add(SerialField_PG.clone(_dataFields._film_id)..setValue(film_id)));
  }

  Future<Either<ErrorSqlResult, SelectSuccesSqlResult>>
      materializeFromProto3Json(Map<String, dynamic> proto3Json) async {
    if ((proto3Json.containsKey('filmId'))) {
      return getMaterialize(
          this,
          (<GenericField>[])
            ..add(SerialField_PG.clone(_dataFields._film_id)
              ..setValue(proto3Json['filmId'])));
    } else {
      return left(ErrorSqlResult('Film_ORM', 'materializeFromProto3Json', '',
          ['Required fields not found']));
    }
  }
}

class _FilterFilmId extends IntegerFilter {
  _FilterFilmId() : super('film.film_id');
}

class _FilterTitle extends StringFilter {
  _FilterTitle() : super('film.title');
}

class _FilterDescription extends StringFilter with NullableFilter {
  _FilterDescription() : super('film.description');
}

class _FilterReleaseYear extends IntegerFilter with NullableFilter {
  _FilterReleaseYear() : super('film.release_year');
}

class _FilterLanguageId extends IntegerFilter {
  _FilterLanguageId() : super('film.language_id');
}

class _FilterRentalDuration extends IntegerFilter {
  _FilterRentalDuration() : super('film.rental_duration');
}

class _FilterRentalRate extends NumericFilter {
  _FilterRentalRate() : super('film.rental_rate');
}

class _FilterLength extends IntegerFilter with NullableFilter {
  _FilterLength() : super('film.length');
}

class _FilterReplacementCost extends NumericFilter {
  _FilterReplacementCost() : super('film.replacement_cost');
}

class _FilterRating extends StringFilter with NullableFilter {
  _FilterRating() : super('film.rating');
}

class _FilterLastUpdate extends DateTimeFilter {
  _FilterLastUpdate() : super('film.last_update');
}

class _FilterSpecialFeatures extends StringFilter with NullableFilter {
  _FilterSpecialFeatures() : super('film.special_features');
}

class _FilterFulltext extends StringFilter {
  _FilterFulltext() : super('film.fulltext');
}

class _FilterSquares extends StringFilter with NullableFilter {
  _FilterSquares() : super('film.squares');
}

class Where extends OrmSelectWhere {
  final _film_id = _FilterFilmId();
  final _title = _FilterTitle();
  final _description = _FilterDescription();
  final _release_year = _FilterReleaseYear();
  final _language_id = _FilterLanguageId();
  final _rental_duration = _FilterRentalDuration();
  final _rental_rate = _FilterRentalRate();
  final _length = _FilterLength();
  final _replacement_cost = _FilterReplacementCost();
  final _rating = _FilterRating();
  final _last_update = _FilterLastUpdate();
  final _special_features = _FilterSpecialFeatures();
  final _fulltext = _FilterFulltext();
  final _squares = _FilterSquares();

  _FilterFilmId get film_id => _film_id;
  _FilterTitle get title => _title;
  _FilterDescription get description => _description;
  _FilterReleaseYear get release_year => _release_year;
  _FilterLanguageId get language_id => _language_id;
  _FilterRentalDuration get rental_duration => _rental_duration;
  _FilterRentalRate get rental_rate => _rental_rate;
  _FilterLength get length => _length;
  _FilterReplacementCost get replacement_cost => _replacement_cost;
  _FilterRating get rating => _rating;
  _FilterLastUpdate get last_update => _last_update;
  _FilterSpecialFeatures get special_features => _special_features;
  _FilterFulltext get fulltext => _fulltext;
  _FilterSquares get squares => _squares;

  Where() {
    filters.add(_film_id);
    filters.add(_title);
    filters.add(_description);
    filters.add(_release_year);
    filters.add(_language_id);
    filters.add(_rental_duration);
    filters.add(_rental_rate);
    filters.add(_length);
    filters.add(_replacement_cost);
    filters.add(_rating);
    filters.add(_last_update);
    filters.add(_special_features);
    filters.add(_fulltext);
    filters.add(_squares);
  }
}

class Columns implements OrmSelectableColumns {
  final _columns = <_Film>[];
  void get film_id => _columns.add(_Film.film_id);
  void get title => _columns.add(_Film.title);
  void get description => _columns.add(_Film.description);
  void get release_year => _columns.add(_Film.release_year);
  void get language_id => _columns.add(_Film.language_id);
  void get rental_duration => _columns.add(_Film.rental_duration);
  void get rental_rate => _columns.add(_Film.rental_rate);
  void get length => _columns.add(_Film.length);
  void get replacement_cost => _columns.add(_Film.replacement_cost);
  void get rating => _columns.add(_Film.rating);
  void get last_update => _columns.add(_Film.last_update);
  void get special_features => _columns.add(_Film.special_features);
  void get fulltext => _columns.add(_Film.fulltext);
  void get squares => _columns.add(_Film.squares);

  @override
  String toString() {
    List<_Film> list;

    if (_columns.isNotEmpty) {
      list = _columns;
    } else {
      list = _Film.values;
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
    add(ColumnOrdenator('film.film_id', ordType));
  }

  void title([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.title', ordType));
  }

  void description([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.description', ordType));
  }

  void release_year([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.release_year', ordType));
  }

  void language_id([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.language_id', ordType));
  }

  void rental_duration([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.rental_duration', ordType));
  }

  void rental_rate([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.rental_rate', ordType));
  }

  void length([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.length', ordType));
  }

  void replacement_cost([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.replacement_cost', ordType));
  }

  void rating([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.rating', ordType));
  }

  void last_update([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.last_update', ordType));
  }

  void special_features([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.special_features', ordType));
  }

  void fulltext([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.fulltext', ordType));
  }

  void squares([ordType = OrdType.asc]) {
    add(ColumnOrdenator('film.squares', ordType));
  }
}
