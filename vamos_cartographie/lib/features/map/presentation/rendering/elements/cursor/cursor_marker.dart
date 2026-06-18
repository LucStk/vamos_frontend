import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class CursorMarker extends StatelessWidget {
  final Id<Trip> tripId;
  final bool isDragging;
  const CursorMarker({
    super.key,
    required this.tripId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.place_sharp, size: 30, color: Colors.black);
  }
}
