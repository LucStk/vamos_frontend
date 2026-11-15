// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i8;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i9;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/stay.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/stay.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/stay.var.gql.dart'
    as _i3;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.ast.gql.dart'
    as _i7;

class GSetStayReq
    implements _i1.OperationRequest<_i2.GSetStayData, _i3.GSetStayVars> {
  GSetStayReq({
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

  final _i3.GSetStayVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GSetStayData? Function(
    _i2.GSetStayData?,
    _i2.GSetStayData?,
  )? updateResult;

  final _i2.GSetStayData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.SetStay,
    _i7.DayNoteDetails,
    _i7.StayDetails,
    _i7.WaypointDetails,
    _i8.LatLng,
    _i9.StoredFile,
    _i9.FileAttachment,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'SetStay',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GSetStayData? parseData(Map<String, dynamic> json) =>
      _i2.GSetStayData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GSetStayData data) => data.toJson();

  _i1.OperationRequest<_i2.GSetStayData, _i3.GSetStayVars> transformOperation(
      _i4.Operation Function(_i4.Operation) transform) {
    return GSetStayReq(
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

  GSetStayReq copyWith({
    _i3.GSetStayVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GSetStayData? Function(
      _i2.GSetStayData?,
      _i2.GSetStayData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GSetStayData? optimisticResponse,
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
    return GSetStayReq(
      vars: vars ?? this.vars,
      operation: operation ?? this.operation,
      requestId:
          requestId != null || requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResult != null || updateResultIsSet
          ? updateResult
          : this.updateResult,
      optimisticResponse: optimisticResponse != null || optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey:
          updateCacheHandlerKey != null || updateCacheHandlerKeyIsSet
              ? updateCacheHandlerKey
              : this.updateCacheHandlerKey,
      updateCacheHandlerContext:
          updateCacheHandlerContext != null || updateCacheHandlerContextIsSet
              ? updateCacheHandlerContext
              : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicy != null || fetchPolicyIsSet
          ? fetchPolicy
          : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: context != null || contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetStayReq &&
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
    return 'GSetStayReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GClearStayReq
    implements _i1.OperationRequest<_i2.GClearStayData, _i3.GClearStayVars> {
  GClearStayReq({
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

  final _i3.GClearStayVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GClearStayData? Function(
    _i2.GClearStayData?,
    _i2.GClearStayData?,
  )? updateResult;

  final _i2.GClearStayData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.ClearStay,
    _i7.DayNoteDetails,
    _i7.StayDetails,
    _i7.WaypointDetails,
    _i8.LatLng,
    _i9.StoredFile,
    _i9.FileAttachment,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'ClearStay',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GClearStayData? parseData(Map<String, dynamic> json) =>
      _i2.GClearStayData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GClearStayData data) => data.toJson();

  _i1.OperationRequest<_i2.GClearStayData, _i3.GClearStayVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GClearStayReq(
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

  GClearStayReq copyWith({
    _i3.GClearStayVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GClearStayData? Function(
      _i2.GClearStayData?,
      _i2.GClearStayData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GClearStayData? optimisticResponse,
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
    return GClearStayReq(
      vars: vars ?? this.vars,
      operation: operation ?? this.operation,
      requestId:
          requestId != null || requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResult != null || updateResultIsSet
          ? updateResult
          : this.updateResult,
      optimisticResponse: optimisticResponse != null || optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey:
          updateCacheHandlerKey != null || updateCacheHandlerKeyIsSet
              ? updateCacheHandlerKey
              : this.updateCacheHandlerKey,
      updateCacheHandlerContext:
          updateCacheHandlerContext != null || updateCacheHandlerContextIsSet
              ? updateCacheHandlerContext
              : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicy != null || fetchPolicyIsSet
          ? fetchPolicy
          : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: context != null || contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GClearStayReq &&
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
    return 'GClearStayReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GSetDayNoteReq
    implements _i1.OperationRequest<_i2.GSetDayNoteData, _i3.GSetDayNoteVars> {
  GSetDayNoteReq({
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

  final _i3.GSetDayNoteVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GSetDayNoteData? Function(
    _i2.GSetDayNoteData?,
    _i2.GSetDayNoteData?,
  )? updateResult;

  final _i2.GSetDayNoteData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.SetDayNote,
    _i7.DayNoteDetails,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'SetDayNote',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GSetDayNoteData? parseData(Map<String, dynamic> json) =>
      _i2.GSetDayNoteData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GSetDayNoteData data) => data.toJson();

  _i1.OperationRequest<_i2.GSetDayNoteData, _i3.GSetDayNoteVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GSetDayNoteReq(
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

  GSetDayNoteReq copyWith({
    _i3.GSetDayNoteVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GSetDayNoteData? Function(
      _i2.GSetDayNoteData?,
      _i2.GSetDayNoteData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GSetDayNoteData? optimisticResponse,
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
    return GSetDayNoteReq(
      vars: vars ?? this.vars,
      operation: operation ?? this.operation,
      requestId:
          requestId != null || requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResult != null || updateResultIsSet
          ? updateResult
          : this.updateResult,
      optimisticResponse: optimisticResponse != null || optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey:
          updateCacheHandlerKey != null || updateCacheHandlerKeyIsSet
              ? updateCacheHandlerKey
              : this.updateCacheHandlerKey,
      updateCacheHandlerContext:
          updateCacheHandlerContext != null || updateCacheHandlerContextIsSet
              ? updateCacheHandlerContext
              : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicy != null || fetchPolicyIsSet
          ? fetchPolicy
          : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: context != null || contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSetDayNoteReq &&
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
    return 'GSetDayNoteReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GFinalDayNoteReq
    implements
        _i1.OperationRequest<_i2.GFinalDayNoteData, _i3.GFinalDayNoteVars> {
  GFinalDayNoteReq({
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

  final _i3.GFinalDayNoteVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GFinalDayNoteData? Function(
    _i2.GFinalDayNoteData?,
    _i2.GFinalDayNoteData?,
  )? updateResult;

  final _i2.GFinalDayNoteData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.FinalDayNote,
    _i7.DayNoteDetails,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'FinalDayNote',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GFinalDayNoteData? parseData(Map<String, dynamic> json) =>
      _i2.GFinalDayNoteData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GFinalDayNoteData data) => data.toJson();

  _i1.OperationRequest<_i2.GFinalDayNoteData, _i3.GFinalDayNoteVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GFinalDayNoteReq(
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

  GFinalDayNoteReq copyWith({
    _i3.GFinalDayNoteVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GFinalDayNoteData? Function(
      _i2.GFinalDayNoteData?,
      _i2.GFinalDayNoteData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GFinalDayNoteData? optimisticResponse,
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
    return GFinalDayNoteReq(
      vars: vars ?? this.vars,
      operation: operation ?? this.operation,
      requestId:
          requestId != null || requestIdIsSet ? requestId : this.requestId,
      updateResult: updateResult != null || updateResultIsSet
          ? updateResult
          : this.updateResult,
      optimisticResponse: optimisticResponse != null || optimisticResponseIsSet
          ? optimisticResponse
          : this.optimisticResponse,
      updateCacheHandlerKey:
          updateCacheHandlerKey != null || updateCacheHandlerKeyIsSet
              ? updateCacheHandlerKey
              : this.updateCacheHandlerKey,
      updateCacheHandlerContext:
          updateCacheHandlerContext != null || updateCacheHandlerContextIsSet
              ? updateCacheHandlerContext
              : this.updateCacheHandlerContext,
      fetchPolicy: fetchPolicy != null || fetchPolicyIsSet
          ? fetchPolicy
          : this.fetchPolicy,
      executeOnListen: executeOnListen ?? this.executeOnListen,
      context: context != null || contextIsSet ? context : this.context,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GFinalDayNoteReq &&
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
    return 'GFinalDayNoteReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
