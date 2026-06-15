import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

abstract class MapMarker extends ConsumerWidget {
  final Id<Trip> tripId;
  const MapMarker({super.key, required this.tripId});
}
