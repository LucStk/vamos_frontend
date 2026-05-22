import 'package:api_client/api_client.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/data/datasources/waypoint_remote_datasource.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Mocks & Fakes
// ─────────────────────────────────────────────────────────────────────────────

class MockFerryClient extends Mock implements Client {}

class FakeUpdateWaypointReq extends Fake implements GUpdateWaypointReq {}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers réponse Ferry
// ─────────────────────────────────────────────────────────────────────────────

OperationResponse<TData, TVars> _ok<TData, TVars>(
  OperationRequest<TData, TVars> req,
  TData data,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: data,
  graphqlErrors: null,
  linkException: null,
  dataSource: DataSource.None,
);

OperationResponse<TData, TVars> _err<TData, TVars>(
  OperationRequest<TData, TVars> req,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: null,
  graphqlErrors: [const GraphQLError(message: 'Erreur serveur')],
  linkException: null,
  dataSource: DataSource.None,
);

// ─────────────────────────────────────────────────────────────────────────────
// Helpers données GQL
// ─────────────────────────────────────────────────────────────────────────────

GWaypointFieldsData _waypointData(int id) => GWaypointFieldsData(
  id: id,
  lat: 48.8566,
  lng: 2.3522,
  type: GWaypointEnum.WAYPOINT,
  title: 'Waypoint $id',
  description: 'Desc $id',
  images: [],
);

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  late MockFerryClient mockClient;
  late WaypointRemoteDatasource datasource;

  setUpAll(() {
    registerFallbackValue(FakeUpdateWaypointReq());
  });

  setUp(() {
    mockClient = MockFerryClient();
    datasource = WaypointRemoteDatasource(mockClient);
  });

  // ---------------------------------------------------------------------------
  // updateWaypoint
  // ---------------------------------------------------------------------------

  group('WaypointRemoteDatasource.updateWaypoint', () {
    test('retourne le waypoint mis à jour', () async {
      final input = GWaypointUpdateInput();
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 12, waypoint: input),
      );
      final gqlData = GUpdateWaypointData(updateWaypoint: _waypointData(12));
      when(
        () => mockClient.request(any<GUpdateWaypointReq>()),
      ).thenAnswer((_) => Stream.value(_ok(req, gqlData)));

      final result = await datasource.updateWaypoint(id: 12, input: input);

      expect(result.id, 12);
      expect(result.title, 'Waypoint 12');
      expect(result.type, GWaypointEnum.WAYPOINT);
      expect(result.lat, 48.8566);
      expect(result.lng, 2.3522);
    });

    test("lève une Exception en cas d'erreur GraphQL", () async {
      final input = GWaypointUpdateInput();
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 12, waypoint: input),
      );
      when(
        () => mockClient.request(any<GUpdateWaypointReq>()),
      ).thenAnswer((_) => Stream.value(_err(req)));

      expect(datasource.updateWaypoint(id: 12, input: input), throwsException);
    });

    test('lève une Exception si data est null', () async {
      final req = GUpdateWaypointReq(
        vars: GUpdateWaypointVars(id: 5, waypoint: GWaypointUpdateInput()),
      );
      when(() => mockClient.request(any<GUpdateWaypointReq>())).thenAnswer(
        (_) => Stream.value(
          OperationResponse<GUpdateWaypointData, GUpdateWaypointVars>(
            operationRequest: req,
            data: null,
            graphqlErrors: null,
            linkException: null,
            dataSource: DataSource.None,
          ),
        ),
      );

      expect(
        datasource.updateWaypoint(id: 5, input: GWaypointUpdateInput()),
        throwsException,
      );
    });
  });
}
