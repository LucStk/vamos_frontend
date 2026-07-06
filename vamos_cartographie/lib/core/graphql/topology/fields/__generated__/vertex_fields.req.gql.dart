// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i3;
import 'package:vamos_cartographie/core/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;
import 'package:vamos_cartographie/core/graphql/shared/__generated__/geo_fields.ast.gql.dart'
    as _i5;
import 'package:vamos_cartographie/core/graphql/topology/fields/__generated__/vertex_fields.ast.gql.dart'
    as _i4;
import 'package:vamos_cartographie/core/graphql/topology/fields/__generated__/vertex_fields.data.gql.dart'
    as _i2;

class GVertexFieldsReq
    implements _i1.FragmentRequest<_i2.GVertexFieldsData, Null> {
  GVertexFieldsReq({
    _i3.DocumentNode? document,
    this.fragmentName = 'VertexFields',
    this.idFields = const <String, dynamic>{},
  }) : document = document ?? _document;

  final Null vars = null;

  final _i3.DocumentNode document;

  final String? fragmentName;

  final Map<String, dynamic> idFields;

  static const _i3.DocumentNode _document = _i3.DocumentNode(definitions: [
    _i4.VertexFields,
    _i5.LatLngFields,
  ]);

  _i2.GVertexFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GVertexFieldsData.fromJson(json);

  Map<String, dynamic> varsToJson() => const <String, dynamic>{};

  Map<String, dynamic> dataToJson(_i2.GVertexFieldsData data) => data.toJson();

  GVertexFieldsReq copyWith({
    _i3.DocumentNode? document,
    String? fragmentName,
    bool fragmentNameIsSet = false,
    Map<String, dynamic>? idFields,
  }) {
    return GVertexFieldsReq(
      document: document ?? this.document,
      fragmentName: fragmentNameIsSet ? fragmentName : this.fragmentName,
      idFields: idFields ?? this.idFields,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GVertexFieldsReq &&
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
    return 'GVertexFieldsReq(vars: $vars, document: $document, fragmentName: $fragmentName, idFields: $idFields)';
  }
}
