import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

/// Centralise toutes les conversions GQL ↔ Domain pour les entités Trip.
class TripMapper {
  /// segments) en [Trip] domaine. Utilisé pour la liste de trips.
  static Trip fromGQLFields(GTripFieldsData data) => Trip(
    id: data.id,
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images
        .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
        .toList(),
  );

  /// Convertit un [GGetTripData_trip] (query détaillée, avec waypoints et
  /// segments) en [Trip] domaine.
  static Trip fromGQLDetail(GGetTripData_trip data) => Trip(
    id: data.id,
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images
        .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
        .toList(),
  );

  /// Convertit le résultat de la mutation createTrip en [Trip] domaine.
  static Trip fromGQLCreateResult(GTripFields data) => Trip(
    id: data.id,
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images
        .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
        .toList(),
  );

  /// Convertit le résultat de la mutation updateTrip en [Trip] domaine.
  static Trip fromGQLUpdateResult(GTripFields data) => Trip(
    id: data.id,
    title: data.title,
    description: data.description,
    date: data.date != null ? DateTime.parse(data.date!) : null,
    images: data.images
        .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
        .toList(),
  );
}
