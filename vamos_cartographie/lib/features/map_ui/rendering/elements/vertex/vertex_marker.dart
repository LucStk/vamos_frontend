import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/topology/vertex_ui.dart';

class VertexMarker extends StatelessWidget {
  final VertexUiId vertexUiId;
  final bool isDragging;

  const VertexMarker({
    super.key,
    required this.vertexUiId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5));
  }
}
