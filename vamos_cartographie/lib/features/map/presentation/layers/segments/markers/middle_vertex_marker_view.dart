import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

class MiddleVertexMarkerView extends ConsumerWidget {
  final SegmentType type;

  const MiddleVertexMarkerView({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: type.color.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(Icons.circle, size: 8, color: Colors.white.withOpacity(0.5)),
    );
  }
}
