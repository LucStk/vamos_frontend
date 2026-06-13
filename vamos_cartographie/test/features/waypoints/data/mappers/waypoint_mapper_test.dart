import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_mappers.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';
import 'package:vamos_cartographie/backend/backend.dart';

void main() {
  group('WaypointMapper', () {
    // ---------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------

    GWaypointFieldsData buildGQLWaypoint({
      int id = 5,
      int vertexId = 12,
      GWaypointEnum type = GWaypointEnum.WAYPOINT,
      String title = 'Point de passage',
      String description = 'Une description',
      List<GWaypointFieldsData_images> images = const [],
    }) {
      return GWaypointFieldsData(
        id: id,
        type: type,
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

        expect(waypoint.id, 5);
        expect(waypoint.title, 'Camping des pins');
        expect(waypoint.description, 'Un camping sympa');
      });

      test('maps vertexId from nested vertex', () {
        final gql = buildGQLWaypoint(vertexId: 42);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.vertexId, 42);
      });

      test('maps GWaypointEnum to WaypointType via enum mapper', () {
        final gql = buildGQLWaypoint(type: GWaypointEnum.CAMPING);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.type, WaypointType.camping);
      });

      test('maps empty title and description', () {
        final gql = buildGQLWaypoint(title: '', description: '');

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.title, '');
        expect(waypoint.description, '');
      });

      test('maps waypoint of type START', () {
        final gql = buildGQLWaypoint(type: GWaypointEnum.START);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.type, WaypointType.start);
      });

      test('maps waypoint of type END', () {
        final gql = buildGQLWaypoint(type: GWaypointEnum.END);

        final waypoint = WaypointMapper.fromGQL(gql);

        expect(waypoint.type, WaypointType.end);
      });
    });
  });
}
