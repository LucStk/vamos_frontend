// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/media/fragments/__generated__/image_fields.data.gql.dart'
    as _i2;
import 'package:vamos_cartographie/backend/graphql/trips/fragments/__generated__/trip_fields.data.gql.dart'
    as _i1;

class GCreateTripData {
  const GCreateTripData({
    required this.createTrip,
    this.G__typename = 'Mutation',
  });

  factory GCreateTripData.fromJson(Map<String, dynamic> json) {
    return GCreateTripData(
      createTrip: _i1.GTripFieldsData.fromJson(
          (json['createTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripFieldsData createTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['createTrip'] = this.createTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GCreateTripData copyWith({
    _i1.GTripFieldsData? createTrip,
    String? G__typename,
  }) {
    return GCreateTripData(
      createTrip: createTrip ?? this.createTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateTripData &&
            createTrip == other.createTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, createTrip, G__typename);
  }

  @override
  String toString() {
    return 'GCreateTripData(createTrip: $createTrip, G__typename: $G__typename)';
  }
}

class GUpdateTripData {
  const GUpdateTripData({
    required this.updateTrip,
    this.G__typename = 'Mutation',
  });

  factory GUpdateTripData.fromJson(Map<String, dynamic> json) {
    return GUpdateTripData(
      updateTrip: _i1.GTripFieldsData.fromJson(
          (json['updateTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final _i1.GTripFieldsData updateTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['updateTrip'] = this.updateTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GUpdateTripData copyWith({
    _i1.GTripFieldsData? updateTrip,
    String? G__typename,
  }) {
    return GUpdateTripData(
      updateTrip: updateTrip ?? this.updateTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripData &&
            updateTrip == other.updateTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, updateTrip, G__typename);
  }

  @override
  String toString() {
    return 'GUpdateTripData(updateTrip: $updateTrip, G__typename: $G__typename)';
  }
}

class GDeleteTripData {
  const GDeleteTripData({
    required this.deleteTrip,
    this.G__typename = 'Mutation',
  });

  factory GDeleteTripData.fromJson(Map<String, dynamic> json) {
    return GDeleteTripData(
      deleteTrip: (json['deleteTrip'] as bool),
      G__typename: (json['__typename'] as String),
    );
  }

  final bool deleteTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteTrip'] = this.deleteTrip;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteTripData copyWith({
    bool? deleteTrip,
    String? G__typename,
  }) {
    return GDeleteTripData(
      deleteTrip: deleteTrip ?? this.deleteTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripData &&
            deleteTrip == other.deleteTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteTrip, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteTripData(deleteTrip: $deleteTrip, G__typename: $G__typename)';
  }
}

class GDeleteImageFromTripData {
  const GDeleteImageFromTripData({
    required this.deleteImageFromTrip,
    this.G__typename = 'Mutation',
  });

  factory GDeleteImageFromTripData.fromJson(Map<String, dynamic> json) {
    return GDeleteImageFromTripData(
      deleteImageFromTrip: (json['deleteImageFromTrip'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String deleteImageFromTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['deleteImageFromTrip'] = this.deleteImageFromTrip;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GDeleteImageFromTripData copyWith({
    String? deleteImageFromTrip,
    String? G__typename,
  }) {
    return GDeleteImageFromTripData(
      deleteImageFromTrip: deleteImageFromTrip ?? this.deleteImageFromTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteImageFromTripData &&
            deleteImageFromTrip == other.deleteImageFromTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, deleteImageFromTrip, G__typename);
  }

  @override
  String toString() {
    return 'GDeleteImageFromTripData(deleteImageFromTrip: $deleteImageFromTrip, G__typename: $G__typename)';
  }
}

class GAttachImageToTripData {
  const GAttachImageToTripData({
    required this.attachImageToTrip,
    this.G__typename = 'Mutation',
  });

  factory GAttachImageToTripData.fromJson(Map<String, dynamic> json) {
    return GAttachImageToTripData(
      attachImageToTrip: GAttachImageToTripData_attachImageToTrip.fromJson(
          (json['attachImageToTrip'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GAttachImageToTripData_attachImageToTrip attachImageToTrip;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['attachImageToTrip'] = this.attachImageToTrip.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GAttachImageToTripData copyWith({
    GAttachImageToTripData_attachImageToTrip? attachImageToTrip,
    String? G__typename,
  }) {
    return GAttachImageToTripData(
      attachImageToTrip: attachImageToTrip ?? this.attachImageToTrip,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToTripData &&
            attachImageToTrip == other.attachImageToTrip &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, attachImageToTrip, G__typename);
  }

  @override
  String toString() {
    return 'GAttachImageToTripData(attachImageToTrip: $attachImageToTrip, G__typename: $G__typename)';
  }
}

class GAttachImageToTripData_attachImageToTrip {
  const GAttachImageToTripData_attachImageToTrip({
    required this.image,
    this.G__typename = 'TripImageType',
  });

  factory GAttachImageToTripData_attachImageToTrip.fromJson(
      Map<String, dynamic> json) {
    return GAttachImageToTripData_attachImageToTrip(
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

  GAttachImageToTripData_attachImageToTrip copyWith({
    _i2.GImageFieldsData? image,
    String? G__typename,
  }) {
    return GAttachImageToTripData_attachImageToTrip(
      image: image ?? this.image,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToTripData_attachImageToTrip &&
            image == other.image &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, image, G__typename);
  }

  @override
  String toString() {
    return 'GAttachImageToTripData_attachImageToTrip(image: $image, G__typename: $G__typename)';
  }
}
