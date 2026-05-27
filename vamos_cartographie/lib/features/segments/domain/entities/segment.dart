// Importe tes fichiers générés par Ferry en haut
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:latlong2/latlong.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
// Remplace par le bon package de ton projet (ex: google_maps_flutter ou latlong2)

part 'segment.freezed.dart';

@freezed
abstract class Segment with _$Segment {
  const factory Segment({
    int? id,
    @Default(GSegmentTypeEnum.bike) GSegmentTypeEnum type,
    @Default([]) List<LatLng> intermediatePoints,
  }) = _Segment;

  const Segment._();

  List<LatLng> allPoints(LatLng from, LatLng to) => [
    from,
    ...intermediatePoints,
    to,
  ];
}
