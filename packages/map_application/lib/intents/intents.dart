//Intention métier
import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:trip_application/waypoint/domain/domain.dart';
// On inclut les fichiers enfants
part "vertex_intents.dart";
part "segments_intents.dart";
part "idle_intents.dart";
part "waypoint_intents.dart";

sealed class MapIntents {
  const MapIntents();
}
