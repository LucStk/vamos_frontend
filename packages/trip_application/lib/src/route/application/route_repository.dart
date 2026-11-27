import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/route.dart';
import 'package:trip_application/src/trip/trip.dart';

abstract class RouteRepository {
  /// Élévation et nature des voies de la route ; null si jamais calculées.
  Future<Either<Failure, RouteInsights?>> fetchRouteInsights(TripId tripId);

  /// Relance leur calcul (propriétaire seul) ; null si le trip n'a pas de route.
  Future<Either<Failure, RouteInsights?>> recomputeRouteInsights(TripId tripId);

  /// Élévation de la portion que [proposalId] (un aperçu) ajouterait à la
  /// route ; null s'il n'y en a pas (modalité non analysée, proposition
  /// remplacée, pas d'altitude).
  Future<Either<Failure, ElevationProfile?>> fetchProposalElevation({
    required TripId tripId,
    required Id proposalId,
  });

  /// Nature des voies de la portion que [proposalId] (un aperçu) ajouterait à
  /// la route ; null s'il n'y en a pas (hors vélo, proposition remplacée, tracé
  /// à main levée).
  Future<Either<Failure, List<WaySpan>?>> fetchProposalWays({
    required TripId tripId,
    required Id proposalId,
  });

  Future<Either<Failure, EditRoutePayload>> setTripOrigin({
    required TripId tripId,
    required LatLng position,
  });

  Future<Either<Failure, EditRoutePayload>> editRoute({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,

    /// `false` : le tracé à main levée est gardé tel quel (sections DRAWN).
    bool autoRoute = true,
  });
  Future<Either<Failure, EditRoutePayload>> refineSection({
    required TripId tripId,
    required SpanId sectionId,
  });
  Future<Either<Failure, EditRoutePayload>> setSectionMobility({
    required TripId tripId,
    required SpanId sectionId,
    required MobilityType mobilityType,
  });
  /// Donne [mobilityType] à la portion entre [start] et [end], sans toucher
  /// à la géométrie. Le serveur fusionne avec les spans voisins de même
  /// modalité.
  Future<Either<Failure, EditRoutePayload>> setRangeMobility({
    required TripId tripId,
    required SectionAnchor start,
    required SectionAnchor end,
    required MobilityType mobilityType,
  });
  Future<Either<Failure, EditRoutePayload>> deleteRoute(TripId tripId);

  /// Retire [lengthM] mètres de la route, depuis son départ ou son arrivée.
  Future<Either<Failure, EditRoutePayload>> trimRoute({
    required TripId tripId,
    required EndpointAnchor end,
    required double lengthM,
  });
  Future<Either<Failure, PreviewRoutePayload>> previewRouteEdit({
    required Id<Trip> tripId,
    required List<LatLng> geometry,
    MobilityType? mobilityType,
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,

    /// `true` : le serveur calcule le meilleur itinéraire entre les points
    /// (passages) au lieu de coller au réseau un tracé dessiné.
    bool directRoute = false,
  });
  Future<Either<Failure, EditRoutePayload>> commitRouteEdit({
    required Id<Trip> tripId,
    required Id proposalId,
  });

  Future<Failure?> discardRouteProposal({required Id<Trip> tripId});
}
