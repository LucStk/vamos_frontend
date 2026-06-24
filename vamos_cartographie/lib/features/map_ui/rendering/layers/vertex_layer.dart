import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map_ui/adapters/marker_adapter.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';

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
