///
//  Generated code. Do not modify.
//  source: rental.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SelectableColumns extends $pb.ProtobufEnum {
  static const SelectableColumns allColumns = SelectableColumns._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'allColumns');
  static const SelectableColumns rentalId = SelectableColumns._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rentalId');
  static const SelectableColumns rentalDate = SelectableColumns._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rentalDate');
  static const SelectableColumns inventoryId = SelectableColumns._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'inventoryId');
  static const SelectableColumns customerId = SelectableColumns._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'customerId');
  static const SelectableColumns returnDate = SelectableColumns._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'returnDate');
  static const SelectableColumns staffId = SelectableColumns._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'staffId');
  static const SelectableColumns lastUpdate = SelectableColumns._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lastUpdate');

  static const $core.List<SelectableColumns> values = <SelectableColumns> [
    allColumns,
    rentalId,
    rentalDate,
    inventoryId,
    customerId,
    returnDate,
    staffId,
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

