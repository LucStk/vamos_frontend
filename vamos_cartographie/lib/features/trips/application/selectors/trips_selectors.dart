import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/application/command_handlers/trip_handler.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
part 'trips_selectors.g.dart';

// Dans trips_notifier.dart
@riverpod
Trip? tripById(Ref ref, Id<Trip> id) {
  // Ce provider écoute la Map globale, mais ne renvoie QUE le trip concerné
  return ref.watch(tripHandlerProvider).value?[id];
}
