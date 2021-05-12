///
//  Generated code. Do not modify.
//  source: staff.proto
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
    const {'1': 'staffId', '2': 1},
    const {'1': 'firstName', '2': 2},
    const {'1': 'lastName', '2': 3},
    const {'1': 'addressId', '2': 4},
    const {'1': 'email', '2': 5},
    const {'1': 'storeId', '2': 6},
    const {'1': 'active', '2': 7},
    const {'1': 'username', '2': 8},
    const {'1': 'password', '2': 9},
    const {'1': 'lastUpdate', '2': 10},
    const {'1': 'picture', '2': 11},
  ],
};

/// Descriptor for `SelectableColumns`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectableColumnsDescriptor = $convert.base64Decode(
    'ChFTZWxlY3RhYmxlQ29sdW1ucxIOCgphbGxDb2x1bW5zEAASCwoHc3RhZmZJZBABEg0KCWZpcnN0TmFtZRACEgwKCGxhc3ROYW1lEAMSDQoJYWRkcmVzc0lkEAQSCQoFZW1haWwQBRILCgdzdG9yZUlkEAYSCgoGYWN0aXZlEAcSDAoIdXNlcm5hbWUQCBIMCghwYXNzd29yZBAJEg4KCmxhc3RVcGRhdGUQChILCgdwaWN0dXJlEAs=');
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
    const {'1': 'staffId', '3': 1, '4': 1, '5': 5, '10': 'staffId'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor = $convert
    .base64Decode('CgpHZXRSZXF1ZXN0EhgKB3N0YWZmSWQYASABKAVSB3N0YWZmSWQ=');
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
      '6': '.static_grpc.staff.Staff',
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
    'CgtHZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIuCgRkYXRhGAIgASgLMhguc3RhdGljX2dycGMuc3RhZmYuU3RhZmZIAFIEZGF0YRIkCgxlcnJvck1lc3NhZ2UYAyABKAlIAFIMZXJyb3JNZXNzYWdlQhMKEUdldFJlc3BvbnNlUmVzdWx0');
@$core.Deprecated('Use insertRequestDescriptor instead')
const InsertRequest$json = const {
  '1': 'InsertRequest',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.staff.StaffToInsert',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.InsertOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `InsertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRequestDescriptor = $convert.base64Decode(
    'Cg1JbnNlcnRSZXF1ZXN0EjQKBGRhdGEYASADKAsyIC5zdGF0aWNfZ3JwYy5zdGFmZi5TdGFmZlRvSW5zZXJ0UgRkYXRhEjoKB29wdGlvbnMYAiABKAsyIC5zdGF0aWNfZ3JwYy5zdGFmZi5JbnNlcnRPcHRpb25zUgdvcHRpb25z');
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
      '6': '.static_grpc.staff.Staff',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.UpdateOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVSZXF1ZXN0EiwKBGRhdGEYASADKAsyGC5zdGF0aWNfZ3JwYy5zdGFmZi5TdGFmZlIEZGF0YRI6CgdvcHRpb25zGAIgASgLMiAuc3RhdGljX2dycGMuc3RhZmYuVXBkYXRlT3B0aW9uc1IHb3B0aW9ucw==');
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
      '6': '.static_grpc.staff.StaffPk',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.DeleteOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode(
    'Cg1EZWxldGVSZXF1ZXN0Ei4KBGRhdGEYASADKAsyGi5zdGF0aWNfZ3JwYy5zdGFmZi5TdGFmZlBrUgRkYXRhEjoKB29wdGlvbnMYAiABKAsyIC5zdGF0aWNfZ3JwYy5zdGFmZi5EZWxldGVPcHRpb25zUgdvcHRpb25z');
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
      '6': '.static_grpc.staff.SelectableColumns',
      '10': 'columns'
    },
    const {'1': 'where', '3': 2, '4': 1, '5': 9, '10': 'where'},
    const {
      '1': 'orderBy',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.staff.OrderByOperator',
      '10': 'orderBy'
    },
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SelectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectRequestDescriptor = $convert.base64Decode(
    'Cg1TZWxlY3RSZXF1ZXN0Ej4KB2NvbHVtbnMYASADKA4yJC5zdGF0aWNfZ3JwYy5zdGFmZi5TZWxlY3RhYmxlQ29sdW1uc1IHY29sdW1ucxIUCgV3aGVyZRgCIAEoCVIFd2hlcmUSPAoHb3JkZXJCeRgDIAMoCzIiLnN0YXRpY19ncnBjLnN0YWZmLk9yZGVyQnlPcGVyYXRvclIHb3JkZXJCeRIUCgVsaW1pdBgEIAEoBVIFbGltaXQSFgoGb2Zmc2V0GAUgASgFUgZvZmZzZXQ=');
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
      '6': '.static_grpc.staff.Staff',
      '10': 'data'
    },
    const {'1': 'errorMessage', '3': 8, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SelectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectResponseDescriptor = $convert.base64Decode(
    'Cg5TZWxlY3RSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzU2VsZWN0ZWQYAiABKAVSDHJvd3NTZWxlY3RlZBImCg50b3RhbFJvd3NDb3VudBgDIAEoBVIOdG90YWxSb3dzQ291bnQSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0Eh4KCm5leHRPZmZzZXQYBiABKAVSCm5leHRPZmZzZXQSLAoEZGF0YRgHIAMoCzIYLnN0YXRpY19ncnBjLnN0YWZmLlN0YWZmUgRkYXRhEiIKDGVycm9yTWVzc2FnZRgIIAMoCVIMZXJyb3JNZXNzYWdl');
@$core.Deprecated('Use staffDescriptor instead')
const Staff$json = const {
  '1': 'Staff',
  '2': const [
    const {
      '1': 'staffId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'staffId'
    },
    const {
      '1': 'firstName',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'firstName'
    },
    const {
      '1': 'lastName',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'lastName'
    },
    const {
      '1': 'addressId',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'addressId'
    },
    const {
      '1': 'email',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'email'
    },
    const {
      '1': 'storeId',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'storeId'
    },
    const {
      '1': 'active',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.BooleanValue',
      '10': 'active'
    },
    const {
      '1': 'username',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'username'
    },
    const {
      '1': 'password',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'password'
    },
    const {
      '1': 'lastUpdate',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'lastUpdate'
    },
    const {
      '1': 'picture',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'picture'
    },
  ],
};

/// Descriptor for `Staff`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List staffDescriptor = $convert.base64Decode(
    'CgVTdGFmZhI5CgdzdGFmZklkGAEgASgLMh8uc3RhdGljX2dycGMuc3RhZmYuSW50ZWdlclZhbHVlUgdzdGFmZklkEjwKCWZpcnN0TmFtZRgCIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUglmaXJzdE5hbWUSOgoIbGFzdE5hbWUYAyABKAsyHi5zdGF0aWNfZ3JwYy5zdGFmZi5TdHJpbmdWYWx1ZVIIbGFzdE5hbWUSPQoJYWRkcmVzc0lkGAQgASgLMh8uc3RhdGljX2dycGMuc3RhZmYuSW50ZWdlclZhbHVlUglhZGRyZXNzSWQSNAoFZW1haWwYBSABKAsyHi5zdGF0aWNfZ3JwYy5zdGFmZi5TdHJpbmdWYWx1ZVIFZW1haWwSOQoHc3RvcmVJZBgGIAEoCzIfLnN0YXRpY19ncnBjLnN0YWZmLkludGVnZXJWYWx1ZVIHc3RvcmVJZBI3CgZhY3RpdmUYByABKAsyHy5zdGF0aWNfZ3JwYy5zdGFmZi5Cb29sZWFuVmFsdWVSBmFjdGl2ZRI6Cgh1c2VybmFtZRgIIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUgh1c2VybmFtZRI6CghwYXNzd29yZBgJIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUghwYXNzd29yZBI+CgpsYXN0VXBkYXRlGAogASgLMh4uc3RhdGljX2dycGMuc3RhZmYuU3RyaW5nVmFsdWVSCmxhc3RVcGRhdGUSOAoHcGljdHVyZRgLIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUgdwaWN0dXJl');
@$core.Deprecated('Use staffPkDescriptor instead')
const StaffPk$json = const {
  '1': 'StaffPk',
  '2': const [
    const {
      '1': 'staffId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'staffId'
    },
  ],
};

/// Descriptor for `StaffPk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List staffPkDescriptor = $convert.base64Decode(
    'CgdTdGFmZlBrEjkKB3N0YWZmSWQYASABKAsyHy5zdGF0aWNfZ3JwYy5zdGFmZi5JbnRlZ2VyVmFsdWVSB3N0YWZmSWQ=');
@$core.Deprecated('Use staffToInsertDescriptor instead')
const StaffToInsert$json = const {
  '1': 'StaffToInsert',
  '2': const [
    const {
      '1': 'firstName',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'firstName'
    },
    const {
      '1': 'lastName',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'lastName'
    },
    const {
      '1': 'addressId',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'addressId'
    },
    const {
      '1': 'email',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'email'
    },
    const {
      '1': 'storeId',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.IntegerValue',
      '10': 'storeId'
    },
    const {
      '1': 'active',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.BooleanValue',
      '10': 'active'
    },
    const {
      '1': 'username',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'username'
    },
    const {
      '1': 'password',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'password'
    },
    const {
      '1': 'lastUpdate',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'lastUpdate'
    },
    const {
      '1': 'picture',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.staff.StringValue',
      '10': 'picture'
    },
  ],
};

/// Descriptor for `StaffToInsert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List staffToInsertDescriptor = $convert.base64Decode(
    'Cg1TdGFmZlRvSW5zZXJ0EjwKCWZpcnN0TmFtZRgBIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUglmaXJzdE5hbWUSOgoIbGFzdE5hbWUYAiABKAsyHi5zdGF0aWNfZ3JwYy5zdGFmZi5TdHJpbmdWYWx1ZVIIbGFzdE5hbWUSPQoJYWRkcmVzc0lkGAMgASgLMh8uc3RhdGljX2dycGMuc3RhZmYuSW50ZWdlclZhbHVlUglhZGRyZXNzSWQSNAoFZW1haWwYBCABKAsyHi5zdGF0aWNfZ3JwYy5zdGFmZi5TdHJpbmdWYWx1ZVIFZW1haWwSOQoHc3RvcmVJZBgFIAEoCzIfLnN0YXRpY19ncnBjLnN0YWZmLkludGVnZXJWYWx1ZVIHc3RvcmVJZBI3CgZhY3RpdmUYBiABKAsyHy5zdGF0aWNfZ3JwYy5zdGFmZi5Cb29sZWFuVmFsdWVSBmFjdGl2ZRI6Cgh1c2VybmFtZRgHIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUgh1c2VybmFtZRI6CghwYXNzd29yZBgIIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUghwYXNzd29yZBI+CgpsYXN0VXBkYXRlGAkgASgLMh4uc3RhdGljX2dycGMuc3RhZmYuU3RyaW5nVmFsdWVSCmxhc3RVcGRhdGUSOAoHcGljdHVyZRgKIAEoCzIeLnN0YXRpY19ncnBjLnN0YWZmLlN0cmluZ1ZhbHVlUgdwaWN0dXJl');
@$core.Deprecated('Use orderByOperatorDescriptor instead')
const OrderByOperator$json = const {
  '1': 'OrderByOperator',
  '2': const [
    const {
      '1': 'column',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.staff.SelectableColumns',
      '10': 'column'
    },
    const {
      '1': 'orderType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.staff.OrderType',
      '10': 'orderType'
    },
  ],
};

/// Descriptor for `OrderByOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderByOperatorDescriptor = $convert.base64Decode(
    'Cg9PcmRlckJ5T3BlcmF0b3ISPAoGY29sdW1uGAEgASgOMiQuc3RhdGljX2dycGMuc3RhZmYuU2VsZWN0YWJsZUNvbHVtbnNSBmNvbHVtbhI6CglvcmRlclR5cGUYAiABKA4yHC5zdGF0aWNfZ3JwYy5zdGFmZi5PcmRlclR5cGVSCW9yZGVyVHlwZQ==');
