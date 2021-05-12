///
//  Generated code. Do not modify.
//  source: inventory.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SelectableColumns extends $pb.ProtobufEnum {
  static const SelectableColumns allColumns = SelectableColumns._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'allColumns');
  static const SelectableColumns inventoryId = SelectableColumns._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'inventoryId');
  static const SelectableColumns filmId = SelectableColumns._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'filmId');
  static const SelectableColumns storeId = SelectableColumns._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'storeId');
  static const SelectableColumns lastUpdate = SelectableColumns._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lastUpdate');

  static const $core.List<SelectableColumns> values = <SelectableColumns> [
    allColumns,
    inventoryId,
    filmId,
    storeId,
    lastUpdate,
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

