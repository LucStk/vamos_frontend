import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/adapters/drag_marker_adapter.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/providers/topology_ui_provider.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/vamos_cartographie.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertices = ref.watch(topologyVerticesProvider(tripId));
    final ctrl = ref.read(mapCtrlProvider(tripId).notifier);
    final markers = vertices.map((vertex) {
      return toDragMarker(vertex, tripId, ctrl);
    }).toList();

    return DragMarkers(markers: markers);
  }
}
