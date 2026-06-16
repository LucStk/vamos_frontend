import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_abstract.dart';

class CursorMarker extends AbstractMarker {
  const CursorMarker({
    super.key,
    required super.tripId,
    super.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final mapState = ref.watch(mapStateProvider(tripId).notifier);
    return Icon(Icons.place_sharp, size: 30, color: Colors.black);
  }
}
