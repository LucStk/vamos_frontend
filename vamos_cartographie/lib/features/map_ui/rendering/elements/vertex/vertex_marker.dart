import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

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
