///
//  Generated code. Do not modify.
//  source: customer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use selectableColumnsDescriptor instead')
const SelectableColumns$json = const {
  '1': 'SelectableColumns',
  '2': const [
    const {'1': 'allColumns', '2': 0},
    const {'1': 'customerId', '2': 1},
    const {'1': 'storeId', '2': 2},
    const {'1': 'firstName', '2': 3},
    const {'1': 'lastName', '2': 4},
    const {'1': 'email', '2': 5},
    const {'1': 'addressId', '2': 6},
    const {'1': 'activebool', '2': 7},
    const {'1': 'createDate', '2': 8},
    const {'1': 'lastUpdate', '2': 9},
    const {'1': 'active', '2': 10},
  ],
};

/// Descriptor for `SelectableColumns`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectableColumnsDescriptor = $convert.base64Decode('ChFTZWxlY3RhYmxlQ29sdW1ucxIOCgphbGxDb2x1bW5zEAASDgoKY3VzdG9tZXJJZBABEgsKB3N0b3JlSWQQAhINCglmaXJzdE5hbWUQAxIMCghsYXN0TmFtZRAEEgkKBWVtYWlsEAUSDQoJYWRkcmVzc0lkEAYSDgoKYWN0aXZlYm9vbBAHEg4KCmNyZWF0ZURhdGUQCBIOCgpsYXN0VXBkYXRlEAkSCgoGYWN0aXZlEAo=');
@$core.Deprecated('Use orderTypeDescriptor instead')
const OrderType$json = const {
  '1': 'OrderType',
  '2': const [
    const {'1': 'asc', '2': 0},
    const {'1': 'desc', '2': 1},
  ],
};

/// Descriptor for `OrderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderTypeDescriptor = $convert.base64Decode('CglPcmRlclR5cGUSBwoDYXNjEAASCAoEZGVzYxAB');
@$core.Deprecated('Use integerValueDescriptor instead')
const IntegerValue$json = const {
  '1': 'IntegerValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `IntegerValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List integerValueDescriptor = $convert.base64Decode('CgxJbnRlZ2VyVmFsdWUSFAoFdmFsdWUYASABKAVSBXZhbHVl');
@$core.Deprecated('Use stringValueDescriptor instead')
const StringValue$json = const {
  '1': 'StringValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `StringValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringValueDescriptor = $convert.base64Decode('CgtTdHJpbmdWYWx1ZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use numericValueDescriptor instead')
const NumericValue$json = const {
  '1': 'NumericValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `NumericValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numericValueDescriptor = $convert.base64Decode('CgxOdW1lcmljVmFsdWUSFAoFdmFsdWUYASABKAFSBXZhbHVl');
@$core.Deprecated('Use booleanValueDescriptor instead')
const BooleanValue$json = const {
  '1': 'BooleanValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `BooleanValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List booleanValueDescriptor = $convert.base64Decode('CgxCb29sZWFuVmFsdWUSFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use getRequestDescriptor instead')
const GetRequest$json = const {
  '1': 'GetRequest',
  '2': const [
    const {'1': 'customerId', '3': 1, '4': 1, '5': 5, '10': 'customerId'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor = $convert.base64Decode('CgpHZXRSZXF1ZXN0Eh4KCmN1c3RvbWVySWQYASABKAVSCmN1c3RvbWVySWQ=');
@$core.Deprecated('Use getResponseDescriptor instead')
const GetResponse$json = const {
  '1': 'GetResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.Customer', '9': 0, '10': 'data'},
    const {'1': 'errorMessage', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'errorMessage'},
  ],
  '8': const [
    const {'1': 'GetResponseResult'},
  ],
};

/// Descriptor for `GetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponseDescriptor = $convert.base64Decode('CgtHZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBI0CgRkYXRhGAIgASgLMh4uc3RhdGljX2dycGMuY3VzdG9tZXIuQ3VzdG9tZXJIAFIEZGF0YRIkCgxlcnJvck1lc3NhZ2UYAyABKAlIAFIMZXJyb3JNZXNzYWdlQhMKEUdldFJlc3BvbnNlUmVzdWx0');
@$core.Deprecated('Use insertRequestDescriptor instead')
const InsertRequest$json = const {
  '1': 'InsertRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.customer.CustomerToInsert', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.InsertOptions', '10': 'options'},
  ],
};

/// Descriptor for `InsertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRequestDescriptor = $convert.base64Decode('Cg1JbnNlcnRSZXF1ZXN0EjoKBGRhdGEYASADKAsyJi5zdGF0aWNfZ3JwYy5jdXN0b21lci5DdXN0b21lclRvSW5zZXJ0UgRkYXRhEj0KB29wdGlvbnMYAiABKAsyIy5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnNlcnRPcHRpb25zUgdvcHRpb25z');
@$core.Deprecated('Use insertOptionsDescriptor instead')
const InsertOptions$json = const {
  '1': 'InsertOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `InsertOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertOptionsDescriptor = $convert.base64Decode('Cg1JbnNlcnRPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use insertResponseDescriptor instead')
const InsertResponse$json = const {
  '1': 'InsertResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'rowsToInsert', '3': 2, '4': 1, '5': 5, '10': 'rowsToInsert'},
    const {'1': 'rowsInserted', '3': 3, '4': 1, '5': 5, '10': 'rowsInserted'},
    const {'1': 'errorMessage', '3': 4, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `InsertResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertResponseDescriptor = $convert.base64Decode('Cg5JbnNlcnRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9JbnNlcnQYAiABKAVSDHJvd3NUb0luc2VydBIiCgxyb3dzSW5zZXJ0ZWQYAyABKAVSDHJvd3NJbnNlcnRlZBIiCgxlcnJvck1lc3NhZ2UYBCADKAlSDGVycm9yTWVzc2FnZQ==');
@$core.Deprecated('Use updateRequestDescriptor instead')
const UpdateRequest$json = const {
  '1': 'UpdateRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.customer.Customer', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.UpdateOptions', '10': 'options'},
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode('Cg1VcGRhdGVSZXF1ZXN0EjIKBGRhdGEYASADKAsyHi5zdGF0aWNfZ3JwYy5jdXN0b21lci5DdXN0b21lclIEZGF0YRI9CgdvcHRpb25zGAIgASgLMiMuc3RhdGljX2dycGMuY3VzdG9tZXIuVXBkYXRlT3B0aW9uc1IHb3B0aW9ucw==');
@$core.Deprecated('Use updateOptionsDescriptor instead')
const UpdateOptions$json = const {
  '1': 'UpdateOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `UpdateOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOptionsDescriptor = $convert.base64Decode('Cg1VcGRhdGVPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use updateResponseDescriptor instead')
const UpdateResponse$json = const {
  '1': 'UpdateResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'rowsToUpdate', '3': 2, '4': 1, '5': 5, '10': 'rowsToUpdate'},
    const {'1': 'rowsUpdated', '3': 3, '4': 1, '5': 5, '10': 'rowsUpdated'},
    const {'1': 'errorMessage', '3': 4, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `UpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateResponseDescriptor = $convert.base64Decode('Cg5VcGRhdGVSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9VcGRhdGUYAiABKAVSDHJvd3NUb1VwZGF0ZRIgCgtyb3dzVXBkYXRlZBgDIAEoBVILcm93c1VwZGF0ZWQSIgoMZXJyb3JNZXNzYWdlGAQgAygJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use deleteRequestDescriptor instead')
const DeleteRequest$json = const {
  '1': 'DeleteRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.customer.CustomerPk', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.DeleteOptions', '10': 'options'},
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode('Cg1EZWxldGVSZXF1ZXN0EjQKBGRhdGEYASADKAsyIC5zdGF0aWNfZ3JwYy5jdXN0b21lci5DdXN0b21lclBrUgRkYXRhEj0KB29wdGlvbnMYAiABKAsyIy5zdGF0aWNfZ3JwYy5jdXN0b21lci5EZWxldGVPcHRpb25zUgdvcHRpb25z');
@$core.Deprecated('Use deleteOptionsDescriptor instead')
const DeleteOptions$json = const {
  '1': 'DeleteOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `DeleteOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOptionsDescriptor = $convert.base64Decode('Cg1EZWxldGVPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use deleteResponseDescriptor instead')
const DeleteResponse$json = const {
  '1': 'DeleteResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'rowsToDelete', '3': 2, '4': 1, '5': 5, '10': 'rowsToDelete'},
    const {'1': 'rowsDeleted', '3': 3, '4': 1, '5': 5, '10': 'rowsDeleted'},
    const {'1': 'errorMessage', '3': 4, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `DeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResponseDescriptor = $convert.base64Decode('Cg5EZWxldGVSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9EZWxldGUYAiABKAVSDHJvd3NUb0RlbGV0ZRIgCgtyb3dzRGVsZXRlZBgDIAEoBVILcm93c0RlbGV0ZWQSIgoMZXJyb3JNZXNzYWdlGAQgAygJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use selectRequestDescriptor instead')
const SelectRequest$json = const {
  '1': 'SelectRequest',
  '2': const [
    const {'1': 'columns', '3': 1, '4': 3, '5': 14, '6': '.static_grpc.customer.SelectableColumns', '10': 'columns'},
    const {'1': 'where', '3': 2, '4': 1, '5': 9, '10': 'where'},
    const {'1': 'orderBy', '3': 3, '4': 3, '5': 11, '6': '.static_grpc.customer.OrderByOperator', '10': 'orderBy'},
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SelectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectRequestDescriptor = $convert.base64Decode('Cg1TZWxlY3RSZXF1ZXN0EkEKB2NvbHVtbnMYASADKA4yJy5zdGF0aWNfZ3JwYy5jdXN0b21lci5TZWxlY3RhYmxlQ29sdW1uc1IHY29sdW1ucxIUCgV3aGVyZRgCIAEoCVIFd2hlcmUSPwoHb3JkZXJCeRgDIAMoCzIlLnN0YXRpY19ncnBjLmN1c3RvbWVyLk9yZGVyQnlPcGVyYXRvclIHb3JkZXJCeRIUCgVsaW1pdBgEIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAUgASgFUgZvZmZzZXQ=');
@$core.Deprecated('Use selectResponseDescriptor instead')
const SelectResponse$json = const {
  '1': 'SelectResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'rowsSelected', '3': 2, '4': 1, '5': 5, '10': 'rowsSelected'},
    const {'1': 'totalRowsCount', '3': 3, '4': 1, '5': 5, '10': 'totalRowsCount'},
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'nextOffset', '3': 6, '4': 1, '5': 5, '10': 'nextOffset'},
    const {'1': 'data', '3': 7, '4': 3, '5': 11, '6': '.static_grpc.customer.Customer', '10': 'data'},
    const {'1': 'errorMessage', '3': 8, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SelectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectResponseDescriptor = $convert.base64Decode('Cg5TZWxlY3RSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzU2VsZWN0ZWQYAiABKAVSDHJvd3NTZWxlY3RlZBImCg50b3RhbFJvd3NDb3VudBgDIAEoBVIOdG90YWxSb3dzQ291bnQSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0Eh4KCm5leHRPZmZzZXQYBiABKAVSCm5leHRPZmZzZXQSMgoEZGF0YRgHIAMoCzIeLnN0YXRpY19ncnBjLmN1c3RvbWVyLkN1c3RvbWVyUgRkYXRhEiIKDGVycm9yTWVzc2FnZRgIIAMoCVIMZXJyb3JNZXNzYWdl');
@$core.Deprecated('Use customerDescriptor instead')
const Customer$json = const {
  '1': 'Customer',
  '2': const [
    const {'1': 'customerId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'customerId'},
    const {'1': 'storeId', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'storeId'},
    const {'1': 'firstName', '3': 3, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'firstName'},
    const {'1': 'lastName', '3': 4, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'lastName'},
    const {'1': 'email', '3': 5, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'email'},
    const {'1': 'addressId', '3': 6, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'addressId'},
    const {'1': 'activebool', '3': 7, '4': 1, '5': 11, '6': '.static_grpc.customer.BooleanValue', '10': 'activebool'},
    const {'1': 'createDate', '3': 8, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'createDate'},
    const {'1': 'lastUpdate', '3': 9, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'lastUpdate'},
    const {'1': 'active', '3': 10, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'active'},
  ],
};

/// Descriptor for `Customer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customerDescriptor = $convert.base64Decode('CghDdXN0b21lchJCCgpjdXN0b21lcklkGAEgASgLMiIuc3RhdGljX2dycGMuY3VzdG9tZXIuSW50ZWdlclZhbHVlUgpjdXN0b21lcklkEjwKB3N0b3JlSWQYAiABKAsyIi5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnRlZ2VyVmFsdWVSB3N0b3JlSWQSPwoJZmlyc3ROYW1lGAMgASgLMiEuc3RhdGljX2dycGMuY3VzdG9tZXIuU3RyaW5nVmFsdWVSCWZpcnN0TmFtZRI9CghsYXN0TmFtZRgEIAEoCzIhLnN0YXRpY19ncnBjLmN1c3RvbWVyLlN0cmluZ1ZhbHVlUghsYXN0TmFtZRI3CgVlbWFpbBgFIAEoCzIhLnN0YXRpY19ncnBjLmN1c3RvbWVyLlN0cmluZ1ZhbHVlUgVlbWFpbBJACglhZGRyZXNzSWQYBiABKAsyIi5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnRlZ2VyVmFsdWVSCWFkZHJlc3NJZBJCCgphY3RpdmVib29sGAcgASgLMiIuc3RhdGljX2dycGMuY3VzdG9tZXIuQm9vbGVhblZhbHVlUgphY3RpdmVib29sEkEKCmNyZWF0ZURhdGUYCCABKAsyIS5zdGF0aWNfZ3JwYy5jdXN0b21lci5TdHJpbmdWYWx1ZVIKY3JlYXRlRGF0ZRJBCgpsYXN0VXBkYXRlGAkgASgLMiEuc3RhdGljX2dycGMuY3VzdG9tZXIuU3RyaW5nVmFsdWVSCmxhc3RVcGRhdGUSOgoGYWN0aXZlGAogASgLMiIuc3RhdGljX2dycGMuY3VzdG9tZXIuSW50ZWdlclZhbHVlUgZhY3RpdmU=');
@$core.Deprecated('Use customerPkDescriptor instead')
const CustomerPk$json = const {
  '1': 'CustomerPk',
  '2': const [
    const {'1': 'customerId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'customerId'},
  ],
};

/// Descriptor for `CustomerPk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customerPkDescriptor = $convert.base64Decode('CgpDdXN0b21lclBrEkIKCmN1c3RvbWVySWQYASABKAsyIi5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnRlZ2VyVmFsdWVSCmN1c3RvbWVySWQ=');
@$core.Deprecated('Use customerToInsertDescriptor instead')
const CustomerToInsert$json = const {
  '1': 'CustomerToInsert',
  '2': const [
    const {'1': 'storeId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'storeId'},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'firstName'},
    const {'1': 'lastName', '3': 3, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'lastName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'email'},
    const {'1': 'addressId', '3': 5, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'addressId'},
    const {'1': 'activebool', '3': 6, '4': 1, '5': 11, '6': '.static_grpc.customer.BooleanValue', '10': 'activebool'},
    const {'1': 'createDate', '3': 7, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'createDate'},
    const {'1': 'lastUpdate', '3': 8, '4': 1, '5': 11, '6': '.static_grpc.customer.StringValue', '10': 'lastUpdate'},
    const {'1': 'active', '3': 9, '4': 1, '5': 11, '6': '.static_grpc.customer.IntegerValue', '10': 'active'},
  ],
};

/// Descriptor for `CustomerToInsert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customerToInsertDescriptor = $convert.base64Decode('ChBDdXN0b21lclRvSW5zZXJ0EjwKB3N0b3JlSWQYASABKAsyIi5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnRlZ2VyVmFsdWVSB3N0b3JlSWQSPwoJZmlyc3ROYW1lGAIgASgLMiEuc3RhdGljX2dycGMuY3VzdG9tZXIuU3RyaW5nVmFsdWVSCWZpcnN0TmFtZRI9CghsYXN0TmFtZRgDIAEoCzIhLnN0YXRpY19ncnBjLmN1c3RvbWVyLlN0cmluZ1ZhbHVlUghsYXN0TmFtZRI3CgVlbWFpbBgEIAEoCzIhLnN0YXRpY19ncnBjLmN1c3RvbWVyLlN0cmluZ1ZhbHVlUgVlbWFpbBJACglhZGRyZXNzSWQYBSABKAsyIi5zdGF0aWNfZ3JwYy5jdXN0b21lci5JbnRlZ2VyVmFsdWVSCWFkZHJlc3NJZBJCCgphY3RpdmVib29sGAYgASgLMiIuc3RhdGljX2dycGMuY3VzdG9tZXIuQm9vbGVhblZhbHVlUgphY3RpdmVib29sEkEKCmNyZWF0ZURhdGUYByABKAsyIS5zdGF0aWNfZ3JwYy5jdXN0b21lci5TdHJpbmdWYWx1ZVIKY3JlYXRlRGF0ZRJBCgpsYXN0VXBkYXRlGAggASgLMiEuc3RhdGljX2dycGMuY3VzdG9tZXIuU3RyaW5nVmFsdWVSCmxhc3RVcGRhdGUSOgoGYWN0aXZlGAkgASgLMiIuc3RhdGljX2dycGMuY3VzdG9tZXIuSW50ZWdlclZhbHVlUgZhY3RpdmU=');
@$core.Deprecated('Use orderByOperatorDescriptor instead')
const OrderByOperator$json = const {
  '1': 'OrderByOperator',
  '2': const [
    const {'1': 'column', '3': 1, '4': 1, '5': 14, '6': '.static_grpc.customer.SelectableColumns', '10': 'column'},
    const {'1': 'orderType', '3': 2, '4': 1, '5': 14, '6': '.static_grpc.customer.OrderType', '10': 'orderType'},
  ],
};

/// Descriptor for `OrderByOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderByOperatorDescriptor = $convert.base64Decode('Cg9PcmRlckJ5T3BlcmF0b3ISPwoGY29sdW1uGAEgASgOMicuc3RhdGljX2dycGMuY3VzdG9tZXIuU2VsZWN0YWJsZUNvbHVtbnNSBmNvbHVtbhI9CglvcmRlclR5cGUYAiABKA4yHy5zdGF0aWNfZ3JwYy5jdXN0b21lci5PcmRlclR5cGVSCW9yZGVyVHlwZQ==');
