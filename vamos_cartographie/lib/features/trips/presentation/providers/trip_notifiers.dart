import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/i_trip_repository.dart';

/// Notifier simple pour la liste des trips, basé sur [ValueNotifier].
/// Utilise [ITripRepository] injecté via GetIt.
class TripsNotifier extends ChangeNotifier {
  final ITripRepository repository;

  List<Trip> _trips = [];
  bool _isLoading = false;
  String? _error;

  List<Trip> get trips => _trips;
  bool get isLoading => _isLoading;
  String? get error => _error;

  TripsNotifier(this.repository) {
    loadTrips();
  }

  Future<void> loadTrips() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await repository.getAllTrips();

    result.fold(
      (failure) {
        _error = failure.message;
        _isLoading = false;
      },
      (trips) {
        _trips = trips;
        _isLoading = false;
      },
    );
    notifyListeners();
  }

  Future<void> refresh() => loadTrips();

  Future<void> createTrip(Trip trip) async {
    final result = await repository.createTrip(trip);
    result.fold((failure) => throw Exception(failure.message), (_) {});
    await refresh();
  }

  Future<void> updateTrip(int id, Trip trip) async {
    final result = await repository.updateTrip(id, trip);
    result.fold((failure) => throw Exception(failure.message), (_) {});
    await refresh();
  }

  Future<void> deleteTrip(int id) async {
    final result = await repository.deleteTrip(id);
    result.fold((failure) => throw Exception(failure.message), (_) {});
    await refresh();
  }
}
