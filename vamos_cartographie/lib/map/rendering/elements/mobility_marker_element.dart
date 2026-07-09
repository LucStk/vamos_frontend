import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_domain/domain/entities/segment/segment_ui_model.dart';
import 'package:vamos_cartographie/topology/presentation/mobility_type_display.dart';
import '/map/rendering/elements/marker_element.dart';

class MobilityMarkerElement extends MarkerElement {
  final SegmentUiModel segmentUiModel;

  const MobilityMarkerElement(super.tripId, this.segmentUiModel);

  MobilityTypeDisplay get mobilityType =>
      MobilityTypeDisplay.from(segmentUiModel.mobilityType);

  @override
  LatLng get latLng {
    // Compute center of segment geometry
    if (segmentUiModel.geometry.isEmpty) {
      return const LatLng(0, 0);
    }
    final minLat = segmentUiModel.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLat = segmentUiModel.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a > b ? a : b);
    final minLng = segmentUiModel.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLng = segmentUiModel.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a > b ? a : b);
    return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
  }

  @override
  Widget buildMarker({bool isDragging = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(
          segmentUiModel.mobilityTypeDisplay.colorValue,
        ).withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(
        segmentUiModel.mobilityTypeDisplay.icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }

  @override
  MapInputEvent tapEvent() => SegmentMobilityMarkerTapped(segmentUiModel.ref);

  @override
  MapInputEvent doubleTapEvent() =>
      SegmentMobilityMarkerDoubleTapped(segmentUiModel.ref);
}
