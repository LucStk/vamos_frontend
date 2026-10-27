import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/user_profile_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';

part 'user_trips_provider.g.dart';

@riverpod
Future<List<TripSummary>> userTrips(Ref ref, UserId id) async {
  final repository = ref.watch(tripRepositoryProvider);
  final result = await repository.getUserTripsSummary(id);

  return result.fold((failure) => throw failure, (trips) => trips);
}
