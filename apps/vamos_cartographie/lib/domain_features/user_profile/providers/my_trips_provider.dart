import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';

import '../../trip/injection/injection.dart';

part 'my_trips_provider.g.dart';

typedef UserTrip = (Trip, List<StoredFileRemoteModel>);

@riverpod
Future<List<UserTrip>> myTrips(Ref ref) async {
  final repository = ref.watch(tripRepositoryProvider);
  final result = await repository.getMeTrips();

  return result.fold((failure) => throw failure, (trips) => trips);
}
