// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.ast.gql.dart'
    as _i4;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.data.gql.dart'
    as _i2;

class GWaypointDetailsReq
    implements _i1.FragmentRequest<_i2.GWaypointDetailsData, Null> {
  GWaypointDetailsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'WaypointDetails',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.WaypointDetails,
    _i5.LatLng,
    _i6.StoredFile,
    _i6.FileAttachment,
  ]);

  _i2.GWaypointDetailsData? parseData(Map<String, dynamic> json) =>
      _i2.GWaypointDetailsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GWaypointDetailsData data) =>
      data.toJson();

  GWaypointDetailsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GWaypointDetailsReq(
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
        (other is GWaypointDetailsReq &&
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
    return 'GWaypointDetailsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GWaypointAnchorReq
    implements _i1.FragmentRequest<_i2.GWaypointAnchorData, Null> {
  GWaypointAnchorReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'WaypointAnchor',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document =
      _i3.DocumentNode(definitions: [_i4.WaypointAnchor]);

  _i2.GWaypointAnchorData? parseData(Map<String, dynamic> json) =>
      _i2.GWaypointAnchorData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GWaypointAnchorData data) =>
      data.toJson();

  GWaypointAnchorReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GWaypointAnchorReq(
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
        (other is GWaypointAnchorReq &&
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
    return 'GWaypointAnchorReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
