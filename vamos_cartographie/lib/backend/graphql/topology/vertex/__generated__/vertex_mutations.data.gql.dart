// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/topology/vertex/__generated__/vertex_fields.data.gql.dart'
    as _i1;

class GCreateVertexData {
  const GCreateVertexData({
    required this.createVertex,
    this.G__typename = 'Mutation',
  });

  factory GCreateVertexData.fromJson(Map<String, dynamic> json) {
    return GCreateVertexData(
      createVertex: _i1.GVertexFieldsData.fromJson(
          (json['createVertex'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GVertexFieldsData createVertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createVertex'] = this.createVertex.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateVertexData copyWith({
    _i1.GVertexFieldsData? createVertex,
    String? G__typename,
  }) {
    return GCreateVertexData(
      createVertex: createVertex ?? this.createVertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateVertexData &&
            createVertex == other.createVertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createVertex, G__typename);
  }

  @override
  String toString() {
    return 'GCreateVertexData(createVertex: $createVertex, G__typename: $G__typename)';
  }
}

class GMoveVertexData {
  const GMoveVertexData({
    required this.moveVertex,
    this.G__typename = 'Mutation',
  });

  factory GMoveVertexData.fromJson(Map<String, dynamic> json) {
    return GMoveVertexData(
      moveVertex: _i1.GVertexFieldsData.fromJson(
          (json['moveVertex'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GVertexFieldsData moveVertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['moveVertex'] = this.moveVertex.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GMoveVertexData copyWith({
    _i1.GVertexFieldsData? moveVertex,
    String? G__typename,
  }) {
    return GMoveVertexData(
      moveVertex: moveVertex ?? this.moveVertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GMoveVertexData &&
            moveVertex == other.moveVertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, moveVertex, G__typename);
  }

  @override
  String toString() {
    return 'GMoveVertexData(moveVertex: $moveVertex, G__typename: $G__typename)';
  }
}

class GDeleteVertexData {
  const GDeleteVertexData({
    required this.deleteVertex,
    this.G__typename = 'Mutation',
  });

  factory GDeleteVertexData.fromJson(Map<String, dynamic> json) {
    return GDeleteVertexData(
      deleteVertex: (json['deleteVertex'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool deleteVertex;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteVertex'] = this.deleteVertex;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteVertexData copyWith({
    bool? deleteVertex,
    String? G__typename,
  }) {
    return GDeleteVertexData(
      deleteVertex: deleteVertex ?? this.deleteVertex,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteVertexData &&
            deleteVertex == other.deleteVertex &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteVertex, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteVertexData(deleteVertex: $deleteVertex, G__typename: $G__typename)';
  }
}
