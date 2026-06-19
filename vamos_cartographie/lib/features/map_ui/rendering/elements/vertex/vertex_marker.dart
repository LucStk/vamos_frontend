import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

class VertexMarker extends StatelessWidget {
  final Id<Vertex> vertexId;
  final Id<Trip> tripId;
  final bool isDragging;

  const VertexMarker({
    super.key,
    required this.tripId,
    required this.vertexId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5));
  }
}
