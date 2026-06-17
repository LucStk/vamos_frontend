import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

class SegmentLineStyle extends ConsumerWidget {
  final Id<Segment> segmentId;
  final Id<Trip> tripId;

  const SegmentLineStyle({
    super.key,
    required this.tripId,
    required this.segmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(nodeRequiredProvider<Segment>(tripId, segmentId));
    return Container(
      decoration: BoxDecoration(
        color: segment.mobilityType.color.withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(segment.mobilityType.icon, color: Colors.white, size: 12),
    );
  }
}
