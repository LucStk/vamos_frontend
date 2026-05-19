import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/domain/models.dart';

abstract class ITripRepository {
  /// Récupère tous les trips (informations de base, sans waypoints ni segments).
  Future<Either<Failure, List<Trip>>> getAllTrips();

  /// Récupère un trip complet (avec waypoints et segments) par son [id].
  Future<Either<Failure, Trip>> getTrip(int id);

  /// Crée un nouveau trip à partir d'un objet [Trip] domaine.
  /// Retourne le trip créé (avec son id assigné par le serveur).
  Future<Either<Failure, Trip>> createTrip(Trip trip);

  /// Met à jour le trip identifié par [id] avec les données de [trip].
  /// Retourne le trip mis à jour.
  Future<Either<Failure, Trip>> updateTrip(int id, Trip trip);

  /// Supprime le trip identifié par [id].
  Future<Either<Failure, void>> deleteTrip(int id);
}
