//Intention métier
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
// On inclut les fichiers enfants
part "vertex_intents.dart";
part "segments_intents.dart";
part "ui_intents.dart";
part "waypoint_intents.dart";

sealed class MapIntents {
  const MapIntents();
}
