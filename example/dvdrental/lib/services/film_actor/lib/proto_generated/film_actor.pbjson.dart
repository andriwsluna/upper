///
//  Generated code. Do not modify.
//  source: film_actor.proto
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
    const {'1': 'actorId', '2': 1},
    const {'1': 'filmId', '2': 2},
    const {'1': 'lastUpdate', '2': 3},
  ],
};

/// Descriptor for `SelectableColumns`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectableColumnsDescriptor = $convert.base64Decode('ChFTZWxlY3RhYmxlQ29sdW1ucxIOCgphbGxDb2x1bW5zEAASCwoHYWN0b3JJZBABEgoKBmZpbG1JZBACEg4KCmxhc3RVcGRhdGUQAw==');
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
    const {'1': 'actorId', '3': 1, '4': 1, '5': 5, '10': 'actorId'},
    const {'1': 'filmId', '3': 2, '4': 1, '5': 5, '10': 'filmId'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor = $convert.base64Decode('CgpHZXRSZXF1ZXN0EhgKB2FjdG9ySWQYASABKAVSB2FjdG9ySWQSFgoGZmlsbUlkGAIgASgFUgZmaWxtSWQ=');
@$core.Deprecated('Use getResponseDescriptor instead')
const GetResponse$json = const {
  '1': 'GetResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.Film_actor', '9': 0, '10': 'data'},
    const {'1': 'errorMessage', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'errorMessage'},
  ],
  '8': const [
    const {'1': 'GetResponseResult'},
  ],
};

/// Descriptor for `GetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponseDescriptor = $convert.base64Decode('CgtHZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBI4CgRkYXRhGAIgASgLMiIuc3RhdGljX2dycGMuZmlsbV9hY3Rvci5GaWxtX2FjdG9ySABSBGRhdGESJAoMZXJyb3JNZXNzYWdlGAMgASgJSABSDGVycm9yTWVzc2FnZUITChFHZXRSZXNwb25zZVJlc3VsdA==');
@$core.Deprecated('Use insertRequestDescriptor instead')
const InsertRequest$json = const {
  '1': 'InsertRequest',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.film_actor.Film_actorToInsert', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.InsertOptions', '10': 'options'},
  ],
};

/// Descriptor for `InsertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRequestDescriptor = $convert.base64Decode('Cg1JbnNlcnRSZXF1ZXN0Ej4KBGRhdGEYASADKAsyKi5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLkZpbG1fYWN0b3JUb0luc2VydFIEZGF0YRI/CgdvcHRpb25zGAIgASgLMiUuc3RhdGljX2dycGMuZmlsbV9hY3Rvci5JbnNlcnRPcHRpb25zUgdvcHRpb25z');
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
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.film_actor.Film_actor', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.UpdateOptions', '10': 'options'},
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode('Cg1VcGRhdGVSZXF1ZXN0EjYKBGRhdGEYASADKAsyIi5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLkZpbG1fYWN0b3JSBGRhdGESPwoHb3B0aW9ucxgCIAEoCzIlLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuVXBkYXRlT3B0aW9uc1IHb3B0aW9ucw==');
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
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.static_grpc.film_actor.Film_actorPk', '10': 'data'},
    const {'1': 'options', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.DeleteOptions', '10': 'options'},
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode('Cg1EZWxldGVSZXF1ZXN0EjgKBGRhdGEYASADKAsyJC5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLkZpbG1fYWN0b3JQa1IEZGF0YRI/CgdvcHRpb25zGAIgASgLMiUuc3RhdGljX2dycGMuZmlsbV9hY3Rvci5EZWxldGVPcHRpb25zUgdvcHRpb25z');
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
    const {'1': 'columns', '3': 1, '4': 3, '5': 14, '6': '.static_grpc.film_actor.SelectableColumns', '10': 'columns'},
    const {'1': 'where', '3': 2, '4': 1, '5': 9, '10': 'where'},
    const {'1': 'orderBy', '3': 3, '4': 3, '5': 11, '6': '.static_grpc.film_actor.OrderByOperator', '10': 'orderBy'},
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SelectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectRequestDescriptor = $convert.base64Decode('Cg1TZWxlY3RSZXF1ZXN0EkMKB2NvbHVtbnMYASADKA4yKS5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLlNlbGVjdGFibGVDb2x1bW5zUgdjb2x1bW5zEhQKBXdoZXJlGAIgASgJUgV3aGVyZRJBCgdvcmRlckJ5GAMgAygLMicuc3RhdGljX2dycGMuZmlsbV9hY3Rvci5PcmRlckJ5T3BlcmF0b3JSB29yZGVyQnkSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0');
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
    const {'1': 'data', '3': 7, '4': 3, '5': 11, '6': '.static_grpc.film_actor.Film_actor', '10': 'data'},
    const {'1': 'errorMessage', '3': 8, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SelectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectResponseDescriptor = $convert.base64Decode('Cg5TZWxlY3RSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzU2VsZWN0ZWQYAiABKAVSDHJvd3NTZWxlY3RlZBImCg50b3RhbFJvd3NDb3VudBgDIAEoBVIOdG90YWxSb3dzQ291bnQSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0Eh4KCm5leHRPZmZzZXQYBiABKAVSCm5leHRPZmZzZXQSNgoEZGF0YRgHIAMoCzIiLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuRmlsbV9hY3RvclIEZGF0YRIiCgxlcnJvck1lc3NhZ2UYCCADKAlSDGVycm9yTWVzc2FnZQ==');
@$core.Deprecated('Use film_actorDescriptor instead')
const Film_actor$json = const {
  '1': 'Film_actor',
  '2': const [
    const {'1': 'actorId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'actorId'},
    const {'1': 'filmId', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'filmId'},
    const {'1': 'lastUpdate', '3': 3, '4': 1, '5': 11, '6': '.static_grpc.film_actor.StringValue', '10': 'lastUpdate'},
  ],
};

/// Descriptor for `Film_actor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List film_actorDescriptor = $convert.base64Decode('CgpGaWxtX2FjdG9yEj4KB2FjdG9ySWQYASABKAsyJC5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLkludGVnZXJWYWx1ZVIHYWN0b3JJZBI8CgZmaWxtSWQYAiABKAsyJC5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLkludGVnZXJWYWx1ZVIGZmlsbUlkEkMKCmxhc3RVcGRhdGUYAyABKAsyIy5zdGF0aWNfZ3JwYy5maWxtX2FjdG9yLlN0cmluZ1ZhbHVlUgpsYXN0VXBkYXRl');
@$core.Deprecated('Use film_actorPkDescriptor instead')
const Film_actorPk$json = const {
  '1': 'Film_actorPk',
  '2': const [
    const {'1': 'actorId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'actorId'},
    const {'1': 'filmId', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'filmId'},
  ],
};

/// Descriptor for `Film_actorPk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List film_actorPkDescriptor = $convert.base64Decode('CgxGaWxtX2FjdG9yUGsSPgoHYWN0b3JJZBgBIAEoCzIkLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuSW50ZWdlclZhbHVlUgdhY3RvcklkEjwKBmZpbG1JZBgCIAEoCzIkLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuSW50ZWdlclZhbHVlUgZmaWxtSWQ=');
@$core.Deprecated('Use film_actorToInsertDescriptor instead')
const Film_actorToInsert$json = const {
  '1': 'Film_actorToInsert',
  '2': const [
    const {'1': 'actorId', '3': 1, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'actorId'},
    const {'1': 'filmId', '3': 2, '4': 1, '5': 11, '6': '.static_grpc.film_actor.IntegerValue', '10': 'filmId'},
    const {'1': 'lastUpdate', '3': 3, '4': 1, '5': 11, '6': '.static_grpc.film_actor.StringValue', '10': 'lastUpdate'},
  ],
};

/// Descriptor for `Film_actorToInsert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List film_actorToInsertDescriptor = $convert.base64Decode('ChJGaWxtX2FjdG9yVG9JbnNlcnQSPgoHYWN0b3JJZBgBIAEoCzIkLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuSW50ZWdlclZhbHVlUgdhY3RvcklkEjwKBmZpbG1JZBgCIAEoCzIkLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuSW50ZWdlclZhbHVlUgZmaWxtSWQSQwoKbGFzdFVwZGF0ZRgDIAEoCzIjLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuU3RyaW5nVmFsdWVSCmxhc3RVcGRhdGU=');
@$core.Deprecated('Use orderByOperatorDescriptor instead')
const OrderByOperator$json = const {
  '1': 'OrderByOperator',
  '2': const [
    const {'1': 'column', '3': 1, '4': 1, '5': 14, '6': '.static_grpc.film_actor.SelectableColumns', '10': 'column'},
    const {'1': 'orderType', '3': 2, '4': 1, '5': 14, '6': '.static_grpc.film_actor.OrderType', '10': 'orderType'},
  ],
};

/// Descriptor for `OrderByOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderByOperatorDescriptor = $convert.base64Decode('Cg9PcmRlckJ5T3BlcmF0b3ISQQoGY29sdW1uGAEgASgOMikuc3RhdGljX2dycGMuZmlsbV9hY3Rvci5TZWxlY3RhYmxlQ29sdW1uc1IGY29sdW1uEj8KCW9yZGVyVHlwZRgCIAEoDjIhLnN0YXRpY19ncnBjLmZpbG1fYWN0b3IuT3JkZXJUeXBlUglvcmRlclR5cGU=');
