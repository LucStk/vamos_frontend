import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/vertex_ui_queries.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(vertexMarkersProvider(tripId));
    return DragMarkers(markers: markers);
  }
}
