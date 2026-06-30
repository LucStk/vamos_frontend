import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/segment_ui_queries.dart';

class MobilityTypeMarker extends ConsumerWidget {
  final SegmentRef segmentRef;

  const MobilityTypeMarker({super.key, required this.segmentRef});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segmentUi = ref.watch(segmentUiProvider(segmentRef));
    if (segmentUi == null) {
      return ErrorWidget(Exception("noSegmentUIFound"));
    }
    return Container(
      decoration: BoxDecoration(
        color: Color(segmentUi.mobilityType.colorValue).withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(segmentUi.mobilityType.icon, color: Colors.white, size: 12),
    );
  }
}
