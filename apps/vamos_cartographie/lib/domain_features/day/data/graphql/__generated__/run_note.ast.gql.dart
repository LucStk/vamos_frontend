// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql/ast.dart' as _i1;

const RunNoteDetails = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'RunNoteDetails'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'RunNoteType'),
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
      name: _i1.NameNode(value: 'stayId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'spanId'),
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
      name: _i1.NameNode(value: 'notes'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
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
const RunNotes = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'RunNotes'),
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
      name: _i1.NameNode(value: 'runNotes'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'tripId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'tripId')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'RunNoteDetails'),
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
const SetRunNote = _i1.OperationDefinitionNode(
  type: _i1.OperationType.mutation,
  name: _i1.NameNode(value: 'SetRunNote'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'tripId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UUID'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'spanId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UUID'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'stayId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UUID'),
        isNonNull: false,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'title')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'notes')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'setRunNote'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'tripId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'tripId')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'spanId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'spanId')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'stayId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'stayId')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'title'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'title')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'notes'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'notes')),
        ),
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'RunNoteDetails'),
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
  RunNoteDetails,
  RunNotes,
  SetRunNote,
]);
