import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:domain_core/domain_core.dart';

class MobilityTypeMarker extends ConsumerWidget {
  final Id<Segment> segmentId;
  final Id<Trip> tripId;

  const MobilityTypeMarker({
    super.key,
    required this.tripId,
    required this.segmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(nodeRequiredProvider<Segment>(tripId, segmentId));
    return Container(
      decoration: BoxDecoration(
        color: segment.mobilityTypeUi.color.withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(segment.mobilityType.icon, color: Colors.white, size: 12),
    );
  }
}
