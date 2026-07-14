import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:vamos_cartographie/topology/topology.dart';

class MobilityMarker extends ConsumerWidget {
  final TripId tripId;
  final SegmentId segId;

  const MobilityMarker({super.key, required this.tripId, required this.segId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(segmentProvider(segId)).displayValue;
    return Container(
      decoration: BoxDecoration(
        color: Color(segment.mobilityTypeDisplay.colorValue).withOpacity(0.7),
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
