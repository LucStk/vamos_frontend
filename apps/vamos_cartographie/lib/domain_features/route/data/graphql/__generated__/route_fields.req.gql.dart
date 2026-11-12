// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.ast.gql.dart'
    as _i4;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.data.gql.dart'
    as _i2;

class GMobilitySpanReq
    implements _i1.FragmentRequest<_i2.GMobilitySpanData, Null> {
  GMobilitySpanReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'MobilitySpan',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.MobilitySpan]);

  _i2.GMobilitySpanData? parseData(Map<String, dynamic> json) =>
      _i2.GMobilitySpanData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GMobilitySpanData data) => data.toJson();

  GMobilitySpanReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GMobilitySpanReq(
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
        (other is GMobilitySpanReq &&
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
    return 'GMobilitySpanReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GBoundsReq implements _i1.FragmentRequest<_i2.GBoundsData, Null> {
  GBoundsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'Bounds',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.Bounds]);

  _i2.GBoundsData? parseData(Map<String, dynamic> json) =>
      _i2.GBoundsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GBoundsData data) => data.toJson();

  GBoundsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GBoundsReq(
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
        (other is GBoundsReq &&
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
    return 'GBoundsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GEditSpanReq implements _i1.FragmentRequest<_i2.GEditSpanData, Null> {
  GEditSpanReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'EditSpan',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.EditSpan]);

  _i2.GEditSpanData? parseData(Map<String, dynamic> json) =>
      _i2.GEditSpanData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GEditSpanData data) => data.toJson();

  GEditSpanReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GEditSpanReq(
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
        (other is GEditSpanReq &&
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
    return 'GEditSpanReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GPreviewMobilitySpanReq
    implements _i1.FragmentRequest<_i2.GPreviewMobilitySpanData, Null> {
  GPreviewMobilitySpanReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'PreviewMobilitySpan',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.PreviewMobilitySpan]);

  _i2.GPreviewMobilitySpanData? parseData(Map<String, dynamic> json) =>
      _i2.GPreviewMobilitySpanData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GPreviewMobilitySpanData data) =>
      data.toJson();

  GPreviewMobilitySpanReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GPreviewMobilitySpanReq(
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
        (other is GPreviewMobilitySpanReq &&
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
    return 'GPreviewMobilitySpanReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GPreviewEditSpanReq
    implements _i1.FragmentRequest<_i2.GPreviewEditSpanData, Null> {
  GPreviewEditSpanReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'PreviewEditSpan',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.PreviewEditSpan]);

  _i2.GPreviewEditSpanData? parseData(Map<String, dynamic> json) =>
      _i2.GPreviewEditSpanData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GPreviewEditSpanData data) =>
      data.toJson();

  GPreviewEditSpanReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GPreviewEditSpanReq(
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
        (other is GPreviewEditSpanReq &&
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
    return 'GPreviewEditSpanReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GTripRouteReq implements _i1.FragmentRequest<_i2.GTripRouteData, Null> {
  GTripRouteReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'TripRoute',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.MobilitySpan,
    _i4.Bounds,
    _i4.TripRoute,
    _i5.LatLng,
  ]);

  _i2.GTripRouteData? parseData(Map<String, dynamic> json) =>
      _i2.GTripRouteData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GTripRouteData data) => data.toJson();

  GTripRouteReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GTripRouteReq(
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
        (other is GTripRouteReq &&
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
    return 'GTripRouteReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GTripRouteEditingReq
    implements _i1.FragmentRequest<_i2.GTripRouteEditingData, Null> {
  GTripRouteEditingReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'TripRouteEditing',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.MobilitySpan,
    _i4.Bounds,
    _i4.EditSpan,
    _i4.TripRoute,
    _i4.TripRouteEditing,
    _i5.LatLng,
  ]);

  _i2.GTripRouteEditingData? parseData(Map<String, dynamic> json) =>
      _i2.GTripRouteEditingData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GTripRouteEditingData data) =>
      data.toJson();

  GTripRouteEditingReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GTripRouteEditingReq(
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
        (other is GTripRouteEditingReq &&
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
    return 'GTripRouteEditingReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GEditRouteResultReq
    implements _i1.FragmentRequest<_i2.GEditRouteResultData, Null> {
  GEditRouteResultReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'EditRouteResult',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.MobilitySpan,
    _i4.Bounds,
    _i4.EditSpan,
    _i4.TripRoute,
    _i4.TripRouteEditing,
    _i4.EditRouteResult,
    _i5.LatLng,
  ]);

  _i2.GEditRouteResultData? parseData(Map<String, dynamic> json) =>
      _i2.GEditRouteResultData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GEditRouteResultData data) =>
      data.toJson();

  GEditRouteResultReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GEditRouteResultReq(
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
        (other is GEditRouteResultReq &&
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
    return 'GEditRouteResultReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GRoutePreviewResultReq
    implements _i1.FragmentRequest<_i2.GRoutePreviewResultData, Null> {
  GRoutePreviewResultReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'RoutePreviewResult',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.PreviewMobilitySpan,
    _i4.PreviewEditSpan,
    _i4.RoutePreviewResult,
    _i5.LatLng,
  ]);

  _i2.GRoutePreviewResultData? parseData(Map<String, dynamic> json) =>
      _i2.GRoutePreviewResultData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GRoutePreviewResultData data) =>
      data.toJson();

  GRoutePreviewResultReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GRoutePreviewResultReq(
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
        (other is GRoutePreviewResultReq &&
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
    return 'GRoutePreviewResultReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
