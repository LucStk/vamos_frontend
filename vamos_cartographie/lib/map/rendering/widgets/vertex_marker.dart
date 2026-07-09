import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';

class VertexMarker extends ConsumerWidget {
  final TripId tripId;
  final VertexRef vertexRef;
  final bool isDragging;

  const VertexMarker({
    super.key,
    required this.tripId,
    required this.vertexRef,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(isVertexSelectedProvider(tripId, vertexRef));

    return Icon(
      Icons.circle,
      size: selected ? 30 : 20,
      color: selected ? Colors.red : Colors.black,
    );
  }
}
