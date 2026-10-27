// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i8;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.ast.gql.dart'
    as _i7;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/domain_features/trip/data/graphql/__generated__/trip_fields.ast.gql.dart'
    as _i4;
import 'package:vamos_cartographie/domain_features/trip/data/graphql/__generated__/trip_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.ast.gql.dart'
    as _i9;

class GTripSummaryReq
    implements _i1.FragmentRequest<_i2.GTripSummaryData, Null> {
  GTripSummaryReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'TripSummary',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.TripSummary,
    _i5.StoredFile,
    _i5.FileAttachment,
    _i6.UserProfileDetails,
  ]);

  _i2.GTripSummaryData? parseData(Map<String, dynamic> json) =>
      _i2.GTripSummaryData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GTripSummaryData data) => data.toJson();

  GTripSummaryReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GTripSummaryReq(
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
        (other is GTripSummaryReq &&
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
    return 'GTripSummaryReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}

class GTripFullReq implements _i1.FragmentRequest<_i2.GTripFullData, Null> {
  GTripFullReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'TripFull',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.TripSummary,
    _i4.TripFull,
    _i7.RouteSection,
    _i7.TripRoute,
    _i8.LatLng,
    _i9.WaypointDetails,
    _i5.StoredFile,
    _i5.FileAttachment,
    _i6.UserProfileDetails,
  ]);

  _i2.GTripFullData? parseData(Map<String, dynamic> json) =>
      _i2.GTripFullData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GTripFullData data) => data.toJson();

  GTripFullReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GTripFullReq(
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
        (other is GTripFullReq &&
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
    return 'GTripFullReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
