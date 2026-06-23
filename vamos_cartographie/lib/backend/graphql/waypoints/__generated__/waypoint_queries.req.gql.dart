// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/backend/graphql/shared/__generated__/geo_fields.ast.gql.dart'
    as _i10;
import 'package:vamos_cartographie/backend/graphql/topology/vertex/__generated__/vertex_fields.ast.gql.dart'
    as _i9;
import 'package:vamos_cartographie/backend/graphql/trips/__generated__/trip_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/backend/graphql/waypoints/__generated__/waypoint_fields.ast.gql.dart'
    as _i8;
import 'package:vamos_cartographie/backend/graphql/waypoints/__generated__/waypoint_queries.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/backend/graphql/waypoints/__generated__/waypoint_queries.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/backend/graphql/waypoints/__generated__/waypoint_queries.var.gql.dart'
    as _i3;

class GGetWaypointsReq
    implements
        _i1.OperationRequest<_i2.GGetWaypointsData, _i3.GGetWaypointsVars> {
  GGetWaypointsReq({
    required this.vars,
    _i4.Operation? operation,
    this.requestId,
    this.updateResult,
    this.optimisticResponse,
    this.updateCacheHandlerKey,
    this.updateCacheHandlerContext,
    this.fetchPolicy,
    this.executeOnListen = true,
    this.context,
  }) : operation = operation ?? _operation;

  final _i3.GGetWaypointsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GGetWaypointsData? Function(
    _i2.GGetWaypointsData?,
    _i2.GGetWaypointsData?,
  )? updateResult;

  final _i2.GGetWaypointsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.GetWaypoints,
    _i7.TripFields,
    _i8.WaypointFields,
    _i9.VertexFields,
    _i10.LatLngFields,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'GetWaypoints',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GGetWaypointsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetWaypointsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GGetWaypointsData data) => data.toJson();

  _i1.OperationRequest<_i2.GGetWaypointsData, _i3.GGetWaypointsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GGetWaypointsReq(
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

  GGetWaypointsReq copyWith({
    _i3.GGetWaypointsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GGetWaypointsData? Function(
      _i2.GGetWaypointsData?,
      _i2.GGetWaypointsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GGetWaypointsData? optimisticResponse,
    bool optimisticResponseIsSet = false,
    String? updateCacheHandlerKey,
    bool updateCacheHandlerKeyIsSet = false,
    Map<String, dynamic>? updateCacheHandlerContext,
    bool updateCacheHandlerContextIsSet = false,
    _i1.FetchPolicy? fetchPolicy,
    bool fetchPolicyIsSet = false,
    bool? executeOnListen,
    _i4.Context? context,
    bool contextIsSet = false,
  }) {
    return GGetWaypointsReq(
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
        (other is GGetWaypointsReq &&
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
    return 'GGetWaypointsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
