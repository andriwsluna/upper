///
//  Generated code. Do not modify.
//  source: film.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SelectableColumns extends $pb.ProtobufEnum {
  static const SelectableColumns allColumns = SelectableColumns._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'allColumns');
  static const SelectableColumns filmId = SelectableColumns._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'filmId');
  static const SelectableColumns title = SelectableColumns._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'title');
  static const SelectableColumns description = SelectableColumns._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'description');
  static const SelectableColumns releaseYear = SelectableColumns._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'releaseYear');
  static const SelectableColumns languageId = SelectableColumns._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'languageId');
  static const SelectableColumns rentalDuration = SelectableColumns._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rentalDuration');
  static const SelectableColumns rentalRate = SelectableColumns._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rentalRate');
  static const SelectableColumns length = SelectableColumns._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'length');
  static const SelectableColumns replacementCost = SelectableColumns._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'replacementCost');
  static const SelectableColumns rating = SelectableColumns._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rating');
  static const SelectableColumns lastUpdate = SelectableColumns._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lastUpdate');
  static const SelectableColumns specialFeatures = SelectableColumns._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'specialFeatures');
  static const SelectableColumns fulltext = SelectableColumns._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fulltext');
  static const SelectableColumns squares = SelectableColumns._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'squares');

  static const $core.List<SelectableColumns> values = <SelectableColumns> [
    allColumns,
    filmId,
    title,
    description,
    releaseYear,
    languageId,
    rentalDuration,
    rentalRate,
    length,
    replacementCost,
    rating,
    lastUpdate,
    specialFeatures,
    fulltext,
    squares,
  ];

  static final $core.Map<$core.int, SelectableColumns> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SelectableColumns? valueOf($core.int value) => _byValue[value];

  const SelectableColumns._($core.int v, $core.String n) : super(v, n);
}

class OrderType extends $pb.ProtobufEnum {
  static const OrderType asc = OrderType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'asc');
  static const OrderType desc = OrderType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc');

  static const $core.List<OrderType> values = <OrderType> [
    asc,
    desc,
  ];

  static final $core.Map<$core.int, OrderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OrderType? valueOf($core.int value) => _byValue[value];

  const OrderType._($core.int v, $core.String n) : super(v, n);
}

