import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/trips/data/data.dart';
import "package:vamos_cartographie/core/injection/client_provider.dart";

part 'trips_providers.g.dart';

@riverpod
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TripRepository tripRepository(Ref ref) {
  return TripRepository(ref.watch(tripRemoteDatasourceProvider));
}
