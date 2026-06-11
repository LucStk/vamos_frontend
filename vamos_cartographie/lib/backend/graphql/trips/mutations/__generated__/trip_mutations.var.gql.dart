// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:vamos_cartographie/backend/graphql/__generated__/schema.utils.gql.dart'
    as _gqlUtils;

class GCreateTripVars {
  const GCreateTripVars({required this.trip});

  factory GCreateTripVars.fromJson(Map<String, dynamic> json) {
    return GCreateTripVars(
        trip: _i1.GTripInput.fromJson((json['trip'] as Map<String, dynamic>)));
  }

  final _i1.GTripInput trip;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripValue = this.trip;
    _$result['trip'] = _$tripValue.toJson();
    return _$result;
  }

  GCreateTripVars copyWith({_i1.GTripInput? trip}) {
    return GCreateTripVars(trip: trip ?? this.trip);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GCreateTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GCreateTripVars(trip: $trip)';
  }
}

class GUpdateTripVars {
  const GUpdateTripVars({
    required this.trip,
    required this.id,
  });

  factory GUpdateTripVars.fromJson(Map<String, dynamic> json) {
    return GUpdateTripVars(
      trip:
          _i1.GTripUpdateInput.fromJson((json['trip'] as Map<String, dynamic>)),
      id: (json['id'] as int),
    );
  }

  final _i1.GTripUpdateInput trip;

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripValue = this.trip;
    _$result['trip'] = _$tripValue.toJson();
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GUpdateTripVars copyWith({
    _i1.GTripUpdateInput? trip,
    int? id,
  }) {
    return GUpdateTripVars(
      trip: trip ?? this.trip,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GUpdateTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GUpdateTripVars(trip: $trip, id: $id)';
  }
}

class GDeleteTripVars {
  const GDeleteTripVars({required this.id});

  factory GDeleteTripVars.fromJson(Map<String, dynamic> json) {
    return GDeleteTripVars(id: (json['id'] as int));
  }

  final int id;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$idValue = this.id;
    _$result['id'] = _$idValue;
    return _$result;
  }

  GDeleteTripVars copyWith({int? id}) {
    return GDeleteTripVars(id: id ?? this.id);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteTripVars(id: $id)';
  }
}

class GDeleteImageFromTripVars {
  const GDeleteImageFromTripVars({
    required this.tripId,
    required this.fileKey,
  });

  factory GDeleteImageFromTripVars.fromJson(Map<String, dynamic> json) {
    return GDeleteImageFromTripVars(
      tripId: (json['tripId'] as int),
      fileKey: (json['fileKey'] as String),
    );
  }

  final int tripId;

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GDeleteImageFromTripVars copyWith({
    int? tripId,
    String? fileKey,
  }) {
    return GDeleteImageFromTripVars(
      tripId: tripId ?? this.tripId,
      fileKey: fileKey ?? this.fileKey,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GDeleteImageFromTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GDeleteImageFromTripVars(tripId: $tripId, fileKey: $fileKey)';
  }
}

class GAttachImageToTripVars {
  const GAttachImageToTripVars({
    required this.tripId,
    required this.fileKey,
  });

  factory GAttachImageToTripVars.fromJson(Map<String, dynamic> json) {
    return GAttachImageToTripVars(
      tripId: (json['tripId'] as int),
      fileKey: (json['fileKey'] as String),
    );
  }

  final int tripId;

  final String fileKey;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    final _$tripIdValue = this.tripId;
    _$result['tripId'] = _$tripIdValue;
    final _$fileKeyValue = this.fileKey;
    _$result['fileKey'] = _$fileKeyValue;
    return _$result;
  }

  GAttachImageToTripVars copyWith({
    int? tripId,
    String? fileKey,
  }) {
    return GAttachImageToTripVars(
      tripId: tripId ?? this.tripId,
      fileKey: fileKey ?? this.fileKey,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GAttachImageToTripVars &&
            _gqlUtils.deepEquals(toJson(), other.toJson()));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, _gqlUtils.deepHash(toJson()));
  }

  @override
  String toString() {
    return 'GAttachImageToTripVars(tripId: $tripId, fileKey: $fileKey)';
  }
}
