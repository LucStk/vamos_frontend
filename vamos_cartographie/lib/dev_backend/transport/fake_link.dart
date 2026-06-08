import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart' show Link, NextLink;

import "package:vamos_cartographie/dev_backend/resolvers/resolvers.dart";

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";

/// Implémentation fake de [Link] pour les tests.
///
/// Intercepte chaque requête GraphQL par son `operationName`, délègue au
/// resolver approprié, et retourne un [Response] synchrone.
///
/// Usage dans les tests :
/// ```dart
/// final store = FakeGraphQLStoreFactory.withDefaultSeed();
/// final client = Client(link: FakeLink(store), cache: Cache());
/// ```
///
/// Recommandation : utiliser [FetchPolicy.networkOnly] sur les requêtes pour
/// garantir que chaque appel passe par [FakeLink] et non par le cache.
class FakeLink extends Link {
  final FakeGraphQLStore store;

  FakeLink(this.store);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final operationName = request.operation.operationName;
    final variables = request.variables;

    try {
      final data = _dispatch(operationName, variables);
      return Stream.value(Response(data: data, response: const {}));
    } catch (e) {
      return Stream.value(
        Response(
          errors: [GraphQLError(message: e.toString())],
          response: const {},
        ),
      );
    }
  }

  Map<String, dynamic> _dispatch(
    String? operationName,
    Map<String, dynamic> variables,
  ) {
    final trips = TripResolver(store);
    final waypoints = WaypointResolver(store);
    final topology = TopologyResolver(store);
    final media = MediaResolver(store);

    return switch (operationName) {
      // ── Trips ────────────────────────────────────────────────────────────────
      'GetAllTrips' => trips.getAllTrips(),
      'GetTrip' => trips.getTrip(variables['id'] as int),
      'CreateTrip' => trips.createTrip(variables),
      'UpdateTrip' => trips.updateTrip(variables),
      'DeleteTrip' => trips.deleteTrip(variables['id'] as int),
      'AttachImageToTrip' => trips.attachImageToTrip(variables),
      'DeleteImageFromTrip' => trips.deleteImageFromTrip(variables),

      // ── Waypoints ────────────────────────────────────────────────────────────
      'GetWaypoints' => waypoints.getWaypoints(variables['tripId'] as int),
      'CreateWaypoint' => waypoints.createWaypoint(variables),
      'UpdateWaypoint' => waypoints.updateWaypoint(variables),
      'DeleteWaypoint' => waypoints.deleteWaypoint(
        variables['waypointId'] as int,
      ),
      'AttachImageToWaypoint' => waypoints.attachImageToWaypoint(variables),
      'DeleteImageFromWaypoint' => waypoints.deleteImageFromWaypoint(variables),

      // ── Topology — Segments ──────────────────────────────────────────────────
      'GetSegments' => topology.getSegments(variables['tripId'] as int),
      'CreateSegment' => topology.createSegment(variables),
      'UpdateSegment' => topology.updateSegment(variables),
      'DeleteSegment' => topology.deleteSegment(variables['segmentId'] as int),

      // ── Topology — Vertices ──────────────────────────────────────────────────
      'GetVertices' => topology.getVertices(variables['tripId'] as int),
      'GetTopology' => topology.getTopology(variables['tripId'] as int),
      'CreateVertex' => topology.createVertex(variables),
      'MoveVertex' => topology.moveVertex(variables),
      'DeleteVertex' => topology.deleteVertex(variables['vertexId'] as int),

      // ── Media ────────────────────────────────────────────────────────────────
      'GenerateImageUploadUrl' => media.generateImageUploadUrl(variables),
      'CreateImage' => media.createImage(variables),

      _ => throw Exception('FakeLink : opération inconnue "$operationName"'),
    };
  }
}
