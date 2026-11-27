// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_insights.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_insights.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_insights.var.gql.dart'
    as _i3;

class GFetchRouteInsightsReq
    implements
        _i1.OperationRequest<_i2.GFetchRouteInsightsData,
            _i3.GFetchRouteInsightsVars> {
  GFetchRouteInsightsReq({
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

  final _i3.GFetchRouteInsightsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GFetchRouteInsightsData? Function(
    _i2.GFetchRouteInsightsData?,
    _i2.GFetchRouteInsightsData?,
  )? updateResult;

  final _i2.GFetchRouteInsightsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.RouteInsightsFields,
    _i6.FetchRouteInsights,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'FetchRouteInsights',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GFetchRouteInsightsData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchRouteInsightsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GFetchRouteInsightsData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GFetchRouteInsightsData, _i3.GFetchRouteInsightsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GFetchRouteInsightsReq(
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

  GFetchRouteInsightsReq copyWith({
    _i3.GFetchRouteInsightsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GFetchRouteInsightsData? Function(
      _i2.GFetchRouteInsightsData?,
      _i2.GFetchRouteInsightsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GFetchRouteInsightsData? optimisticResponse,
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
    return GFetchRouteInsightsReq(
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
        (other is GFetchRouteInsightsReq &&
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
    return 'GFetchRouteInsightsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GRecomputeRouteInsightsReq
    implements
        _i1.OperationRequest<_i2.GRecomputeRouteInsightsData,
            _i3.GRecomputeRouteInsightsVars> {
  GRecomputeRouteInsightsReq({
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

  final _i3.GRecomputeRouteInsightsVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GRecomputeRouteInsightsData? Function(
    _i2.GRecomputeRouteInsightsData?,
    _i2.GRecomputeRouteInsightsData?,
  )? updateResult;

  final _i2.GRecomputeRouteInsightsData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.RouteInsightsFields,
    _i6.RecomputeRouteInsights,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'RecomputeRouteInsights',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GRecomputeRouteInsightsData? parseData(Map<String, dynamic> json) =>
      _i2.GRecomputeRouteInsightsData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GRecomputeRouteInsightsData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GRecomputeRouteInsightsData,
          _i3.GRecomputeRouteInsightsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GRecomputeRouteInsightsReq(
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

  GRecomputeRouteInsightsReq copyWith({
    _i3.GRecomputeRouteInsightsVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GRecomputeRouteInsightsData? Function(
      _i2.GRecomputeRouteInsightsData?,
      _i2.GRecomputeRouteInsightsData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GRecomputeRouteInsightsData? optimisticResponse,
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
    return GRecomputeRouteInsightsReq(
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
        (other is GRecomputeRouteInsightsReq &&
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
    return 'GRecomputeRouteInsightsReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GFetchProposalElevationReq
    implements
        _i1.OperationRequest<_i2.GFetchProposalElevationData,
            _i3.GFetchProposalElevationVars> {
  GFetchProposalElevationReq({
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

  final _i3.GFetchProposalElevationVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GFetchProposalElevationData? Function(
    _i2.GFetchProposalElevationData?,
    _i2.GFetchProposalElevationData?,
  )? updateResult;

  final _i2.GFetchProposalElevationData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.ElevationProfileFields,
    _i6.FetchProposalElevation,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'FetchProposalElevation',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GFetchProposalElevationData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchProposalElevationData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GFetchProposalElevationData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GFetchProposalElevationData,
          _i3.GFetchProposalElevationVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GFetchProposalElevationReq(
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

  GFetchProposalElevationReq copyWith({
    _i3.GFetchProposalElevationVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GFetchProposalElevationData? Function(
      _i2.GFetchProposalElevationData?,
      _i2.GFetchProposalElevationData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GFetchProposalElevationData? optimisticResponse,
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
    return GFetchProposalElevationReq(
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
        (other is GFetchProposalElevationReq &&
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
    return 'GFetchProposalElevationReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GFetchProposalWaysReq
    implements
        _i1.OperationRequest<_i2.GFetchProposalWaysData,
            _i3.GFetchProposalWaysVars> {
  GFetchProposalWaysReq({
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

  final _i3.GFetchProposalWaysVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GFetchProposalWaysData? Function(
    _i2.GFetchProposalWaysData?,
    _i2.GFetchProposalWaysData?,
  )? updateResult;

  final _i2.GFetchProposalWaysData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.ProposalWaysFields,
    _i6.FetchProposalWays,
    _i7.LatLng,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'FetchProposalWays',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GFetchProposalWaysData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchProposalWaysData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GFetchProposalWaysData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GFetchProposalWaysData, _i3.GFetchProposalWaysVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GFetchProposalWaysReq(
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

  GFetchProposalWaysReq copyWith({
    _i3.GFetchProposalWaysVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GFetchProposalWaysData? Function(
      _i2.GFetchProposalWaysData?,
      _i2.GFetchProposalWaysData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GFetchProposalWaysData? optimisticResponse,
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
    return GFetchProposalWaysReq(
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
        (other is GFetchProposalWaysReq &&
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
    return 'GFetchProposalWaysReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GRouteInsightsFieldsReq
    implements _i1.FragmentRequest<_i2.GRouteInsightsFieldsData, Null> {
  GRouteInsightsFieldsReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'RouteInsightsFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.RouteInsightsFields]);

  _i2.GRouteInsightsFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GRouteInsightsFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GRouteInsightsFieldsData data) =>
      data.toJson();

  GRouteInsightsFieldsReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GRouteInsightsFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentName != null || fragmentNameIsSet
          ? fragmentName
          : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GRouteInsightsFieldsReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GRouteInsightsFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GElevationProfileFieldsReq
    implements _i1.FragmentRequest<_i2.GElevationProfileFieldsData, Null> {
  GElevationProfileFieldsReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'ElevationProfileFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.ElevationProfileFields]);

  _i2.GElevationProfileFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GElevationProfileFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GElevationProfileFieldsData data) =>
      data.toJson();

  GElevationProfileFieldsReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GElevationProfileFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentName != null || fragmentNameIsSet
          ? fragmentName
          : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GElevationProfileFieldsReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GElevationProfileFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GProposalWaysFieldsReq
    implements _i1.FragmentRequest<_i2.GProposalWaysFieldsData, Null> {
  GProposalWaysFieldsReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'ProposalWaysFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.ProposalWaysFields,
    _i7.LatLng,
  ]);

  _i2.GProposalWaysFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GProposalWaysFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GProposalWaysFieldsData data) =>
      data.toJson();

  GProposalWaysFieldsReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GProposalWaysFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentName != null || fragmentNameIsSet
          ? fragmentName
          : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GProposalWaysFieldsReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            document == other.document &&
            fragmentName == other.fragmentName &&
            _gqlUtils.deepEquals(idFields, other.idFields));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(varsToJson()), document,
        fragmentName, _gqlUtils.deepHash(idFields));
  }

  @override
  String toString() {
    return 'GProposalWaysFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
