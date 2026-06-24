import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/queries/segment_ui_queries.dart';
import 'package:vamos_cartographie/features/topology/segment_ui.dart';

class MobilityTypeMarker extends ConsumerWidget {
  final SegmentUiId segmentUiId;

  const MobilityTypeMarker({super.key, required this.segmentUiId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segmentUi = ref.watch(segmentUiProvider(segmentUiId));
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
