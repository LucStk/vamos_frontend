import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/utiles/polyline_dist.dart';

// const _kRejoinThresholdMeters = 3.0;

List<LatLng> mergeCorrection(List<LatLng> correction, List<LatLng> itineraire) {
  final grab = closestPointOnPolyline(correction.first, itineraire);
  final rejoin = closestPointOnPolyline(correction.last, itineraire);
  return [
    ...itineraire.sublist(0, grab.segmentIndex + 1),
    grab.point,
    ...correction,
    rejoin.point,
    ...itineraire.sublist(rejoin.segmentIndex + 1),
  ];
}

List<LatLng> addCorrection(List<LatLng> correction, List<LatLng> itineraire) {
  final grab = closestPointOnPolyline(correction.first, itineraire);
  return [
    ...itineraire.sublist(0, grab.segmentIndex + 1),
    grab.point,
    ...correction,
  ];
}

List<LatLng> addPathToSegment(List<LatLng> path, List<LatLng> segment) {
  final rejoin = closestPointOnPolyline(path.last, segment);
  return [...path, rejoin.point, ...segment.sublist(rejoin.segmentIndex + 1)];
}
