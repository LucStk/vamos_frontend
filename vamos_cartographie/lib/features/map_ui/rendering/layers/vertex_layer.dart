import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/queries/vertex_ui_queries.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/adapters/marker_adapter.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertexIds = ref.watch(vertexUiIdsProvider);
    final ctrl = ref.read(mapCtrlProvider(tripId).notifier);
    final markers = vertexIds.map((vertexUiId) {
      
      return toDragMarker(vertexUiId, tripId, ctrl);
    }).toList();

    return DragMarkers(markers: markers);
  }
}
