// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;
import 'package:vamos_cartographie/media/data/graphql/__generated__/image_fields.ast.gql.dart'
    as _i3;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/geo_fields.ast.gql.dart'
    as _i6;
import 'package:vamos_cartographie/topology/data/graphql/fields/__generated__/vertex_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/trip/data/graphql/__generated__/trip_fields.ast.gql.dart'
    as _i2;
import 'package:vamos_cartographie/waypoint/data/graphql/__generated__/waypoint_fields.ast.gql.dart'
    as _i4;

const GetWaypoints = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'GetWaypoints'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'tripId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UUID'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    )
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'trip'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'id'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'tripId')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'TripFields'),
          directives: [],
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'waypoints'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'WaypointFields'),
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
  GetWaypoints,
  _i2.TripFields,
  _i3.ImageFields,
  _i4.WaypointFields,
  _i4.CreateWaypointPayloadFields,
  _i5.VertexFields,
  _i6.LatLngFields,
]);
