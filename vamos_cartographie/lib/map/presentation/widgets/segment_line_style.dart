import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/topology.dart';

class SegmentLineStyle extends ConsumerWidget {
  final SegmentId segmentId;
  final Id<Trip> tripId;

  const SegmentLineStyle({
    super.key,
    required this.tripId,
    required this.segmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(segmentProvider(segmentId)).displayValue;
    return Container(
      decoration: BoxDecoration(
        color: Color(segment.mobilityTypeDisplay.colorValue),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(
        segment.mobilityTypeDisplay.icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }
}
