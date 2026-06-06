import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntermediateMarkerView extends ConsumerWidget {
  final type;
  final bool isDragging = false;
  const IntermediateMarkerView({super.key, required this.type, isDragging});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: isDragging ? type.color : type.color.withOpacity(0.7),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Icon(Icons.circle, color: Colors.white, size: 10),
    );
  }
}
