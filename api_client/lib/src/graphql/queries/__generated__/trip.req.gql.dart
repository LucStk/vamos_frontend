// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:api_client/src/graphql/fragments/__generated__/trip.ast.gql.dart'
    as _i6;
import 'package:api_client/src/graphql/queries/__generated__/trip.ast.gql.dart'
    as _i5;
import 'package:api_client/src/graphql/queries/__generated__/trip.data.gql.dart'
    as _i2;
import 'package:api_client/src/graphql/queries/__generated__/trip.var.gql.dart'
    as _i7;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i3;

class GGetAllTripsReq
    implements _i1.OperationRequest<_i2.GGetAllTripsData, Null> {
  GGetAllTripsReq({
    _i3.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final Null vars = null;

  final _i3.Operation operation;

  final String? requestId;

  final _i2.GGetAllTripsData? Function(
    _i2.GGetAllTripsData?,
    _i2.GGetAllTripsData?,
  )? updateResult;

  final _i2.GGetAllTripsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.GetAllTrips,
    _i6.TripFields,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'GetAllTrips',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GGetAllTripsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAllTripsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GGetAllTripsData data) => data.toJson();

  _i1.OperationRequest<_i2.GGetAllTripsData, Null> transformOperation(
      _i3.Operation Function(_i3.Operation) transform) {
    return GGetAllTripsReq(
      operation: transform(operation),
      requestId: requestId,
      updateResult: updateResult,
      optimisticResponse: optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContext,
      fetchPolicy: fetchPolicy,
      executeOnListen: executeOnListen,
      context: context,
    );
  }

  GGetAllTripsReq copyWith({
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GGetAllTripsData? Function(
      _i2.GGetAllTripsData?,
      _i2.GGetAllTripsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GGetAllTripsData? optimisticResponse,
    bool optimisticResponseIsSet = false,
    String? updateCacheHandlerKey,
    bool updateCacheHandlerKeyIsSet = false,
    Map<String, dynamic>? updateCacheHandlerContext,
    bool updateCacheHandlerContextIsSet = false,
    _i1.FetchPolicy? fetchPolicy,
    bool fetchPolicyIsSet = false,
    bool? executeOnListen,
    _i3.Context? context,
    bool contextIsSet = false,
  }) {
    return GGetAllTripsReq(
      operation: operation ?? this.operation,
      requestId: requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResultIsSet ? updateResult : this.updateResult,
      optimisticResponse: optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKeyIsSet
          ? updateCacheHandlerKey
          : this.updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContextIsSet
          ? updateCacheHandlerContext
          : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicyIsSet ? fetchPolicy : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAllTripsReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
                updateCacheHandlerContext, other.updateCacheHandlerContext) &&
            fetchPolicy == other.fetchPolicy &&
            executeOnListen == other.executeOnListen &&
            context == other.context);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        _gqlUtils.deepHash(varsToJson()),
        operation,
        requestId,
        updateResult,
        optimisticResponse,
        updateCacheHandlerKey,
        _gqlUtils.deepHash(updateCacheHandlerContext),
        fetchPolicy,
        executeOnListen,
        context);
  }

  @override
  String toString() {
    return 'GGetAllTripsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GGetTripReq
    implements _i1.OperationRequest<_i2.GGetTripData, _i7.GGetTripVars> {
  GGetTripReq({
    required this.vars,
    _i3.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final _i7.GGetTripVars vars;

  final _i3.Operation operation;

  final String? requestId;

  final _i2.GGetTripData? Function(
    _i2.GGetTripData?,
    _i2.GGetTripData?,
  )? updateResult;

  final _i2.GGetTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.GetTrip,
    _i6.TripFields,
    _i6.SegmentFields,
    _i6.WaypointFields,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'GetTrip',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GGetTripData? parseData(Map<String, dynamic> json) =>
      _i2.GGetTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GGetTripData data) => data.toJson();

  _i1.OperationRequest<_i2.GGetTripData, _i7.GGetTripVars> transformOperation(
      _i3.Operation Function(_i3.Operation) transform) {
    return GGetTripReq(
      vars: vars,
      operation: transform(operation),
      requestId: requestId,
      updateResult: updateResult,
      optimisticResponse: optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContext,
      fetchPolicy: fetchPolicy,
      executeOnListen: executeOnListen,
      context: context,
    );
  }

  GGetTripReq copyWith({
    _i7.GGetTripVars? vars,
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GGetTripData? Function(
      _i2.GGetTripData?,
      _i2.GGetTripData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GGetTripData? optimisticResponse,
    bool optimisticResponseIsSet = false,
    String? updateCacheHandlerKey,
    bool updateCacheHandlerKeyIsSet = false,
    Map<String, dynamic>? updateCacheHandlerContext,
    bool updateCacheHandlerContextIsSet = false,
    _i1.FetchPolicy? fetchPolicy,
    bool fetchPolicyIsSet = false,
    bool? executeOnListen,
    _i3.Context? context,
    bool contextIsSet = false,
  }) {
    return GGetTripReq(
      vars: vars ?? this.vars,
      operation: operation ?? this.operation,
      requestId: requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResultIsSet ? updateResult : this.updateResult,
      optimisticResponse: optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey: updateCacheHandlerKeyIsSet
          ? updateCacheHandlerKey
          : this.updateCacheHandlerKey,
      updateCacheHandlerContext: updateCacheHandlerContextIsSet
          ? updateCacheHandlerContext
          : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicyIsSet ? fetchPolicy : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
                updateCacheHandlerContext, other.updateCacheHandlerContext) &&
            fetchPolicy == other.fetchPolicy &&
            executeOnListen == other.executeOnListen &&
            context == other.context);
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        _gqlUtils.deepHash(varsToJson()),
        operation,
        requestId,
        updateResult,
        optimisticResponse,
        updateCacheHandlerKey,
        _gqlUtils.deepHash(updateCacheHandlerContext),
        fetchPolicy,
        executeOnListen,
        context);
  }

  @override
  String toString() {
    return 'GGetTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
