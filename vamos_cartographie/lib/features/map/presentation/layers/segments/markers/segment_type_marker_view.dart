import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/segments/segments.dart';

class SegmentTypeMarkerView extends ConsumerWidget {
  final SegmentType type;

  const SegmentTypeMarkerView({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: type.color.withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      child: Icon(type.icon, color: Colors.white, size: 12),
    );
  }
}
