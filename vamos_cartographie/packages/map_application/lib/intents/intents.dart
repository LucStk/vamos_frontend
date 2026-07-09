//Intention métier
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/types/segment_ref.dart';
import 'package:trip_application/topology/domain/types/vertex_ref.dart';
import 'package:trip_application/waypoint/domain/waypoint.dart';
// On inclut les fichiers enfants
part "vertex_intents.dart";
part "segments_intents.dart";
part "idle_intents.dart";
part "waypoint_intents.dart";

sealed class MapIntents {
  const MapIntents();
}
