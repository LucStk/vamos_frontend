// ===========================================================================
// Fragments et opérations GraphQL — vamos_cartographie
//
// Usage dans l'app parente :
//   import 'package:vamos_cartographie/vamos_cartographie.dart';
//
//   final result = await client.query(QueryOptions(
//     document: gql(TripOperations.getTrip),
//     variables: {'id': '123'},
//   ));
//   final trip = Trip.fromGraphQL(result.data!['trip']);
// ===========================================================================

/// Fragments réutilisables
class TripFragments {
  TripFragments._();

  static const String latLng = '''
    fragment LatLngFields on LatLng {
      lat
      lng
    }
  ''';

  static const String waypoint = '''
    fragment WaypointFields on Waypoint {
      id
      lat
      lng
      type
      description
      imageUrls
    }
  ''';

  static const String segment = '''
    fragment SegmentFields on Segment {
      id
      type
      intermediatePoints {
        ...LatLngFields
      }
    }
  ''';

  static const String tripInfo = '''
    fragment TripInfoFields on TripInfo {
      title
      description
      date
      imageUrls
    }
  ''';

  static const String trip = '''
    fragment TripFields on Trip {
      id
      tripInfo {
        ...TripInfoFields
      }
      waypoints {
        ...WaypointFields
      }
      segments {
        ...SegmentFields
      }
    }
  ''';

  /// Tous les fragments combinés — à inclure avec les opérations
  static const String all =
      '''
    $latLng
    $waypoint
    $segment
    $tripInfo
    $trip
  ''';
}

/// Queries GraphQL
class TripQueries {
  TripQueries._();

  /// Récupère une trip par son ID
  static const String getTrip =
      '''
    ${TripFragments.all}

    query GetTrip(\$id: ID!) {
      trip(id: \$id) {
        ...TripFields
      }
    }
  ''';

  /// Liste toutes les trips
  static const String listTrips =
      '''
    ${TripFragments.all}

    query ListTrips {
      trips {
        ...TripFields
      }
    }
  ''';
}

/// Mutations GraphQL (Relay-style)
class TripMutations {
  TripMutations._();

  /// Crée une nouvelle trip
  /// Variables : { input: { clientMutationId?, trip: TripInput } }
  /// Utiliser : Trip.toGraphQLInput() pour construire `trip`
  static const String createTrip =
      '''
    ${TripFragments.all}

    mutation CreateTrip(\$input: CreateTripInput!) {
      createTrip(input: \$input) {
        clientMutationId
        trip {
          ...TripFields
        }
      }
    }
  ''';

  /// Met à jour une trip existante
  /// Variables : { input: { clientMutationId?, id: ID!, trip: TripInput } }
  static const String updateTrip =
      '''
    ${TripFragments.all}

    mutation UpdateTrip(\$input: UpdateTripInput!) {
      updateTrip(input: \$input) {
        clientMutationId
        trip {
          ...TripFields
        }
      }
    }
  ''';

  /// Supprime une trip
  /// Variables : { input: { clientMutationId?, id: ID! } }
  static const String deleteTrip = '''
    mutation DeleteTrip(\$input: DeleteTripInput!) {
      deleteTrip(input: \$input) {
        clientMutationId
        deletedId
      }
    }
  ''';
}
