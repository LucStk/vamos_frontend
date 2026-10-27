import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';

part 'my_trips_provider.g.dart';

@riverpod
Future<List<TripSummary>> myTrips(Ref ref) async {
  final repository = ref.watch(tripRepositoryProvider);
  final result = await repository.getMeTripsSummary();

  return result.fold((failure) => throw failure, (trips) => trips);
}
