// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/day/data/graphql/__generated__/run_note.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/day/data/graphql/__generated__/run_note.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/day/data/graphql/__generated__/run_note.var.gql.dart'
    as _i3;

class GRunNotesReq
    implements _i1.OperationRequest<_i2.GRunNotesData, _i3.GRunNotesVars> {
  GRunNotesReq({
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

  final _i3.GRunNotesVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GRunNotesData? Function(
    _i2.GRunNotesData?,
    _i2.GRunNotesData?,
  )? updateResult;

  final _i2.GRunNotesData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.RunNoteDetails,
    _i6.RunNotes,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'RunNotes',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GRunNotesData? parseData(Map<String, dynamic> json) =>
      _i2.GRunNotesData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GRunNotesData data) => data.toJson();

  _i1.OperationRequest<_i2.GRunNotesData, _i3.GRunNotesVars> transformOperation(
      _i4.Operation Function(_i4.Operation) transform) {
    return GRunNotesReq(
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

  GRunNotesReq copyWith({
    _i3.GRunNotesVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GRunNotesData? Function(
      _i2.GRunNotesData?,
      _i2.GRunNotesData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GRunNotesData? optimisticResponse,
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
    return GRunNotesReq(
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
        (other is GRunNotesReq &&
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
    return 'GRunNotesReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GSetRunNoteReq
    implements _i1.OperationRequest<_i2.GSetRunNoteData, _i3.GSetRunNoteVars> {
  GSetRunNoteReq({
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

  final _i3.GSetRunNoteVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GSetRunNoteData? Function(
    _i2.GSetRunNoteData?,
    _i2.GSetRunNoteData?,
  )? updateResult;

  final _i2.GSetRunNoteData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(definitions: [
    _i6.RunNoteDetails,
    _i6.SetRunNote,
  ]);

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'SetRunNote',
  );

  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: varsToJson(),
        context: context ?? const _i4.Context(),
      );

  _i2.GSetRunNoteData? parseData(Map<String, dynamic> json) =>
      _i2.GSetRunNoteData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GSetRunNoteData data) => data.toJson();

  _i1.OperationRequest<_i2.GSetRunNoteData, _i3.GSetRunNoteVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GSetRunNoteReq(
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

  GSetRunNoteReq copyWith({
    _i3.GSetRunNoteVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GSetRunNoteData? Function(
      _i2.GSetRunNoteData?,
      _i2.GSetRunNoteData?,
    )? updateResult,
    bool updateResultIsSet = false,
    _i2.GSetRunNoteData? optimisticResponse,
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
    return GSetRunNoteReq(
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
        (other is GSetRunNoteReq &&
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
    return 'GSetRunNoteReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GRunNoteDetailsReq
    implements _i1.FragmentRequest<_i2.GRunNoteDetailsData, Null> {
  GRunNoteDetailsReq({
    _i5.DocumentNode? document,
    this.fragmentName = 'RunNoteDetails',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i5.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i5.DocumentNode _document =
      _i5.DocumentNode(definitions: [_i6.RunNoteDetails]);

  _i2.GRunNoteDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GRunNoteDetailsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GRunNoteDetailsData data) =>
      data.toJson();

  GRunNoteDetailsReq copyWith({
    _i5.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GRunNoteDetailsReq(
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
        (other is GRunNoteDetailsReq &&
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
    return 'GRunNoteDetailsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
