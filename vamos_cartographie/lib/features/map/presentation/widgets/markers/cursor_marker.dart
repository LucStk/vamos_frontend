import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/map_marker.dart';

class CursorMarker extends MapMarker {
  const CursorMarker({
    super.key,
    required super.tripId,
    super.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.topCenter,
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   border: Border.all(color: Colors.white, width: 2),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.2),
      //       blurRadius: 4,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Icon(Icons.place_sharp, size: 30, color: Colors.black),
    );
  }
}
