// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/src/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:api_client/src/graphql/fragments/__generated__/trip.ast.gql.dart'
    as _i4;
import 'package:api_client/src/graphql/fragments/__generated__/trip.data.gql.dart'
    as _i2;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;

class GTripFieldsReq implements _i1.FragmentRequest<_i2.GTripFieldsData, Null> {
  GTripFieldsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'TripFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.TripFields,
    _i4.Images,
  ]);

  _i2.GTripFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GTripFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GTripFieldsData data) => data.toJson();

  GTripFieldsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GTripFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GTripFieldsReq &&
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
    return 'GTripFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GImagesReq implements _i1.FragmentRequest<_i2.GImagesData, Null> {
  GImagesReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'Images',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.Images]);

  _i2.GImagesData? parseData(Map<String, dynamic> json) =>
      _i2.GImagesData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GImagesData data) => data.toJson();

  GImagesReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GImagesReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GImagesReq &&
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
    return 'GImagesReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GSegmentFieldsReq
    implements _i1.FragmentRequest<_i2.GSegmentFieldsData, Null> {
  GSegmentFieldsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'SegmentFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.SegmentFields]);

  _i2.GSegmentFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GSegmentFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GSegmentFieldsData data) => data.toJson();

  GSegmentFieldsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GSegmentFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GSegmentFieldsReq &&
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
    return 'GSegmentFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GWaypointFieldsReq
    implements _i1.FragmentRequest<_i2.GWaypointFieldsData, Null> {
  GWaypointFieldsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'WaypointFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.Images,
    _i4.WaypointFields,
  ]);

  _i2.GWaypointFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GWaypointFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GWaypointFieldsData data) =>
      data.toJson();

  GWaypointFieldsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GWaypointFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GWaypointFieldsReq &&
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
    return 'GWaypointFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
