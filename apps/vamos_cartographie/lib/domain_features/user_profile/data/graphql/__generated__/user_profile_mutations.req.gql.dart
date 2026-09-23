// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i8;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_mutations.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_mutations.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_mutations.var.gql.dart'
    as _i3;

class GCreateProfileReq
    implements
        _i1.OperationRequest<_i2.GCreateProfileData, _i3.GCreateProfileVars> {
  GCreateProfileReq({
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

  final _i3.GCreateProfileVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GCreateProfileData? Function(
    _i2.GCreateProfileData?,
    _i2.GCreateProfileData?,
  )? updateResult;

  final _i2.GCreateProfileData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.CreateProfile,
    _i7.UserProfileFields,
    _i8.StoredFile,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'CreateProfile',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GCreateProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateProfileData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GCreateProfileData data) => data.toJson();

  _i1.OperationRequest<_i2.GCreateProfileData, _i3.GCreateProfileVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GCreateProfileReq(
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

  GCreateProfileReq copyWith({
    _i3.GCreateProfileVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GCreateProfileData? Function(
      _i2.GCreateProfileData?,
      _i2.GCreateProfileData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GCreateProfileData? optimisticResponse,
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
    return GCreateProfileReq(
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
        (other is GCreateProfileReq &&
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
    return 'GCreateProfileReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GUpdateProfileReq
    implements
        _i1.OperationRequest<_i2.GUpdateProfileData, _i3.GUpdateProfileVars> {
  GUpdateProfileReq({
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

  final _i3.GUpdateProfileVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GUpdateProfileData? Function(
    _i2.GUpdateProfileData?,
    _i2.GUpdateProfileData?,
  )? updateResult;

  final _i2.GUpdateProfileData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.UpdateProfile,
    _i7.UserProfileFields,
    _i8.StoredFile,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'UpdateProfile',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GUpdateProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateProfileData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GUpdateProfileData data) => data.toJson();

  _i1.OperationRequest<_i2.GUpdateProfileData, _i3.GUpdateProfileVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GUpdateProfileReq(
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

  GUpdateProfileReq copyWith({
    _i3.GUpdateProfileVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GUpdateProfileData? Function(
      _i2.GUpdateProfileData?,
      _i2.GUpdateProfileData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GUpdateProfileData? optimisticResponse,
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
    return GUpdateProfileReq(
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
        (other is GUpdateProfileReq &&
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
    return 'GUpdateProfileReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
