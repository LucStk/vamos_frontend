import 'package:flutter/material.dart';
import 'package:trip_domain/domain/domain.dart';

class VertexMarker extends StatelessWidget {
  final VertexRef vertexRef;
  final bool isDragging;

  const VertexMarker({
    super.key,
    required this.vertexRef,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5));
  }
}
