// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/graphql/waypoints/fragments/__generated__/waypoint_fields.data.gql.dart'
    as _i1;

class GUpdateWaypointData {
  const GUpdateWaypointData({
    required this.updateWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GUpdateWaypointData.fromJson(Map<String, dynamic> json) {
    return GUpdateWaypointData(
      updateWaypoint: _i1.GWaypointFieldsData.fromJson(
          (json['updateWaypoint'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GWaypointFieldsData updateWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateWaypoint'] = this.updateWaypoint.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateWaypointData copyWith({
    _i1.GWaypointFieldsData? updateWaypoint,
    String? G__typename,
  }) {
    return GUpdateWaypointData(
      updateWaypoint: updateWaypoint ?? this.updateWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateWaypointData &&
            updateWaypoint == other.updateWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateWaypointData(updateWaypoint: $updateWaypoint, G__typename: $G__typename)';
  }
}

class GDeleteImageFromWaypointData {
  const GDeleteImageFromWaypointData({
    required this.deleteImageFromWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GDeleteImageFromWaypointData.fromJson(Map<String, dynamic> json) {
    return GDeleteImageFromWaypointData(
      deleteImageFromWaypoint: (json['deleteImageFromWaypoint'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String deleteImageFromWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteImageFromWaypoint'] = this.deleteImageFromWaypoint;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteImageFromWaypointData copyWith({
    String? deleteImageFromWaypoint,
    String? G__typename,
  }) {
    return GDeleteImageFromWaypointData(
      deleteImageFromWaypoint:
          deleteImageFromWaypoint ?? this.deleteImageFromWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteImageFromWaypointData &&
            deleteImageFromWaypoint == other.deleteImageFromWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteImageFromWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteImageFromWaypointData(deleteImageFromWaypoint: $deleteImageFromWaypoint, G__typename: $G__typename)';
  }
}

class GAttachImageToWaypointData {
  const GAttachImageToWaypointData({
    required this.attachImageToWaypoint,
    this.G__typename = 'Mutation',
  });

  factory GAttachImageToWaypointData.fromJson(Map<String, dynamic> json) {
    return GAttachImageToWaypointData(
      attachImageToWaypoint:
          GAttachImageToWaypointData_attachImageToWaypoint.fromJson(
              (json['attachImageToWaypoint'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GAttachImageToWaypointData_attachImageToWaypoint attachImageToWaypoint;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['attachImageToWaypoint'] = this.attachImageToWaypoint.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GAttachImageToWaypointData copyWith({
    GAttachImageToWaypointData_attachImageToWaypoint? attachImageToWaypoint,
    String? G__typename,
  }) {
    return GAttachImageToWaypointData(
      attachImageToWaypoint:
          attachImageToWaypoint ?? this.attachImageToWaypoint,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToWaypointData &&
            attachImageToWaypoint == other.attachImageToWaypoint &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, attachImageToWaypoint, G__typename);
  }

  @override
  String toString() {
    return 'GAttachImageToWaypointData(attachImageToWaypoint: $attachImageToWaypoint, G__typename: $G__typename)';
  }
}

class GAttachImageToWaypointData_attachImageToWaypoint {
  const GAttachImageToWaypointData_attachImageToWaypoint({
    required this.image,
    this.G__typename = 'WaypointImageType',
  });

  factory GAttachImageToWaypointData_attachImageToWaypoint.fromJson(
      Map<String, dynamic> json) {
    return GAttachImageToWaypointData_attachImageToWaypoint(
      image: _i2.GImageFieldsData.fromJson(
          (json['image'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i2.GImageFieldsData image;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['image'] = this.image.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GAttachImageToWaypointData_attachImageToWaypoint copyWith({
    _i2.GImageFieldsData? image,
    String? G__typename,
  }) {
    return GAttachImageToWaypointData_attachImageToWaypoint(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToWaypointData_attachImageToWaypoint &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GAttachImageToWaypointData_attachImageToWaypoint(image: $image, G__typename: $G__typename)';
  }
}
