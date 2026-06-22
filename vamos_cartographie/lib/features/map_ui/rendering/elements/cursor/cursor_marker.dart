import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

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
