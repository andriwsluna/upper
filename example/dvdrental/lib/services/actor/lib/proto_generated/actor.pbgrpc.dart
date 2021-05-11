///
//  Generated code. Do not modify.
//  source: actor.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'actor.pb.dart' as $0;
export 'actor.pb.dart';

class ActorServiceClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.GetRequest, $0.GetResponse>(
      '/static_grpc.actor.ActorService/get',
      ($0.GetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetResponse.fromBuffer(value));
  static final _$select =
      $grpc.ClientMethod<$0.SelectRequest, $0.SelectResponse>(
          '/static_grpc.actor.ActorService/select',
          ($0.SelectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SelectResponse.fromBuffer(value));
  static final _$insert =
      $grpc.ClientMethod<$0.InsertRequest, $0.InsertResponse>(
          '/static_grpc.actor.ActorService/insert',
          ($0.InsertRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.InsertResponse.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$0.UpdateRequest, $0.UpdateResponse>(
          '/static_grpc.actor.ActorService/update',
          ($0.UpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpdateResponse.fromBuffer(value));
  static final _$delete =
      $grpc.ClientMethod<$0.DeleteRequest, $0.DeleteResponse>(
          '/static_grpc.actor.ActorService/delete',
          ($0.DeleteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteResponse.fromBuffer(value));

  ActorServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetResponse> get($0.GetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get, request, options: options);
  }

  $grpc.ResponseFuture<$0.SelectResponse> select($0.SelectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$select, request, options: options);
  }

  $grpc.ResponseFuture<$0.InsertResponse> insert($0.InsertRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$insert, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateResponse> update($0.UpdateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteResponse> delete($0.DeleteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

abstract class ActorServiceBase extends $grpc.Service {
  $core.String get $name => 'static_grpc.actor.ActorService';

  ActorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetRequest, $0.GetResponse>(
        'get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequest.fromBuffer(value),
        ($0.GetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SelectRequest, $0.SelectResponse>(
        'select',
        select_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SelectRequest.fromBuffer(value),
        ($0.SelectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InsertRequest, $0.InsertResponse>(
        'insert',
        insert_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InsertRequest.fromBuffer(value),
        ($0.InsertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateRequest, $0.UpdateResponse>(
        'update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateRequest.fromBuffer(value),
        ($0.UpdateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteRequest, $0.DeleteResponse>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRequest.fromBuffer(value),
        ($0.DeleteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetResponse> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRequest> request) async {
    return get(call, await request);
  }

  $async.Future<$0.SelectResponse> select_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SelectRequest> request) async {
    return select(call, await request);
  }

  $async.Future<$0.InsertResponse> insert_Pre(
      $grpc.ServiceCall call, $async.Future<$0.InsertRequest> request) async {
    return insert(call, await request);
  }

  $async.Future<$0.UpdateResponse> update_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdateRequest> request) async {
    return update(call, await request);
  }

  $async.Future<$0.DeleteResponse> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.GetResponse> get(
      $grpc.ServiceCall call, $0.GetRequest request);
  $async.Future<$0.SelectResponse> select(
      $grpc.ServiceCall call, $0.SelectRequest request);
  $async.Future<$0.InsertResponse> insert(
      $grpc.ServiceCall call, $0.InsertRequest request);
  $async.Future<$0.UpdateResponse> update(
      $grpc.ServiceCall call, $0.UpdateRequest request);
  $async.Future<$0.DeleteResponse> delete(
      $grpc.ServiceCall call, $0.DeleteRequest request);
}
