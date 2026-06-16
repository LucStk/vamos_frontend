import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/map_marker.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/marker_wt_popMenu_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/menus/vertex_menu.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';

class VertexMarker extends MapMarker {
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
    return MarkerWtPopmenuShell(
      tripId: tripId,
      latLng: vertex.latLng,
      popMenu: VertexMenu(tripId: tripId),
      child: Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5)),
    );
  }
}
