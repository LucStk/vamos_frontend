import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/buttons.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import "popup_abstract.dart";
import "popup_shell.dart";

class WaypointPopUp extends AbstractPopUp {
  final Id<Waypoint> waypointId;
  const WaypointPopUp({
    super.key,
    required super.tripId,
    required this.waypointId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopUpShell(
      buttonsBuilder: (ctx) => [
        // StartSegmentButton(tripId: tripId, vertexId: vertexId),
        // EndSegmentButton(tripId: tripId, vertexId: vertexId),
      ],
    );
  }
}
