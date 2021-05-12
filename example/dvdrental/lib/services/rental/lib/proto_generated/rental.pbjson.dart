///
//  Generated code. Do not modify.
//  source: rental.proto
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
    const {'1': 'rentalId', '2': 1},
    const {'1': 'rentalDate', '2': 2},
    const {'1': 'inventoryId', '2': 3},
    const {'1': 'customerId', '2': 4},
    const {'1': 'returnDate', '2': 5},
    const {'1': 'staffId', '2': 6},
    const {'1': 'lastUpdate', '2': 7},
  ],
};

/// Descriptor for `SelectableColumns`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List selectableColumnsDescriptor = $convert.base64Decode(
    'ChFTZWxlY3RhYmxlQ29sdW1ucxIOCgphbGxDb2x1bW5zEAASDAoIcmVudGFsSWQQARIOCgpyZW50YWxEYXRlEAISDwoLaW52ZW50b3J5SWQQAxIOCgpjdXN0b21lcklkEAQSDgoKcmV0dXJuRGF0ZRAFEgsKB3N0YWZmSWQQBhIOCgpsYXN0VXBkYXRlEAc=');
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
    const {'1': 'rentalId', '3': 1, '4': 1, '5': 5, '10': 'rentalId'},
  ],
};

/// Descriptor for `GetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRequestDescriptor = $convert
    .base64Decode('CgpHZXRSZXF1ZXN0EhoKCHJlbnRhbElkGAEgASgFUghyZW50YWxJZA==');
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
      '6': '.static_grpc.rental.Rental',
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
    'CgtHZXRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIwCgRkYXRhGAIgASgLMhouc3RhdGljX2dycGMucmVudGFsLlJlbnRhbEgAUgRkYXRhEiQKDGVycm9yTWVzc2FnZRgDIAEoCUgAUgxlcnJvck1lc3NhZ2VCEwoRR2V0UmVzcG9uc2VSZXN1bHQ=');
@$core.Deprecated('Use insertRequestDescriptor instead')
const InsertRequest$json = const {
  '1': 'InsertRequest',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.rental.RentalToInsert',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.InsertOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `InsertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List insertRequestDescriptor = $convert.base64Decode(
    'Cg1JbnNlcnRSZXF1ZXN0EjYKBGRhdGEYASADKAsyIi5zdGF0aWNfZ3JwYy5yZW50YWwuUmVudGFsVG9JbnNlcnRSBGRhdGESOwoHb3B0aW9ucxgCIAEoCzIhLnN0YXRpY19ncnBjLnJlbnRhbC5JbnNlcnRPcHRpb25zUgdvcHRpb25z');
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
      '6': '.static_grpc.rental.Rental',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.UpdateOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `UpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRequestDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVSZXF1ZXN0Ei4KBGRhdGEYASADKAsyGi5zdGF0aWNfZ3JwYy5yZW50YWwuUmVudGFsUgRkYXRhEjsKB29wdGlvbnMYAiABKAsyIS5zdGF0aWNfZ3JwYy5yZW50YWwuVXBkYXRlT3B0aW9uc1IHb3B0aW9ucw==');
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
      '6': '.static_grpc.rental.RentalPk',
      '10': 'data'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.DeleteOptions',
      '10': 'options'
    },
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode(
    'Cg1EZWxldGVSZXF1ZXN0EjAKBGRhdGEYASADKAsyHC5zdGF0aWNfZ3JwYy5yZW50YWwuUmVudGFsUGtSBGRhdGESOwoHb3B0aW9ucxgCIAEoCzIhLnN0YXRpY19ncnBjLnJlbnRhbC5EZWxldGVPcHRpb25zUgdvcHRpb25z');
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
      '6': '.static_grpc.rental.SelectableColumns',
      '10': 'columns'
    },
    const {'1': 'where', '3': 2, '4': 1, '5': 9, '10': 'where'},
    const {
      '1': 'orderBy',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.static_grpc.rental.OrderByOperator',
      '10': 'orderBy'
    },
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SelectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectRequestDescriptor = $convert.base64Decode(
    'Cg1TZWxlY3RSZXF1ZXN0Ej8KB2NvbHVtbnMYASADKA4yJS5zdGF0aWNfZ3JwYy5yZW50YWwuU2VsZWN0YWJsZUNvbHVtbnNSB2NvbHVtbnMSFAoFd2hlcmUYAiABKAlSBXdoZXJlEj0KB29yZGVyQnkYAyADKAsyIy5zdGF0aWNfZ3JwYy5yZW50YWwuT3JkZXJCeU9wZXJhdG9yUgdvcmRlckJ5EhQKBWxpbWl0GAQgASgFUgVsaW1pdBIWCgZvZmZzZXQYBSABKAVSBm9mZnNldA==');
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
      '6': '.static_grpc.rental.Rental',
      '10': 'data'
    },
    const {'1': 'errorMessage', '3': 8, '4': 3, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SelectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectResponseDescriptor = $convert.base64Decode(
    'Cg5TZWxlY3RSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdBIiCgxyb3dzU2VsZWN0ZWQYAiABKAVSDHJvd3NTZWxlY3RlZBImCg50b3RhbFJvd3NDb3VudBgDIAEoBVIOdG90YWxSb3dzQ291bnQSFAoFbGltaXQYBCABKAVSBWxpbWl0EhYKBm9mZnNldBgFIAEoBVIGb2Zmc2V0Eh4KCm5leHRPZmZzZXQYBiABKAVSCm5leHRPZmZzZXQSLgoEZGF0YRgHIAMoCzIaLnN0YXRpY19ncnBjLnJlbnRhbC5SZW50YWxSBGRhdGESIgoMZXJyb3JNZXNzYWdlGAggAygJUgxlcnJvck1lc3NhZ2U=');
@$core.Deprecated('Use rentalDescriptor instead')
const Rental$json = const {
  '1': 'Rental',
  '2': const [
    const {
      '1': 'rentalId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'rentalId'
    },
    const {
      '1': 'rentalDate',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'rentalDate'
    },
    const {
      '1': 'inventoryId',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'inventoryId'
    },
    const {
      '1': 'customerId',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'customerId'
    },
    const {
      '1': 'returnDate',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'returnDate'
    },
    const {
      '1': 'staffId',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'staffId'
    },
    const {
      '1': 'lastUpdate',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'lastUpdate'
    },
  ],
};

/// Descriptor for `Rental`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rentalDescriptor = $convert.base64Decode(
    'CgZSZW50YWwSPAoIcmVudGFsSWQYASABKAsyIC5zdGF0aWNfZ3JwYy5yZW50YWwuSW50ZWdlclZhbHVlUghyZW50YWxJZBI/CgpyZW50YWxEYXRlGAIgASgLMh8uc3RhdGljX2dycGMucmVudGFsLlN0cmluZ1ZhbHVlUgpyZW50YWxEYXRlEkIKC2ludmVudG9yeUlkGAMgASgLMiAuc3RhdGljX2dycGMucmVudGFsLkludGVnZXJWYWx1ZVILaW52ZW50b3J5SWQSQAoKY3VzdG9tZXJJZBgEIAEoCzIgLnN0YXRpY19ncnBjLnJlbnRhbC5JbnRlZ2VyVmFsdWVSCmN1c3RvbWVySWQSPwoKcmV0dXJuRGF0ZRgFIAEoCzIfLnN0YXRpY19ncnBjLnJlbnRhbC5TdHJpbmdWYWx1ZVIKcmV0dXJuRGF0ZRI6CgdzdGFmZklkGAYgASgLMiAuc3RhdGljX2dycGMucmVudGFsLkludGVnZXJWYWx1ZVIHc3RhZmZJZBI/CgpsYXN0VXBkYXRlGAcgASgLMh8uc3RhdGljX2dycGMucmVudGFsLlN0cmluZ1ZhbHVlUgpsYXN0VXBkYXRl');
@$core.Deprecated('Use rentalPkDescriptor instead')
const RentalPk$json = const {
  '1': 'RentalPk',
  '2': const [
    const {
      '1': 'rentalId',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'rentalId'
    },
  ],
};

/// Descriptor for `RentalPk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rentalPkDescriptor = $convert.base64Decode(
    'CghSZW50YWxQaxI8CghyZW50YWxJZBgBIAEoCzIgLnN0YXRpY19ncnBjLnJlbnRhbC5JbnRlZ2VyVmFsdWVSCHJlbnRhbElk');
@$core.Deprecated('Use rentalToInsertDescriptor instead')
const RentalToInsert$json = const {
  '1': 'RentalToInsert',
  '2': const [
    const {
      '1': 'rentalDate',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'rentalDate'
    },
    const {
      '1': 'inventoryId',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'inventoryId'
    },
    const {
      '1': 'customerId',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'customerId'
    },
    const {
      '1': 'returnDate',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'returnDate'
    },
    const {
      '1': 'staffId',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.IntegerValue',
      '10': 'staffId'
    },
    const {
      '1': 'lastUpdate',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.static_grpc.rental.StringValue',
      '10': 'lastUpdate'
    },
  ],
};

/// Descriptor for `RentalToInsert`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rentalToInsertDescriptor = $convert.base64Decode(
    'Cg5SZW50YWxUb0luc2VydBI/CgpyZW50YWxEYXRlGAEgASgLMh8uc3RhdGljX2dycGMucmVudGFsLlN0cmluZ1ZhbHVlUgpyZW50YWxEYXRlEkIKC2ludmVudG9yeUlkGAIgASgLMiAuc3RhdGljX2dycGMucmVudGFsLkludGVnZXJWYWx1ZVILaW52ZW50b3J5SWQSQAoKY3VzdG9tZXJJZBgDIAEoCzIgLnN0YXRpY19ncnBjLnJlbnRhbC5JbnRlZ2VyVmFsdWVSCmN1c3RvbWVySWQSPwoKcmV0dXJuRGF0ZRgEIAEoCzIfLnN0YXRpY19ncnBjLnJlbnRhbC5TdHJpbmdWYWx1ZVIKcmV0dXJuRGF0ZRI6CgdzdGFmZklkGAUgASgLMiAuc3RhdGljX2dycGMucmVudGFsLkludGVnZXJWYWx1ZVIHc3RhZmZJZBI/CgpsYXN0VXBkYXRlGAYgASgLMh8uc3RhdGljX2dycGMucmVudGFsLlN0cmluZ1ZhbHVlUgpsYXN0VXBkYXRl');
@$core.Deprecated('Use orderByOperatorDescriptor instead')
const OrderByOperator$json = const {
  '1': 'OrderByOperator',
  '2': const [
    const {
      '1': 'column',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.rental.SelectableColumns',
      '10': 'column'
    },
    const {
      '1': 'orderType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.static_grpc.rental.OrderType',
      '10': 'orderType'
    },
  ],
};

/// Descriptor for `OrderByOperator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderByOperatorDescriptor = $convert.base64Decode(
    'Cg9PcmRlckJ5T3BlcmF0b3ISPQoGY29sdW1uGAEgASgOMiUuc3RhdGljX2dycGMucmVudGFsLlNlbGVjdGFibGVDb2x1bW5zUgZjb2x1bW4SOwoJb3JkZXJUeXBlGAIgASgOMh0uc3RhdGljX2dycGMucmVudGFsLk9yZGVyVHlwZVIJb3JkZXJUeXBl');
