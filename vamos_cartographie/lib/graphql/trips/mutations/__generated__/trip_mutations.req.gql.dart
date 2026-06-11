// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:vamos_cartographie/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/graphql/trips/fragments/__generated__/trip_fields.ast.gql.dart'
    as _i8;
import 'package:vamos_cartographie/graphql/trips/mutations/__generated__/trip_mutations.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/graphql/trips/mutations/__generated__/trip_mutations.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/graphql/trips/mutations/__generated__/trip_mutations.var.gql.dart'
    as _i3;

class GCreateTripReq
    implements _i1.OperationRequest<_i2.GCreateTripData, _i3.GCreateTripVars> {
  GCreateTripReq({
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

  final _i3.GCreateTripVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GCreateTripData? Function(
    _i2.GCreateTripData?,
    _i2.GCreateTripData?,
  )?
  updateResult;

  final _i2.GCreateTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(
    definitions: [_i6.CreateTrip, _i7.ImageFields, _i8.TripFields],
  );

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'CreateTrip',
  );

  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: varsToJson(),
    context: context ?? const _i4.Context(),
  );

  _i2.GCreateTripData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GCreateTripData data) => data.toJson();

  _i1.OperationRequest<_i2.GCreateTripData, _i3.GCreateTripVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GCreateTripReq(
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

  GCreateTripReq copyWith({
    _i3.GCreateTripVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GCreateTripData? Function(_i2.GCreateTripData?, _i2.GCreateTripData?)?
    updateResult,
    bool updateResultIsSet = false,
    _i2.GCreateTripData? optimisticResponse,
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
    return GCreateTripReq(
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
        (other is GCreateTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
              updateCacheHandlerContext,
              other.updateCacheHandlerContext,
            ) &&
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
      context,
    );
  }

  @override
  String toString() {
    return 'GCreateTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GUpdateTripReq
    implements _i1.OperationRequest<_i2.GUpdateTripData, _i3.GUpdateTripVars> {
  GUpdateTripReq({
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

  final _i3.GUpdateTripVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GUpdateTripData? Function(
    _i2.GUpdateTripData?,
    _i2.GUpdateTripData?,
  )?
  updateResult;

  final _i2.GUpdateTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(
    definitions: [_i6.UpdateTrip, _i7.ImageFields, _i8.TripFields],
  );

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'UpdateTrip',
  );

  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: varsToJson(),
    context: context ?? const _i4.Context(),
  );

  _i2.GUpdateTripData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GUpdateTripData data) => data.toJson();

  _i1.OperationRequest<_i2.GUpdateTripData, _i3.GUpdateTripVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GUpdateTripReq(
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

  GUpdateTripReq copyWith({
    _i3.GUpdateTripVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GUpdateTripData? Function(_i2.GUpdateTripData?, _i2.GUpdateTripData?)?
    updateResult,
    bool updateResultIsSet = false,
    _i2.GUpdateTripData? optimisticResponse,
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
    return GUpdateTripReq(
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
        (other is GUpdateTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
              updateCacheHandlerContext,
              other.updateCacheHandlerContext,
            ) &&
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
      context,
    );
  }

  @override
  String toString() {
    return 'GUpdateTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GDeleteTripReq
    implements _i1.OperationRequest<_i2.GDeleteTripData, _i3.GDeleteTripVars> {
  GDeleteTripReq({
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

  final _i3.GDeleteTripVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GDeleteTripData? Function(
    _i2.GDeleteTripData?,
    _i2.GDeleteTripData?,
  )?
  updateResult;

  final _i2.GDeleteTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(
    definitions: [_i6.DeleteTrip],
  );

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'DeleteTrip',
  );

  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: varsToJson(),
    context: context ?? const _i4.Context(),
  );

  _i2.GDeleteTripData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GDeleteTripData data) => data.toJson();

  _i1.OperationRequest<_i2.GDeleteTripData, _i3.GDeleteTripVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GDeleteTripReq(
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

  GDeleteTripReq copyWith({
    _i3.GDeleteTripVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GDeleteTripData? Function(_i2.GDeleteTripData?, _i2.GDeleteTripData?)?
    updateResult,
    bool updateResultIsSet = false,
    _i2.GDeleteTripData? optimisticResponse,
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
    return GDeleteTripReq(
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
        (other is GDeleteTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
              updateCacheHandlerContext,
              other.updateCacheHandlerContext,
            ) &&
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
      context,
    );
  }

  @override
  String toString() {
    return 'GDeleteTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GDeleteImageFromTripReq
    implements
        _i1.OperationRequest<
          _i2.GDeleteImageFromTripData,
          _i3.GDeleteImageFromTripVars
        > {
  GDeleteImageFromTripReq({
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

  final _i3.GDeleteImageFromTripVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GDeleteImageFromTripData? Function(
    _i2.GDeleteImageFromTripData?,
    _i2.GDeleteImageFromTripData?,
  )?
  updateResult;

  final _i2.GDeleteImageFromTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(
    definitions: [_i6.DeleteImageFromTrip],
  );

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'DeleteImageFromTrip',
  );

  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: varsToJson(),
    context: context ?? const _i4.Context(),
  );

  _i2.GDeleteImageFromTripData? parseData(Map<String, dynamic> json) =>
      _i2.GDeleteImageFromTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GDeleteImageFromTripData data) =>
      data.toJson();

  _i1.OperationRequest<
    _i2.GDeleteImageFromTripData,
    _i3.GDeleteImageFromTripVars
  >
  transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GDeleteImageFromTripReq(
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

  GDeleteImageFromTripReq copyWith({
    _i3.GDeleteImageFromTripVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GDeleteImageFromTripData? Function(
      _i2.GDeleteImageFromTripData?,
      _i2.GDeleteImageFromTripData?,
    )?
    updateResult,
    bool updateResultIsSet = false,
    _i2.GDeleteImageFromTripData? optimisticResponse,
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
    return GDeleteImageFromTripReq(
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
        (other is GDeleteImageFromTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
              updateCacheHandlerContext,
              other.updateCacheHandlerContext,
            ) &&
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
      context,
    );
  }

  @override
  String toString() {
    return 'GDeleteImageFromTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}

class GAttachImageToTripReq
    implements
        _i1.OperationRequest<
          _i2.GAttachImageToTripData,
          _i3.GAttachImageToTripVars
        > {
  GAttachImageToTripReq({
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

  final _i3.GAttachImageToTripVars vars;

  final _i4.Operation operation;

  final String? requestId;

  final _i2.GAttachImageToTripData? Function(
    _i2.GAttachImageToTripData?,
    _i2.GAttachImageToTripData?,
  )?
  updateResult;

  final _i2.GAttachImageToTripData? optimisticResponse;

  final String? updateCacheHandlerKey;

  final Map<String, dynamic>? updateCacheHandlerContext;

  final _i1.FetchPolicy? fetchPolicy;

  final bool executeOnListen;

  final _i4.Context? context;

  static const _i5.DocumentNode _document = _i5.DocumentNode(
    definitions: [_i6.AttachImageToTrip, _i7.ImageFields],
  );

  static const _i4.Operation _operation = _i4.Operation(
    document: _document,
    operationName: 'AttachImageToTrip',
  );

  _i4.Request get execRequest => _i4.Request(
    operation: operation,
    variables: varsToJson(),
    context: context ?? const _i4.Context(),
  );

  _i2.GAttachImageToTripData? parseData(Map<String, dynamic> json) =>
      _i2.GAttachImageToTripData.fromJson(json);

  Map<String, dynamic> varsToJson() => vars.toJson();

  Map<String, dynamic> dataToJson(_i2.GAttachImageToTripData data) =>
      data.toJson();

  _i1.OperationRequest<_i2.GAttachImageToTripData, _i3.GAttachImageToTripVars>
  transformOperation(_i4.Operation Function(_i4.Operation) transform) {
    return GAttachImageToTripReq(
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

  GAttachImageToTripReq copyWith({
    _i3.GAttachImageToTripVars? vars,
    _i4.Operation? operation,
    String? requestId,
    bool requestIdIsSet = false,
    _i2.GAttachImageToTripData? Function(
      _i2.GAttachImageToTripData?,
      _i2.GAttachImageToTripData?,
    )?
    updateResult,
    bool updateResultIsSet = false,
    _i2.GAttachImageToTripData? optimisticResponse,
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
    return GAttachImageToTripReq(
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
        (other is GAttachImageToTripReq &&
            _gqlUtils.deepEquals(varsToJson(), other.varsToJson()) &&
            operation == other.operation &&
            requestId == other.requestId &&
            updateResult == other.updateResult &&
            optimisticResponse == other.optimisticResponse &&
            updateCacheHandlerKey == other.updateCacheHandlerKey &&
            _gqlUtils.deepEquals(
              updateCacheHandlerContext,
              other.updateCacheHandlerContext,
            ) &&
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
      context,
    );
  }

  @override
  String toString() {
    return 'GAttachImageToTripReq(vars: $vars, operation: $operation, requestId: $requestId, updateResult: $updateResult, optimisticResponse: $optimisticResponse, updateCacheHandlerKey: $updateCacheHandlerKey, updateCacheHandlerContext: $updateCacheHandlerContext, fetchPolicy: $fetchPolicy, executeOnListen: $executeOnListen, context: $context)';
  }
}
