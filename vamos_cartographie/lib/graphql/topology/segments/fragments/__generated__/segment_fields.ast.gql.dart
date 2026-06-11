// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;
import 'package:vamos_cartographie/graphql/shared/__generated__/geo_fields.ast.gql.dart'
    as _i3;
import 'package:vamos_cartographie/graphql/topology/vertex/__generated__/vertex_fields.ast.gql.dart'
    as _i2;

const SegmentFields = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'SegmentFields'),
  typeCondition: _i1.TypeConditionNode(
    on: _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'SegmentType'),
      isNonNull: false,
    ),
  ),
  directives: [],
  selectionSet: _i1.SelectionSetNode(
    selections: [
      _i1.FieldNode(
        name: _i1.NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      _i1.FieldNode(
        name: _i1.NameNode(value: 'type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      _i1.FieldNode(
        name: _i1.NameNode(value: 'startVertex'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: _i1.SelectionSetNode(
          selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'VertexFields'),
              directives: [],
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      _i1.FieldNode(
        name: _i1.NameNode(value: 'endVertex'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: _i1.SelectionSetNode(
          selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'VertexFields'),
              directives: [],
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      _i1.FieldNode(
        name: _i1.NameNode(value: 'geometry'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: _i1.SelectionSetNode(
          selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'LatLngFields'),
              directives: [],
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      _i1.FieldNode(
        name: _i1.NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const document = _i1.DocumentNode(
  definitions: [SegmentFields, _i2.VertexFields, _i3.LatLngFields],
);
