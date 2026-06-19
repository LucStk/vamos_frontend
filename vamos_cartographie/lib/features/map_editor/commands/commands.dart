library map_commands;

//Intention métier
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
// On inclut les fichiers enfants
part "vertex_commands.dart";
part "segments_commands.dart";
part "ui_commands.dart";
part "waypoint_commands.dart";

sealed class MapCommand {
  const MapCommand();
}
