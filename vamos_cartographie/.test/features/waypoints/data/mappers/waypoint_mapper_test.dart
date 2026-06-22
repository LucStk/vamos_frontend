import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/backend/backend.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/mappers/mappers.dart';

void main() {
  group('WaypointMapper', () {
    // ---------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------

    GWaypointFieldsData buildGQLWaypoint({
      int id = 5,
      int vertexId = 12,
      GPoiCategory type = GPoiCategory.WAYPOINT,
      String title = 'Point de passage',
      String description = 'Une description',
      List<GWaypointFieldsData_images> images = const [],
    }) {
      return GWaypointFieldsData(
        id: id,
        poiCategory: type,
        title: title,
        description: description,
        vertex: GVertexFieldsData(
          id: vertexId,
          latLng: GLatLngFieldsData(lat: 48.5, lng: 2.3),
        ),
        images: images,
      );
    }

    // ---------------------------------------------------------------------------
    // fromGQL
    // ---------------------------------------------------------------------------

    group('fromGQL', () {
      // Given a GWaypointFieldsData from the GQL layer
      // When fromGQL is called
      // Then all domain fields are correctly populated

      test('maps id, title and description', () {
        final gql = buildGQLWaypoint(
          id: 5,
          title: 'Camping des pins',
          description: 'Un camping sympa',
        );

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.id, Id<Waypoint>(5));
        expect(waypoint.title, 'Camping des pins');
        expect(waypoint.description, 'Un camping sympa');
      });

      test('maps vertexId from nested vertex', () {
        final gql = buildGQLWaypoint(vertexId: 42);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.vertexId, Id<Vertex>(42));
      });

      test('maps GPoiCategory to PoiCategory via enum mapper', () {
        final gql = buildGQLWaypoint(type: GPoiCategory.CAMPING);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.poiCategory, PoiCategory.camping);
      });

      test('maps empty title and description', () {
        final gql = buildGQLWaypoint(title: '', description: '');

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.title, '');
        expect(waypoint.description, '');
      });

      test('maps waypoint of type START', () {
        final gql = buildGQLWaypoint(type: GPoiCategory.START);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.poiCategory, PoiCategory.start);
      });

      test('maps waypoint of type END', () {
        final gql = buildGQLWaypoint(type: GPoiCategory.END);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.poiCategory, PoiCategory.end);
      });
    });
  });
}
