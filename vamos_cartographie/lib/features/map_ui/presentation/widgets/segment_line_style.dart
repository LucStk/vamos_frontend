import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/topology/mobility_type_display.dart';

import 'package:vamos_cartographie/core/injection/injection.dart';

class SegmentLineStyle extends ConsumerWidget {
  final SegmentRef segmentId;
  final Id<Trip> tripId;

  const SegmentLineStyle({
    super.key,
    required this.tripId,
    required this.segmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segment = ref.watch(segmentUiProvider(segmentId));
    if (segment == null) {
      return ErrorWidget(Exception("SegmentRef not found"));
    }
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
