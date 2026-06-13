import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

abstract class AbstractLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const AbstractLayer({super.key, required this.tripId});
}
