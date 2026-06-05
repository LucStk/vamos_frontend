import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/waypoints/data/datasources/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/ferry_helpers.dart';
import '../../../fixtures/mock_classes.dart';
import '../../../fixtures/waypoint_fixtures.dart';

void main() {
  late MockFerryClient mockClient;
  late WaypointRemoteDatasource datasource;

  setUpAll(() {
    registerFallbackValue(FakeGUpdateWaypointReq());
  });

  setUp(() {
    mockClient = MockFerryClient();
    datasource = WaypointRemoteDatasource(mockClient);
  });

  // ---------------------------------------------------------------------------
  // WaypointRemoteDatasource.updateWaypoint
  // ---------------------------------------------------------------------------

  group('WaypointRemoteDatasource.updateWaypoint', () {
    test('retourne le waypoint mis à jour avec les champs corrects', () async {
      final input = GWaypointUpdateInput();
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 12, waypoint: input),
      );
      final gqlData = GUpdateWaypointData(
        updateWaypoint: gWaypointData(
          id: 12,
          vertexId: 100,
          lat: 48.8566,
          lng: 2.3522,
          type: GWaypointEnum.WAYPOINT,
          title: 'Waypoint 12',
          description: 'Desc 12',
        ),
      );
      when(
        () => mockClient.request(any<GUpdateWaypointReq>()),
      ).thenAnswer((_) => Stream.value(okResponse(req, gqlData)));

      final result = await datasource.updateWaypoint(id: 12, input: input);

      expect(result.id, 12);
      expect(result.title, 'Waypoint 12');
      expect(result.type, GWaypointEnum.WAYPOINT);
      expect(result.vertex.latLng.lat, closeTo(48.8566, 0.0001));
      expect(result.vertex.latLng.lng, closeTo(2.3522, 0.0001));
    });

    test('lève une Exception en cas d\'erreur GraphQL', () async {
      final input = GWaypointUpdateInput();
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 12, waypoint: input),
      );
      when(
        () => mockClient.request(any<GUpdateWaypointReq>()),
      ).thenAnswer((_) => Stream.value(errResponse(req)));

      expect(datasource.updateWaypoint(id: 12, input: input), throwsException);
    });

    test('lève une Exception si data est null', () async {
      final input = GWaypointUpdateInput();
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 5, waypoint: input),
      );
      when(() => mockClient.request(any<GUpdateWaypointReq>())).thenAnswer(
        (_) => Stream.value(
          nullDataResponse<GUpdateWaypointData, GUpdateWaypointVars>(req),
        ),
      );

      expect(datasource.updateWaypoint(id: 5, input: input), throwsException);
    });
  });
}
