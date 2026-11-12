import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/route.dart';

class RoutePayload {
  RoutePayload({
    required this.route,
    required this.mobilitySpans,
    required this.editSpans,
  });
  final RouteRemoteModel route;
  final Iterable<MobilitySpanRemoteModel> mobilitySpans;
  final Iterable<EditSpan> editSpans;
}

class EditRoutePayload {
  EditRoutePayload({
    required this.route,
    required this.mobilitySpans,
    required this.editSpans,
  });
  final RouteRemoteModel route;
  final Iterable<MobilitySpanRemoteModel> mobilitySpans;
  final Iterable<EditSpan> editSpans;
}

class PreviewEditSpan {
  PreviewEditSpan({
    this.id,
    required this.isNew,
    required this.startIndex,
    required this.editId,
    required this.geometrySource,
  });
  final bool isNew;
  final int startIndex;
  final GeometrySource geometrySource;
  final EditId editId;
  final Id? id;
}

class PreviewMobilitySpan {
  PreviewMobilitySpan({
    this.id,
    required this.startIndex,
    required this.mobilityType,
  });
  final Id? id;
  final int startIndex;
  final MobilityType mobilityType;
}

class PreviewRoutePayload {
  PreviewRoutePayload({
    required this.proposalId,
    required this.mobilitySpans,
    required this.editSpans,
    required this.coordinates,
  });
  final Id proposalId;
  final List<LatLng> coordinates;
  final Iterable<PreviewMobilitySpan> mobilitySpans;
  final Iterable<PreviewEditSpan> editSpans;
}
