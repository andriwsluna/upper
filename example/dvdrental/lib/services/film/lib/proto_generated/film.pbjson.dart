///
//  Generated code. Do not modify.
//  source: film.proto
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
    const {'1': 'filmId', '2': 1},
    const {'1': 'title', '2': 2},
    const {'1': 'description', '2': 3},
    const {'1': 'releaseYear', '2': 4},
    const {'1': 'languageId', '2': 5},
    const {'1': 'rentalDuration', '2': 6},
    const {'1': 'rentalRate', '2': 7},
    const {'1': 'length', '2': 8},
    const {'1': 'replacementCost', '2': 9},
    const {'1': 'rating', '2': 10},
    const {'1': 'lastUpdate', '2': 11},
    const {'1': 'specialFeatures', '2': 12},
    const {'1': 'fulltext', '2': 13},
    const {'1': 'squares', '2': 14},
  ],
};

/// Descriptor for `SelectableColumns`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectableColumnsDescriptor = $convert.base64Decode(
    'ChFTZWxlY3RhYmxlQ29sdW1ucxIOCgphbGxDb2x1bW5zEAASCgoGZmlsbUlkEAESCQoFdGl0bGUQAhIPCgtkZXNjcmlwdGlvbhADEg8KC3JlbGVhc2VZZWFyEAQSDgoKbGFuZ3VhZ2VJZBAFEhIKDnJlbnRhbER1cmF0aW9uEAYSDgoKcmVudGFsUmF0ZRAHEgoKBmxlbmd0aBAIEhMKD3JlcGxhY2VtZW50Q29zdBAJEgoKBnJhdGluZxAKEg4KCmxhc3RVcGRhdGUQCxITCg9zcGVjaWFsRmVhdHVyZXMQDBIMCghmdWxsdGV4dBANEgsKB3NxdWFyZXMQDg==');
@$core.Deprecated('Use orderTypeDescriptor instead')
const OrderType$json = const {
  '1': 'OrderType',
  '2': const [
    const {'1': 'asc', '2': 0},
    const {'1': 'desc', '2': 1},
  ],
};

/// Descriptor for `OrderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderTypeDescriptor =
    $convert.base64Decode('CglPcmRlclR5cGUSBwoDYXNjEAASCAoEZGVzYxAB');
@$core.Deprecated('Use integerValueDescriptor instead')
const IntegerValue$json = const {
  '1': 'IntegerValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `IntegerValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List integerValueDescriptor =
    $convert.base64Decode('CgxJbnRlZ2VyVmFsdWUSFAoFdmFsdWUYASABKAVSBXZhbHVl');
@$core.Deprecated('Use stringValueDescriptor instead')
const StringValue$json = const {
  '1': 'StringValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `StringValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringValueDescriptor =
    $convert.base64Decode('CgtTdHJpbmdWYWx1ZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use numericValueDescriptor instead')
const NumericValue$json = const {
  '1': 'NumericValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

/// Descriptor for `NumericValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List numericValueDescriptor =
    $convert.base64Decode('CgxOdW1lcmljVmFsdWUSFAoFdmFsdWUYASABKAFSBXZhbHVl');
@$core.Deprecated('Use booleanValueDescriptor instead')
const BooleanValue$json = const {
  '1': 'BooleanValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `BooleanValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List booleanValueDescriptor =
    $convert.base64Decode('CgxCb29sZWFuVmFsdWUSFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use getRequestDescriptor instead')
const GetRequest$json = const {
  '1': 'GetRequest',
  '2': const [
    const {'1': 'filmId', '3': 1, '4': 1, '5': 5, '10': 'filmId'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor =
    $convert.base64Decode('CgpHZXRSZXF1ZXN0EhYKBmZpbG1JZBgBIAEoBVIGZmlsbUlk');
@$core.Deprecated('Use getResponseDescriptor instead')
const GetResponse$json = const {
  '1': 'GetResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {
      '1': 'data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.Film',
      '9': 0,
      '10': 'data'
    },
    const {
      '1': 'errorMessage',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'errorMessage'
    },
  ],
  '8': const [
    const {'1': 'GetResponseResult'},
  ],
};

/// Descriptor for `GetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResponseDescriptor = $convert.base64Decode(
    'CgtHZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIsCgRkYXRhGAIgASgLMhYuc3RhdGljX2dycGMuZmlsbS5GaWxtSABSBGRhdGESJAoMZXJyb3JNZXNzYWdlGAMgASgJSABSDGVycm9yTWVzc2FnZUITChFHZXRSZXNwb25zZVJlc3VsdA==');
@$core.Deprecated('Use insertRequestDescriptor instead')
const InsertRequest$json = const {
  '1': 'InsertRequest',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.film.FilmToInsert',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.InsertOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `InsertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRequestDescriptor = $convert.base64Decode(
    'Cg1JbnNlcnRSZXF1ZXN0EjIKBGRhdGEYASADKAsyHi5zdGF0aWNfZ3JwYy5maWxtLkZpbG1Ub0luc2VydFIEZGF0YRI5CgdvcHRpb25zGAIgASgLMh8uc3RhdGljX2dycGMuZmlsbS5JbnNlcnRPcHRpb25zUgdvcHRpb25z');
@$core.Deprecated('Use insertOptionsDescriptor instead')
const InsertOptions$json = const {
  '1': 'InsertOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `InsertOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertOptionsDescriptor = $convert.base64Decode(
    'Cg1JbnNlcnRPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
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
final $typed_data.Uint8List insertResponseDescriptor = $convert.base64Decode(
    'Cg5JbnNlcnRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9JbnNlcnQYAiABKAVSDHJvd3NUb0luc2VydBIiCgxyb3dzSW5zZXJ0ZWQYAyABKAVSDHJvd3NJbnNlcnRlZBIiCgxlcnJvck1lc3NhZ2UYBCADKAlSDGVycm9yTWVzc2FnZQ==');
@$core.Deprecated('Use updateRequestDescriptor instead')
const UpdateRequest$json = const {
  '1': 'UpdateRequest',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.film.Film',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.UpdateOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVSZXF1ZXN0EioKBGRhdGEYASADKAsyFi5zdGF0aWNfZ3JwYy5maWxtLkZpbG1SBGRhdGESOQoHb3B0aW9ucxgCIAEoCzIfLnN0YXRpY19ncnBjLmZpbG0uVXBkYXRlT3B0aW9uc1IHb3B0aW9ucw==');
@$core.Deprecated('Use updateOptionsDescriptor instead')
const UpdateOptions$json = const {
  '1': 'UpdateOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `UpdateOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOptionsDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
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
final $typed_data.Uint8List updateResponseDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9VcGRhdGUYAiABKAVSDHJvd3NUb1VwZGF0ZRIgCgtyb3dzVXBkYXRlZBgDIAEoBVILcm93c1VwZGF0ZWQSIgoMZXJyb3JNZXNzYWdlGAQgAygJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use deleteRequestDescriptor instead')
const DeleteRequest$json = const {
  '1': 'DeleteRequest',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.film.FilmPk',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.DeleteOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode(
    'Cg1EZWxldGVSZXF1ZXN0EiwKBGRhdGEYASADKAsyGC5zdGF0aWNfZ3JwYy5maWxtLkZpbG1Qa1IEZGF0YRI5CgdvcHRpb25zGAIgASgLMh8uc3RhdGljX2dycGMuZmlsbS5EZWxldGVPcHRpb25zUgdvcHRpb25z');
@$core.Deprecated('Use deleteOptionsDescriptor instead')
const DeleteOptions$json = const {
  '1': 'DeleteOptions',
  '2': const [
    const {'1': 'inTransaction', '3': 1, '4': 1, '5': 8, '10': 'inTransaction'},
  ],
};

/// Descriptor for `DeleteOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOptionsDescriptor = $convert.base64Decode(
    'Cg1EZWxldGVPcHRpb25zEiQKDWluVHJhbnNhY3Rpb24YASABKAhSDWluVHJhbnNhY3Rpb24=');
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
final $typed_data.Uint8List deleteResponseDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzVG9EZWxldGUYAiABKAVSDHJvd3NUb0RlbGV0ZRIgCgtyb3dzRGVsZXRlZBgDIAEoBVILcm93c0RlbGV0ZWQSIgoMZXJyb3JNZXNzYWdlGAQgAygJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use selectRequestDescriptor instead')
const SelectRequest$json = const {
  '1': 'SelectRequest',
  '2': const [
    const {
      '1': 'columns',
      '3': 1,
      '4': 3,
      '5': 14,
      '6': '.static_grpc.film.SelectableColumns',
      '10': 'columns'
    },
    const {'1': 'where', '3': 2, '4': 1, '5': 9, '10': 'where'},
    const {
      '1': 'orderBy',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.film.OrderByOperator',
      '10': 'orderBy'
    },
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SelectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectRequestDescriptor = $convert.base64Decode(
    'Cg1TZWxlY3RSZXF1ZXN0Ej0KB2NvbHVtbnMYASADKA4yIy5zdGF0aWNfZ3JwYy5maWxtLlNlbGVjdGFibGVDb2x1bW5zUgdjb2x1bW5zEhQKBXdoZXJlGAIgASgJUgV3aGVyZRI7CgdvcmRlckJ5GAMgAygLMiEuc3RhdGljX2dycGMuZmlsbS5PcmRlckJ5T3BlcmF0b3JSB29yZGVyQnkSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0');
@$core.Deprecated('Use selectResponseDescriptor instead')
const SelectResponse$json = const {
  '1': 'SelectResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'rowsSelected', '3': 2, '4': 1, '5': 5, '10': 'rowsSelected'},
    const {
      '1': 'totalRowsCount',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalRowsCount'
    },
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'nextOffset', '3': 6, '4': 1, '5': 5, '10': 'nextOffset'},
    const {
      '1': 'data',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.film.Film',
      '10': 'data'
    },
    const {'1': 'errorMessage', '3': 8, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SelectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectResponseDescriptor = $convert.base64Decode(
    'Cg5TZWxlY3RSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzU2VsZWN0ZWQYAiABKAVSDHJvd3NTZWxlY3RlZBImCg50b3RhbFJvd3NDb3VudBgDIAEoBVIOdG90YWxSb3dzQ291bnQSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0Eh4KCm5leHRPZmZzZXQYBiABKAVSCm5leHRPZmZzZXQSKgoEZGF0YRgHIAMoCzIWLnN0YXRpY19ncnBjLmZpbG0uRmlsbVIEZGF0YRIiCgxlcnJvck1lc3NhZ2UYCCADKAlSDGVycm9yTWVzc2FnZQ==');
@$core.Deprecated('Use filmDescriptor instead')
const Film$json = const {
  '1': 'Film',
  '2': const [
    const {
      '1': 'filmId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'filmId'
    },
    const {
      '1': 'title',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'title'
    },
    const {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'description'
    },
    const {
      '1': 'releaseYear',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'releaseYear'
    },
    const {
      '1': 'languageId',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'languageId'
    },
    const {
      '1': 'rentalDuration',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'rentalDuration'
    },
    const {
      '1': 'rentalRate',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.NumericValue',
      '10': 'rentalRate'
    },
    const {
      '1': 'length',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'length'
    },
    const {
      '1': 'replacementCost',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.NumericValue',
      '10': 'replacementCost'
    },
    const {
      '1': 'rating',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'rating'
    },
    const {
      '1': 'lastUpdate',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'lastUpdate'
    },
    const {
      '1': 'specialFeatures',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'specialFeatures'
    },
    const {
      '1': 'fulltext',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'fulltext'
    },
    const {
      '1': 'squares',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'squares'
    },
  ],
};

/// Descriptor for `Film`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filmDescriptor = $convert.base64Decode(
    'CgRGaWxtEjYKBmZpbG1JZBgBIAEoCzIeLnN0YXRpY19ncnBjLmZpbG0uSW50ZWdlclZhbHVlUgZmaWxtSWQSMwoFdGl0bGUYAiABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUgV0aXRsZRI/CgtkZXNjcmlwdGlvbhgDIAEoCzIdLnN0YXRpY19ncnBjLmZpbG0uU3RyaW5nVmFsdWVSC2Rlc2NyaXB0aW9uEkAKC3JlbGVhc2VZZWFyGAQgASgLMh4uc3RhdGljX2dycGMuZmlsbS5JbnRlZ2VyVmFsdWVSC3JlbGVhc2VZZWFyEj4KCmxhbmd1YWdlSWQYBSABKAsyHi5zdGF0aWNfZ3JwYy5maWxtLkludGVnZXJWYWx1ZVIKbGFuZ3VhZ2VJZBJGCg5yZW50YWxEdXJhdGlvbhgGIAEoCzIeLnN0YXRpY19ncnBjLmZpbG0uSW50ZWdlclZhbHVlUg5yZW50YWxEdXJhdGlvbhI+CgpyZW50YWxSYXRlGAcgASgLMh4uc3RhdGljX2dycGMuZmlsbS5OdW1lcmljVmFsdWVSCnJlbnRhbFJhdGUSNgoGbGVuZ3RoGAggASgLMh4uc3RhdGljX2dycGMuZmlsbS5JbnRlZ2VyVmFsdWVSBmxlbmd0aBJICg9yZXBsYWNlbWVudENvc3QYCSABKAsyHi5zdGF0aWNfZ3JwYy5maWxtLk51bWVyaWNWYWx1ZVIPcmVwbGFjZW1lbnRDb3N0EjUKBnJhdGluZxgKIAEoCzIdLnN0YXRpY19ncnBjLmZpbG0uU3RyaW5nVmFsdWVSBnJhdGluZxI9CgpsYXN0VXBkYXRlGAsgASgLMh0uc3RhdGljX2dycGMuZmlsbS5TdHJpbmdWYWx1ZVIKbGFzdFVwZGF0ZRJHCg9zcGVjaWFsRmVhdHVyZXMYDCABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUg9zcGVjaWFsRmVhdHVyZXMSOQoIZnVsbHRleHQYDSABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUghmdWxsdGV4dBI3CgdzcXVhcmVzGA4gASgLMh0uc3RhdGljX2dycGMuZmlsbS5TdHJpbmdWYWx1ZVIHc3F1YXJlcw==');
@$core.Deprecated('Use filmPkDescriptor instead')
const FilmPk$json = const {
  '1': 'FilmPk',
  '2': const [
    const {
      '1': 'filmId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'filmId'
    },
  ],
};

/// Descriptor for `FilmPk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filmPkDescriptor = $convert.base64Decode(
    'CgZGaWxtUGsSNgoGZmlsbUlkGAEgASgLMh4uc3RhdGljX2dycGMuZmlsbS5JbnRlZ2VyVmFsdWVSBmZpbG1JZA==');
@$core.Deprecated('Use filmToInsertDescriptor instead')
const FilmToInsert$json = const {
  '1': 'FilmToInsert',
  '2': const [
    const {
      '1': 'title',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'title'
    },
    const {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'description'
    },
    const {
      '1': 'releaseYear',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'releaseYear'
    },
    const {
      '1': 'languageId',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'languageId'
    },
    const {
      '1': 'rentalDuration',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'rentalDuration'
    },
    const {
      '1': 'rentalRate',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.NumericValue',
      '10': 'rentalRate'
    },
    const {
      '1': 'length',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.IntegerValue',
      '10': 'length'
    },
    const {
      '1': 'replacementCost',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.NumericValue',
      '10': 'replacementCost'
    },
    const {
      '1': 'rating',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'rating'
    },
    const {
      '1': 'lastUpdate',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'lastUpdate'
    },
    const {
      '1': 'specialFeatures',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'specialFeatures'
    },
    const {
      '1': 'fulltext',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'fulltext'
    },
    const {
      '1': 'squares',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.film.StringValue',
      '10': 'squares'
    },
  ],
};

/// Descriptor for `FilmToInsert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filmToInsertDescriptor = $convert.base64Decode(
    'CgxGaWxtVG9JbnNlcnQSMwoFdGl0bGUYASABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUgV0aXRsZRI/CgtkZXNjcmlwdGlvbhgCIAEoCzIdLnN0YXRpY19ncnBjLmZpbG0uU3RyaW5nVmFsdWVSC2Rlc2NyaXB0aW9uEkAKC3JlbGVhc2VZZWFyGAMgASgLMh4uc3RhdGljX2dycGMuZmlsbS5JbnRlZ2VyVmFsdWVSC3JlbGVhc2VZZWFyEj4KCmxhbmd1YWdlSWQYBCABKAsyHi5zdGF0aWNfZ3JwYy5maWxtLkludGVnZXJWYWx1ZVIKbGFuZ3VhZ2VJZBJGCg5yZW50YWxEdXJhdGlvbhgFIAEoCzIeLnN0YXRpY19ncnBjLmZpbG0uSW50ZWdlclZhbHVlUg5yZW50YWxEdXJhdGlvbhI+CgpyZW50YWxSYXRlGAYgASgLMh4uc3RhdGljX2dycGMuZmlsbS5OdW1lcmljVmFsdWVSCnJlbnRhbFJhdGUSNgoGbGVuZ3RoGAcgASgLMh4uc3RhdGljX2dycGMuZmlsbS5JbnRlZ2VyVmFsdWVSBmxlbmd0aBJICg9yZXBsYWNlbWVudENvc3QYCCABKAsyHi5zdGF0aWNfZ3JwYy5maWxtLk51bWVyaWNWYWx1ZVIPcmVwbGFjZW1lbnRDb3N0EjUKBnJhdGluZxgJIAEoCzIdLnN0YXRpY19ncnBjLmZpbG0uU3RyaW5nVmFsdWVSBnJhdGluZxI9CgpsYXN0VXBkYXRlGAogASgLMh0uc3RhdGljX2dycGMuZmlsbS5TdHJpbmdWYWx1ZVIKbGFzdFVwZGF0ZRJHCg9zcGVjaWFsRmVhdHVyZXMYCyABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUg9zcGVjaWFsRmVhdHVyZXMSOQoIZnVsbHRleHQYDCABKAsyHS5zdGF0aWNfZ3JwYy5maWxtLlN0cmluZ1ZhbHVlUghmdWxsdGV4dBI3CgdzcXVhcmVzGA0gASgLMh0uc3RhdGljX2dycGMuZmlsbS5TdHJpbmdWYWx1ZVIHc3F1YXJlcw==');
@$core.Deprecated('Use orderByOperatorDescriptor instead')
const OrderByOperator$json = const {
  '1': 'OrderByOperator',
  '2': const [
    const {
      '1': 'column',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.film.SelectableColumns',
      '10': 'column'
    },
    const {
      '1': 'orderType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.film.OrderType',
      '10': 'orderType'
    },
  ],
};

/// Descriptor for `OrderByOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderByOperatorDescriptor = $convert.base64Decode(
    'Cg9PcmRlckJ5T3BlcmF0b3ISOwoGY29sdW1uGAEgASgOMiMuc3RhdGljX2dycGMuZmlsbS5TZWxlY3RhYmxlQ29sdW1uc1IGY29sdW1uEjkKCW9yZGVyVHlwZRgCIAEoDjIbLnN0YXRpY19ncnBjLmZpbG0uT3JkZXJUeXBlUglvcmRlclR5cGU=');
