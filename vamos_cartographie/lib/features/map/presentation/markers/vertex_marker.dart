import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_popUp_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';

class VertexMarker extends AbstractMarker {
  final Id<Vertex> vertexId;
  const VertexMarker({
    super.key,
    required super.tripId,
    required this.vertexId,
    super.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertex = ref.watch(nodeRequiredProvider<Vertex>(tripId, vertexId));
    return MarkerPopUpShell(
      tripId: tripId,
      latLng: vertex.latLng,
      popUp: VertexPopUp(tripId: tripId),
      child: Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5)),
    );
  }
}
