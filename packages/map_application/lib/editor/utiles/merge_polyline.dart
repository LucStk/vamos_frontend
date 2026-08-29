import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/utiles/polyline_dist.dart';

// const _kRejoinThresholdMeters = 3.0;

List<LatLng> mergeCorrection(List<LatLng> correction, List<LatLng> itineraire) {
  final grab = closestPointOnPolyline(correction.first, itineraire);
  final rejoin = closestPointOnPolyline(correction.last, itineraire);
  print("merge correction $grab $rejoin");
  // if (rejoin.distanceMeters > _kRejoinThresholdMeters) return this;
  // if (rejoin.segmentIndex <= grab.segmentIndex) {
  //   return this; // pas "après" le grab
  // }
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
  // if (rejoin.distanceMeters > _kRejoinThresholdMeters) return this;
  // if (rejoin.segmentIndex <= grab.segmentIndex) {
  //   return this; // pas "après" le grab
  // }
  return [
    ...itineraire.sublist(0, grab.segmentIndex + 1),
    grab.point,
    ...correction,
  ];
}
