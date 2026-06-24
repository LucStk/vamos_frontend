library map_commands;

//Intention métier
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
// On inclut les fichiers enfants
part "vertex_commands.dart";
part "segments_commands.dart";
part "ui_commands.dart";
part "waypoint_commands.dart";

sealed class MapCommand {
  const MapCommand();
}
