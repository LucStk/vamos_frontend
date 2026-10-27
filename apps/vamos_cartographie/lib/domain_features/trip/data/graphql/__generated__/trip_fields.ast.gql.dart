// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql/ast.dart' as _i1;
import 'package:vamos_cartographie/core/graphql/__generated__/geo_fields.ast.gql.dart'
    as _i3;
import 'package:vamos_cartographie/domain_features/route/data/graphql/__generated__/route_fields.ast.gql.dart'
    as _i2;
import 'package:vamos_cartographie/domain_features/stored_file/data/graphql/__generated__/file_storage_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_fields.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/__generated__/waypoint_fields.ast.gql.dart'
    as _i4;

const TripSummary = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'TripSummary'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'TripType'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'title'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'date'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'description'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'files'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'FileAttachment'),
          directives: [],
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'owner'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'UserProfileDetails'),
          directives: [],
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const TripFull = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'TripFull'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'TripType'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FragmentSpreadNode(
      name: _i1.NameNode(value: 'TripSummary'),
      directives: [],
    ),
    _i1.FragmentSpreadNode(
      name: _i1.NameNode(value: 'TripRoute'),
      directives: [],
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'waypoints'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'WaypointDetails'),
          directives: [],
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const document = _i1.DocumentNode(definitions: [
  TripSummary,
  TripFull,
  _i2.RouteSection,
  _i2.TripRoute,
  _i2.EditRouteResult,
  _i3.LatLng,
  _i4.WaypointDetails,
  _i4.WaypointAnchor,
  _i5.StoredFile,
  _i5.FileAttachment,
  _i5.UploadConfigFields,
  _i6.UserProfileDetails,
  _i6.CreateProfileResult,
]);
