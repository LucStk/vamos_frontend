// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i4;
import 'package:gql_exec/gql_exec.dart' as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_queries.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_queries.data.gql.dart'
    as _i2;

class GGetMeReq implements _i1.OperationRequest<_i2.GGetMeData, Null> {
  GGetMeReq({
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

  final _i2.GGetMeData? Function(
    _i2.GGetMeData?,
    _i2.GGetMeData?,
  )? updateResult;

  final _i2.GGetMeData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i3.Context? context;

  static const _i4.DocumentNode _document = _i4.DocumentNode(definitions: [
    _i5.GetMe,
    _i6.UserProfileFields,
    _i7.StoredFile,
  ]);

  static const _i3.Operation _operation = _i3.Operation(
    document: _document,
    operationName: 'GetMe',
  );

  _i3.Request get execRequest => _i3.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i3.Context(),
      );

  _i2.GGetMeData? parseData(Map<String, dynamic> json) =>
      _i2.GGetMeData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GGetMeData data) => data.toJson();

  _i1.OperationRequest<_i2.GGetMeData, Null> transformOperation(
      _i3.Operation Function(_i3.Operation) transform) {
    return GGetMeReq(
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

  GGetMeReq copyWith({
    _i3.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GGetMeData? Function(
      _i2.GGetMeData?,
      _i2.GGetMeData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GGetMeData? optimisticResponse,
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
    return GGetMeReq(
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
        (other is GGetMeReq &&
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
    return 'GGetMeReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
