///
//  Generated code. Do not modify.
//  source: film_actor.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'film_actor.pbenum.dart';

export 'film_actor.pbenum.dart';

class IntegerValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IntegerValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  IntegerValue._() : super();
  factory IntegerValue({
    $core.int? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory IntegerValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntegerValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntegerValue clone() => IntegerValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntegerValue copyWith(void Function(IntegerValue) updates) =>
      super.copyWith((message) => updates(message as IntegerValue))
          as IntegerValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntegerValue create() => IntegerValue._();
  IntegerValue createEmptyInstance() => create();
  static $pb.PbList<IntegerValue> createRepeated() =>
      $pb.PbList<IntegerValue>();
  @$core.pragma('dart2js:noInline')
  static IntegerValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntegerValue>(create);
  static IntegerValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class StringValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StringValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  StringValue._() : super();
  factory StringValue({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory StringValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StringValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StringValue clone() => StringValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StringValue copyWith(void Function(StringValue) updates) =>
      super.copyWith((message) => updates(message as StringValue))
          as StringValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StringValue create() => StringValue._();
  StringValue createEmptyInstance() => create();
  static $pb.PbList<StringValue> createRepeated() => $pb.PbList<StringValue>();
  @$core.pragma('dart2js:noInline')
  static StringValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringValue>(create);
  static StringValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class NumericValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NumericValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  NumericValue._() : super();
  factory NumericValue({
    $core.double? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory NumericValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NumericValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NumericValue clone() => NumericValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NumericValue copyWith(void Function(NumericValue) updates) =>
      super.copyWith((message) => updates(message as NumericValue))
          as NumericValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NumericValue create() => NumericValue._();
  NumericValue createEmptyInstance() => create();
  static $pb.PbList<NumericValue> createRepeated() =>
      $pb.PbList<NumericValue>();
  @$core.pragma('dart2js:noInline')
  static NumericValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NumericValue>(create);
  static NumericValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BooleanValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BooleanValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  BooleanValue._() : super();
  factory BooleanValue({
    $core.bool? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory BooleanValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BooleanValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BooleanValue clone() => BooleanValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BooleanValue copyWith(void Function(BooleanValue) updates) =>
      super.copyWith((message) => updates(message as BooleanValue))
          as BooleanValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BooleanValue create() => BooleanValue._();
  BooleanValue createEmptyInstance() => create();
  static $pb.PbList<BooleanValue> createRepeated() =>
      $pb.PbList<BooleanValue>();
  @$core.pragma('dart2js:noInline')
  static BooleanValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BooleanValue>(create);
  static BooleanValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class GetRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actorId', $pb.PbFieldType.O3,
        protoName: 'actorId')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filmId',
        $pb.PbFieldType.O3,
        protoName: 'filmId')
    ..hasRequiredFields = false;

  GetRequest._() : super();
  factory GetRequest({
    $core.int? actorId,
    $core.int? filmId,
  }) {
    final _result = create();
    if (actorId != null) {
      _result.actorId = actorId;
    }
    if (filmId != null) {
      _result.filmId = filmId;
    }
    return _result;
  }
  factory GetRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRequest clone() => GetRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRequest copyWith(void Function(GetRequest) updates) =>
      super.copyWith((message) => updates(message as GetRequest))
          as GetRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRequest create() => GetRequest._();
  GetRequest createEmptyInstance() => create();
  static $pb.PbList<GetRequest> createRepeated() => $pb.PbList<GetRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRequest>(create);
  static GetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get actorId => $_getIZ(0);
  @$pb.TagNumber(1)
  set actorId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActorId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get filmId => $_getIZ(1);
  @$pb.TagNumber(2)
  set filmId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilmId() => clearField(2);
}

enum GetResponse_GetResponseResult { data, errorMessage, notSet }

class GetResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetResponse_GetResponseResult>
      _GetResponse_GetResponseResultByTag = {
    2: GetResponse_GetResponseResult.data,
    3: GetResponse_GetResponseResult.errorMessage,
    0: GetResponse_GetResponseResult.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result')
    ..aOM<Film_actor>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data',
        subBuilder: Film_actor.create)
    ..aOS(3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage',
        protoName: 'errorMessage')
    ..hasRequiredFields = false;

  GetResponse._() : super();
  factory GetResponse({
    $core.bool? result,
    Film_actor? data,
    $core.String? errorMessage,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (data != null) {
      _result.data = data;
    }
    if (errorMessage != null) {
      _result.errorMessage = errorMessage;
    }
    return _result;
  }
  factory GetResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetResponse clone() => GetResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetResponse copyWith(void Function(GetResponse) updates) =>
      super.copyWith((message) => updates(message as GetResponse))
          as GetResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetResponse create() => GetResponse._();
  GetResponse createEmptyInstance() => create();
  static $pb.PbList<GetResponse> createRepeated() => $pb.PbList<GetResponse>();
  @$core.pragma('dart2js:noInline')
  static GetResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetResponse>(create);
  static GetResponse? _defaultInstance;

  GetResponse_GetResponseResult whichGetResponseResult() =>
      _GetResponse_GetResponseResultByTag[$_whichOneof(0)]!;
  void clearGetResponseResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  Film_actor get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(Film_actor v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  Film_actor ensureData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => clearField(3);
}

class InsertRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InsertRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..pc<Film_actorToInsert>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: Film_actorToInsert.create)
    ..aOM<InsertOptions>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'options',
        subBuilder: InsertOptions.create)
    ..hasRequiredFields = false;

  InsertRequest._() : super();
  factory InsertRequest({
    $core.Iterable<Film_actorToInsert>? data,
    InsertOptions? options,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory InsertRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InsertRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InsertRequest clone() => InsertRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InsertRequest copyWith(void Function(InsertRequest) updates) =>
      super.copyWith((message) => updates(message as InsertRequest))
          as InsertRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InsertRequest create() => InsertRequest._();
  InsertRequest createEmptyInstance() => create();
  static $pb.PbList<InsertRequest> createRepeated() =>
      $pb.PbList<InsertRequest>();
  @$core.pragma('dart2js:noInline')
  static InsertRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsertRequest>(create);
  static InsertRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Film_actorToInsert> get data => $_getList(0);

  @$pb.TagNumber(2)
  InsertOptions get options => $_getN(1);
  @$pb.TagNumber(2)
  set options(InsertOptions v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptions() => clearField(2);
  @$pb.TagNumber(2)
  InsertOptions ensureOptions() => $_ensure(1);
}

class InsertOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InsertOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inTransaction',
        protoName: 'inTransaction')
    ..hasRequiredFields = false;

  InsertOptions._() : super();
  factory InsertOptions({
    $core.bool? inTransaction,
  }) {
    final _result = create();
    if (inTransaction != null) {
      _result.inTransaction = inTransaction;
    }
    return _result;
  }
  factory InsertOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InsertOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InsertOptions clone() => InsertOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InsertOptions copyWith(void Function(InsertOptions) updates) =>
      super.copyWith((message) => updates(message as InsertOptions))
          as InsertOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InsertOptions create() => InsertOptions._();
  InsertOptions createEmptyInstance() => create();
  static $pb.PbList<InsertOptions> createRepeated() =>
      $pb.PbList<InsertOptions>();
  @$core.pragma('dart2js:noInline')
  static InsertOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsertOptions>(create);
  static InsertOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inTransaction => $_getBF(0);
  @$pb.TagNumber(1)
  set inTransaction($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInTransaction() => clearField(1);
}

class InsertResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InsertResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsToInsert', $pb.PbFieldType.O3,
        protoName: 'rowsToInsert')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsInserted',
        $pb.PbFieldType.O3,
        protoName: 'rowsInserted')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  InsertResponse._() : super();
  factory InsertResponse({
    $core.bool? result,
    $core.int? rowsToInsert,
    $core.int? rowsInserted,
    $core.Iterable<$core.String>? errorMessage,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (rowsToInsert != null) {
      _result.rowsToInsert = rowsToInsert;
    }
    if (rowsInserted != null) {
      _result.rowsInserted = rowsInserted;
    }
    if (errorMessage != null) {
      _result.errorMessage.addAll(errorMessage);
    }
    return _result;
  }
  factory InsertResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InsertResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InsertResponse clone() => InsertResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InsertResponse copyWith(void Function(InsertResponse) updates) =>
      super.copyWith((message) => updates(message as InsertResponse))
          as InsertResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InsertResponse create() => InsertResponse._();
  InsertResponse createEmptyInstance() => create();
  static $pb.PbList<InsertResponse> createRepeated() =>
      $pb.PbList<InsertResponse>();
  @$core.pragma('dart2js:noInline')
  static InsertResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InsertResponse>(create);
  static InsertResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rowsToInsert => $_getIZ(1);
  @$pb.TagNumber(2)
  set rowsToInsert($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRowsToInsert() => $_has(1);
  @$pb.TagNumber(2)
  void clearRowsToInsert() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rowsInserted => $_getIZ(2);
  @$pb.TagNumber(3)
  set rowsInserted($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRowsInserted() => $_has(2);
  @$pb.TagNumber(3)
  void clearRowsInserted() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get errorMessage => $_getList(3);
}

class UpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..pc<Film_actor>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: Film_actor.create)
    ..aOM<UpdateOptions>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'options',
        subBuilder: UpdateOptions.create)
    ..hasRequiredFields = false;

  UpdateRequest._() : super();
  factory UpdateRequest({
    $core.Iterable<Film_actor>? data,
    UpdateOptions? options,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory UpdateRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateRequest clone() => UpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateRequest copyWith(void Function(UpdateRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateRequest))
          as UpdateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateRequest create() => UpdateRequest._();
  UpdateRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRequest> createRepeated() =>
      $pb.PbList<UpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRequest>(create);
  static UpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Film_actor> get data => $_getList(0);

  @$pb.TagNumber(2)
  UpdateOptions get options => $_getN(1);
  @$pb.TagNumber(2)
  set options(UpdateOptions v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptions() => clearField(2);
  @$pb.TagNumber(2)
  UpdateOptions ensureOptions() => $_ensure(1);
}

class UpdateOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inTransaction',
        protoName: 'inTransaction')
    ..hasRequiredFields = false;

  UpdateOptions._() : super();
  factory UpdateOptions({
    $core.bool? inTransaction,
  }) {
    final _result = create();
    if (inTransaction != null) {
      _result.inTransaction = inTransaction;
    }
    return _result;
  }
  factory UpdateOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateOptions clone() => UpdateOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateOptions copyWith(void Function(UpdateOptions) updates) =>
      super.copyWith((message) => updates(message as UpdateOptions))
          as UpdateOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateOptions create() => UpdateOptions._();
  UpdateOptions createEmptyInstance() => create();
  static $pb.PbList<UpdateOptions> createRepeated() =>
      $pb.PbList<UpdateOptions>();
  @$core.pragma('dart2js:noInline')
  static UpdateOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOptions>(create);
  static UpdateOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inTransaction => $_getBF(0);
  @$pb.TagNumber(1)
  set inTransaction($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInTransaction() => clearField(1);
}

class UpdateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsToUpdate', $pb.PbFieldType.O3,
        protoName: 'rowsToUpdate')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsUpdated',
        $pb.PbFieldType.O3,
        protoName: 'rowsUpdated')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  UpdateResponse._() : super();
  factory UpdateResponse({
    $core.bool? result,
    $core.int? rowsToUpdate,
    $core.int? rowsUpdated,
    $core.Iterable<$core.String>? errorMessage,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (rowsToUpdate != null) {
      _result.rowsToUpdate = rowsToUpdate;
    }
    if (rowsUpdated != null) {
      _result.rowsUpdated = rowsUpdated;
    }
    if (errorMessage != null) {
      _result.errorMessage.addAll(errorMessage);
    }
    return _result;
  }
  factory UpdateResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateResponse clone() => UpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateResponse copyWith(void Function(UpdateResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateResponse))
          as UpdateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateResponse create() => UpdateResponse._();
  UpdateResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateResponse> createRepeated() =>
      $pb.PbList<UpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateResponse>(create);
  static UpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rowsToUpdate => $_getIZ(1);
  @$pb.TagNumber(2)
  set rowsToUpdate($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRowsToUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearRowsToUpdate() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rowsUpdated => $_getIZ(2);
  @$pb.TagNumber(3)
  set rowsUpdated($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRowsUpdated() => $_has(2);
  @$pb.TagNumber(3)
  void clearRowsUpdated() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get errorMessage => $_getList(3);
}

class DeleteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..pc<Film_actorPk>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: Film_actorPk.create)
    ..aOM<DeleteOptions>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'options',
        subBuilder: DeleteOptions.create)
    ..hasRequiredFields = false;

  DeleteRequest._() : super();
  factory DeleteRequest({
    $core.Iterable<Film_actorPk>? data,
    DeleteOptions? options,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory DeleteRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteRequest clone() => DeleteRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteRequest copyWith(void Function(DeleteRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteRequest))
          as DeleteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRequest create() => DeleteRequest._();
  DeleteRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRequest> createRepeated() =>
      $pb.PbList<DeleteRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteRequest>(create);
  static DeleteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Film_actorPk> get data => $_getList(0);

  @$pb.TagNumber(2)
  DeleteOptions get options => $_getN(1);
  @$pb.TagNumber(2)
  set options(DeleteOptions v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptions() => clearField(2);
  @$pb.TagNumber(2)
  DeleteOptions ensureOptions() => $_ensure(1);
}

class DeleteOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inTransaction',
        protoName: 'inTransaction')
    ..hasRequiredFields = false;

  DeleteOptions._() : super();
  factory DeleteOptions({
    $core.bool? inTransaction,
  }) {
    final _result = create();
    if (inTransaction != null) {
      _result.inTransaction = inTransaction;
    }
    return _result;
  }
  factory DeleteOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteOptions clone() => DeleteOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteOptions copyWith(void Function(DeleteOptions) updates) =>
      super.copyWith((message) => updates(message as DeleteOptions))
          as DeleteOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteOptions create() => DeleteOptions._();
  DeleteOptions createEmptyInstance() => create();
  static $pb.PbList<DeleteOptions> createRepeated() =>
      $pb.PbList<DeleteOptions>();
  @$core.pragma('dart2js:noInline')
  static DeleteOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOptions>(create);
  static DeleteOptions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inTransaction => $_getBF(0);
  @$pb.TagNumber(1)
  set inTransaction($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearInTransaction() => clearField(1);
}

class DeleteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsToDelete', $pb.PbFieldType.O3,
        protoName: 'rowsToDelete')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsDeleted',
        $pb.PbFieldType.O3,
        protoName: 'rowsDeleted')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  DeleteResponse._() : super();
  factory DeleteResponse({
    $core.bool? result,
    $core.int? rowsToDelete,
    $core.int? rowsDeleted,
    $core.Iterable<$core.String>? errorMessage,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (rowsToDelete != null) {
      _result.rowsToDelete = rowsToDelete;
    }
    if (rowsDeleted != null) {
      _result.rowsDeleted = rowsDeleted;
    }
    if (errorMessage != null) {
      _result.errorMessage.addAll(errorMessage);
    }
    return _result;
  }
  factory DeleteResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteResponse clone() => DeleteResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteResponse copyWith(void Function(DeleteResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteResponse))
          as DeleteResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteResponse create() => DeleteResponse._();
  DeleteResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteResponse> createRepeated() =>
      $pb.PbList<DeleteResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteResponse>(create);
  static DeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rowsToDelete => $_getIZ(1);
  @$pb.TagNumber(2)
  set rowsToDelete($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRowsToDelete() => $_has(1);
  @$pb.TagNumber(2)
  void clearRowsToDelete() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rowsDeleted => $_getIZ(2);
  @$pb.TagNumber(3)
  set rowsDeleted($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRowsDeleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearRowsDeleted() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get errorMessage => $_getList(3);
}

class SelectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SelectRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..pc<SelectableColumns>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'columns', $pb.PbFieldType.PE,
        valueOf: SelectableColumns.valueOf,
        enumValues: SelectableColumns.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'where')
    ..pc<OrderByOperator>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy',
        $pb.PbFieldType.PM,
        protoName: 'orderBy',
        subBuilder: OrderByOperator.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  SelectRequest._() : super();
  factory SelectRequest({
    $core.Iterable<SelectableColumns>? columns,
    $core.String? where,
    $core.Iterable<OrderByOperator>? orderBy,
    $core.int? limit,
    $core.int? offset,
  }) {
    final _result = create();
    if (columns != null) {
      _result.columns.addAll(columns);
    }
    if (where != null) {
      _result.where = where;
    }
    if (orderBy != null) {
      _result.orderBy.addAll(orderBy);
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory SelectRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SelectRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SelectRequest clone() => SelectRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SelectRequest copyWith(void Function(SelectRequest) updates) =>
      super.copyWith((message) => updates(message as SelectRequest))
          as SelectRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectRequest create() => SelectRequest._();
  SelectRequest createEmptyInstance() => create();
  static $pb.PbList<SelectRequest> createRepeated() =>
      $pb.PbList<SelectRequest>();
  @$core.pragma('dart2js:noInline')
  static SelectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectRequest>(create);
  static SelectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SelectableColumns> get columns => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get where => $_getSZ(1);
  @$pb.TagNumber(2)
  set where($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWhere() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhere() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<OrderByOperator> get orderBy => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get offset => $_getIZ(4);
  @$pb.TagNumber(5)
  set offset($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => clearField(5);
}

class SelectResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SelectResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rowsSelected', $pb.PbFieldType.O3,
        protoName: 'rowsSelected')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRowsCount',
        $pb.PbFieldType.O3,
        protoName: 'totalRowsCount')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextOffset', $pb.PbFieldType.O3, protoName: 'nextOffset')
    ..pc<Film_actor>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: Film_actor.create)
    ..pPS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMessage', protoName: 'errorMessage')
    ..hasRequiredFields = false;

  SelectResponse._() : super();
  factory SelectResponse({
    $core.bool? result,
    $core.int? rowsSelected,
    $core.int? totalRowsCount,
    $core.int? limit,
    $core.int? offset,
    $core.int? nextOffset,
    $core.Iterable<Film_actor>? data,
    $core.Iterable<$core.String>? errorMessage,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (rowsSelected != null) {
      _result.rowsSelected = rowsSelected;
    }
    if (totalRowsCount != null) {
      _result.totalRowsCount = totalRowsCount;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (nextOffset != null) {
      _result.nextOffset = nextOffset;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (errorMessage != null) {
      _result.errorMessage.addAll(errorMessage);
    }
    return _result;
  }
  factory SelectResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SelectResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SelectResponse clone() => SelectResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SelectResponse copyWith(void Function(SelectResponse) updates) =>
      super.copyWith((message) => updates(message as SelectResponse))
          as SelectResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SelectResponse create() => SelectResponse._();
  SelectResponse createEmptyInstance() => create();
  static $pb.PbList<SelectResponse> createRepeated() =>
      $pb.PbList<SelectResponse>();
  @$core.pragma('dart2js:noInline')
  static SelectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectResponse>(create);
  static SelectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rowsSelected => $_getIZ(1);
  @$pb.TagNumber(2)
  set rowsSelected($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRowsSelected() => $_has(1);
  @$pb.TagNumber(2)
  void clearRowsSelected() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalRowsCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalRowsCount($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotalRowsCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalRowsCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get offset => $_getIZ(4);
  @$pb.TagNumber(5)
  set offset($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get nextOffset => $_getIZ(5);
  @$pb.TagNumber(6)
  set nextOffset($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNextOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextOffset() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Film_actor> get data => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get errorMessage => $_getList(7);
}

class Film_actor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Film_actor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOM<IntegerValue>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actorId',
        protoName: 'actorId', subBuilder: IntegerValue.create)
    ..aOM<IntegerValue>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filmId',
        protoName: 'filmId', subBuilder: IntegerValue.create)
    ..aOM<StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate',
        protoName: 'lastUpdate', subBuilder: StringValue.create)
    ..hasRequiredFields = false;

  Film_actor._() : super();
  factory Film_actor({
    IntegerValue? actorId,
    IntegerValue? filmId,
    StringValue? lastUpdate,
  }) {
    final _result = create();
    if (actorId != null) {
      _result.actorId = actorId;
    }
    if (filmId != null) {
      _result.filmId = filmId;
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    return _result;
  }
  factory Film_actor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Film_actor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Film_actor clone() => Film_actor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Film_actor copyWith(void Function(Film_actor) updates) =>
      super.copyWith((message) => updates(message as Film_actor))
          as Film_actor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Film_actor create() => Film_actor._();
  Film_actor createEmptyInstance() => create();
  static $pb.PbList<Film_actor> createRepeated() => $pb.PbList<Film_actor>();
  @$core.pragma('dart2js:noInline')
  static Film_actor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Film_actor>(create);
  static Film_actor? _defaultInstance;

  @$pb.TagNumber(1)
  IntegerValue get actorId => $_getN(0);
  @$pb.TagNumber(1)
  set actorId(IntegerValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActorId() => clearField(1);
  @$pb.TagNumber(1)
  IntegerValue ensureActorId() => $_ensure(0);

  @$pb.TagNumber(2)
  IntegerValue get filmId => $_getN(1);
  @$pb.TagNumber(2)
  set filmId(IntegerValue v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilmId() => clearField(2);
  @$pb.TagNumber(2)
  IntegerValue ensureFilmId() => $_ensure(1);

  @$pb.TagNumber(3)
  StringValue get lastUpdate => $_getN(2);
  @$pb.TagNumber(3)
  set lastUpdate(StringValue v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastUpdate() => clearField(3);
  @$pb.TagNumber(3)
  StringValue ensureLastUpdate() => $_ensure(2);
}

class Film_actorPk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Film_actorPk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOM<IntegerValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actorId',
        protoName: 'actorId',
        subBuilder: IntegerValue.create)
    ..aOM<IntegerValue>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filmId',
        protoName: 'filmId', subBuilder: IntegerValue.create)
    ..hasRequiredFields = false;

  Film_actorPk._() : super();
  factory Film_actorPk({
    IntegerValue? actorId,
    IntegerValue? filmId,
  }) {
    final _result = create();
    if (actorId != null) {
      _result.actorId = actorId;
    }
    if (filmId != null) {
      _result.filmId = filmId;
    }
    return _result;
  }
  factory Film_actorPk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Film_actorPk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Film_actorPk clone() => Film_actorPk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Film_actorPk copyWith(void Function(Film_actorPk) updates) =>
      super.copyWith((message) => updates(message as Film_actorPk))
          as Film_actorPk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Film_actorPk create() => Film_actorPk._();
  Film_actorPk createEmptyInstance() => create();
  static $pb.PbList<Film_actorPk> createRepeated() =>
      $pb.PbList<Film_actorPk>();
  @$core.pragma('dart2js:noInline')
  static Film_actorPk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Film_actorPk>(create);
  static Film_actorPk? _defaultInstance;

  @$pb.TagNumber(1)
  IntegerValue get actorId => $_getN(0);
  @$pb.TagNumber(1)
  set actorId(IntegerValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActorId() => clearField(1);
  @$pb.TagNumber(1)
  IntegerValue ensureActorId() => $_ensure(0);

  @$pb.TagNumber(2)
  IntegerValue get filmId => $_getN(1);
  @$pb.TagNumber(2)
  set filmId(IntegerValue v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilmId() => clearField(2);
  @$pb.TagNumber(2)
  IntegerValue ensureFilmId() => $_ensure(1);
}

class Film_actorToInsert extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Film_actorToInsert',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..aOM<IntegerValue>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actorId',
        protoName: 'actorId', subBuilder: IntegerValue.create)
    ..aOM<IntegerValue>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filmId',
        protoName: 'filmId', subBuilder: IntegerValue.create)
    ..aOM<StringValue>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate',
        protoName: 'lastUpdate', subBuilder: StringValue.create)
    ..hasRequiredFields = false;

  Film_actorToInsert._() : super();
  factory Film_actorToInsert({
    IntegerValue? actorId,
    IntegerValue? filmId,
    StringValue? lastUpdate,
  }) {
    final _result = create();
    if (actorId != null) {
      _result.actorId = actorId;
    }
    if (filmId != null) {
      _result.filmId = filmId;
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    return _result;
  }
  factory Film_actorToInsert.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Film_actorToInsert.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Film_actorToInsert clone() => Film_actorToInsert()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Film_actorToInsert copyWith(void Function(Film_actorToInsert) updates) =>
      super.copyWith((message) => updates(message as Film_actorToInsert))
          as Film_actorToInsert; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Film_actorToInsert create() => Film_actorToInsert._();
  Film_actorToInsert createEmptyInstance() => create();
  static $pb.PbList<Film_actorToInsert> createRepeated() =>
      $pb.PbList<Film_actorToInsert>();
  @$core.pragma('dart2js:noInline')
  static Film_actorToInsert getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Film_actorToInsert>(create);
  static Film_actorToInsert? _defaultInstance;

  @$pb.TagNumber(1)
  IntegerValue get actorId => $_getN(0);
  @$pb.TagNumber(1)
  set actorId(IntegerValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActorId() => clearField(1);
  @$pb.TagNumber(1)
  IntegerValue ensureActorId() => $_ensure(0);

  @$pb.TagNumber(2)
  IntegerValue get filmId => $_getN(1);
  @$pb.TagNumber(2)
  set filmId(IntegerValue v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilmId() => clearField(2);
  @$pb.TagNumber(2)
  IntegerValue ensureFilmId() => $_ensure(1);

  @$pb.TagNumber(3)
  StringValue get lastUpdate => $_getN(2);
  @$pb.TagNumber(3)
  set lastUpdate(StringValue v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastUpdate() => clearField(3);
  @$pb.TagNumber(3)
  StringValue ensureLastUpdate() => $_ensure(2);
}

class OrderByOperator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OrderByOperator',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'static_grpc.film_actor'),
      createEmptyInstance: create)
    ..e<SelectableColumns>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'column', $pb.PbFieldType.OE,
        defaultOrMaker: SelectableColumns.allColumns,
        valueOf: SelectableColumns.valueOf,
        enumValues: SelectableColumns.values)
    ..e<OrderType>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderType',
        $pb.PbFieldType.OE,
        protoName: 'orderType',
        defaultOrMaker: OrderType.asc,
        valueOf: OrderType.valueOf,
        enumValues: OrderType.values)
    ..hasRequiredFields = false;

  OrderByOperator._() : super();
  factory OrderByOperator({
    SelectableColumns? column,
    OrderType? orderType,
  }) {
    final _result = create();
    if (column != null) {
      _result.column = column;
    }
    if (orderType != null) {
      _result.orderType = orderType;
    }
    return _result;
  }
  factory OrderByOperator.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OrderByOperator.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OrderByOperator clone() => OrderByOperator()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OrderByOperator copyWith(void Function(OrderByOperator) updates) =>
      super.copyWith((message) => updates(message as OrderByOperator))
          as OrderByOperator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderByOperator create() => OrderByOperator._();
  OrderByOperator createEmptyInstance() => create();
  static $pb.PbList<OrderByOperator> createRepeated() =>
      $pb.PbList<OrderByOperator>();
  @$core.pragma('dart2js:noInline')
  static OrderByOperator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderByOperator>(create);
  static OrderByOperator? _defaultInstance;

  @$pb.TagNumber(1)
  SelectableColumns get column => $_getN(0);
  @$pb.TagNumber(1)
  set column(SelectableColumns v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasColumn() => $_has(0);
  @$pb.TagNumber(1)
  void clearColumn() => clearField(1);

  @$pb.TagNumber(2)
  OrderType get orderType => $_getN(1);
  @$pb.TagNumber(2)
  set orderType(OrderType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOrderType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderType() => clearField(2);
}
