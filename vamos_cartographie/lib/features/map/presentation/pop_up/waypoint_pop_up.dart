import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/orchestrators/display_segment_orchestrator.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/buttons.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import "pop_up_abstract.dart";
import "pop_up_shell.dart";

class WaypointPopUp extends AbstractPopUp {
  final Id<Vertex> vertexId;
  const WaypointPopUp({
    super.key,
    required super.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    segOrchestrator() =>
        ref.read(displaySegmentOrchestratorProvider(tripId).notifier);

    return PopUpShell(
      buttonsBuilder: (ctx) => [
        StartSegmentButton(
          onPressed: () {
            segOrchestrator().startWaypoint(vertexId);
          },
        ),
        EndSegmentButton(
          onPressed: () {
            segOrchestrator().endWaypoint(vertexId);
          },
        ),
      ],
    );
  }
}
