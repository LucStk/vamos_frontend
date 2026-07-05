// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/topology/fields/__generated__/segment_fields.data.gql.dart'
    as _i1;

class GUpdateSegmentData {
  const GUpdateSegmentData({
    required this.updateSegment,
    this.G__typename = 'Mutation',
  });

  factory GUpdateSegmentData.fromJson(Map<String, dynamic> json) {
    return GUpdateSegmentData(
      updateSegment: _i1.GSegmentFieldsData.fromJson(
          (json['updateSegment'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GSegmentFieldsData updateSegment;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateSegment'] = this.updateSegment.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateSegmentData copyWith({
    _i1.GSegmentFieldsData? updateSegment,
    String? G__typename,
  }) {
    return GUpdateSegmentData(
      updateSegment: updateSegment ?? this.updateSegment,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateSegmentData &&
            updateSegment == other.updateSegment &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateSegment, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateSegmentData(updateSegment: $updateSegment, G__typename: $G__typename)';
  }
}

class GCreateSegmentData {
  const GCreateSegmentData({
    required this.createSegment,
    this.G__typename = 'Mutation',
  });

  factory GCreateSegmentData.fromJson(Map<String, dynamic> json) {
    return GCreateSegmentData(
      createSegment: _i1.GSegmentFieldsData.fromJson(
          (json['createSegment'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GSegmentFieldsData createSegment;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createSegment'] = this.createSegment.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateSegmentData copyWith({
    _i1.GSegmentFieldsData? createSegment,
    String? G__typename,
  }) {
    return GCreateSegmentData(
      createSegment: createSegment ?? this.createSegment,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateSegmentData &&
            createSegment == other.createSegment &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createSegment, G__typename);
  }

  @override
  String toString() {
    return 'GCreateSegmentData(createSegment: $createSegment, G__typename: $G__typename)';
  }
}

class GDeleteSegmentData {
  const GDeleteSegmentData({
    required this.deleteSegment,
    this.G__typename = 'Mutation',
  });

  factory GDeleteSegmentData.fromJson(Map<String, dynamic> json) {
    return GDeleteSegmentData(
      deleteSegment: (json['deleteSegment'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool deleteSegment;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteSegment'] = this.deleteSegment;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteSegmentData copyWith({
    bool? deleteSegment,
    String? G__typename,
  }) {
    return GDeleteSegmentData(
      deleteSegment: deleteSegment ?? this.deleteSegment,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteSegmentData &&
            deleteSegment == other.deleteSegment &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteSegment, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteSegmentData(deleteSegment: $deleteSegment, G__typename: $G__typename)';
  }
}
