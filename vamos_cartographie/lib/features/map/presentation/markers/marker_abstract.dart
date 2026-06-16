import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

abstract class AbstractMarker extends ConsumerWidget {
  final Id<Trip> tripId;
  final bool isDragging;
  const AbstractMarker({
    super.key,
    required this.tripId,
    required this.isDragging,
  });
}
