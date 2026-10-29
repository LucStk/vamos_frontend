import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/route.dart';

sealed class RouteAnchor {
  const RouteAnchor();
}

class SectionAnchor extends RouteAnchor {
  final LatLng position;
  final SectionId sectionId;

  const SectionAnchor({required this.sectionId, required this.position});
}

sealed class EndpointAnchor extends RouteAnchor {
  // Le position dans EndpointAnchor est utilisé comme point de départ pour le crayon.
  //  super.position ne sera pas transmis au backend
  const EndpointAnchor();
}

class StartRouteAnchor extends EndpointAnchor {
  const StartRouteAnchor();
}

class EndRouteAnchor extends EndpointAnchor {
  const EndRouteAnchor();
}
