import 'package:dartz/dartz.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/waypoints/data/repositories/waypoint_repository.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/mock_classes.dart';
import '../../../fixtures/waypoint_fixtures.dart';

void main() {
  late MockWaypointRemoteDatasource mockDatasource;
  late MockUploadImgRepository mockImageRepo;
  late WaypointRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeGWaypointUpdateInput());
  });

  setUp(() {
    mockDatasource = MockWaypointRemoteDatasource();
    mockImageRepo = MockUploadImgRepository();
    repository = WaypointRepository(mockDatasource);
  });

  // ---------------------------------------------------------------------------
  // WaypointRepository.updateWaypoint
  // ---------------------------------------------------------------------------

  group('WaypointRepository.updateWaypoint', () {
    // ── Cas nominal ──────────────────────────────────────────────────────────

    test(
      'retourne Right(Waypoint) avec les données renvoyées par le serveur',
      () async {
        when(
          () => mockDatasource.updateWaypoint(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenAnswer(
          (_) async => gWaypointData(
            id: 3,
            lat: 43.0,
            lng: 1.5,
            type: GWaypointEnum.CAMPING,
            description: 'Camping en forêt',
          ),
        );

        final draft = domainWaypointDraft(
          lat: 43.0,
          lng: 1.5,
          type: WaypointType.camping,
          description: 'Camping en forêt',
        );
        final result = await repository.updateWaypoint(3, draft);

        expect(result.isRight(), isTrue);
        final wp = (result as Right).value as Waypoint;
        expect(wp.id, 3);
        expect(wp.latLng.latitude, 43.0);
        expect(wp.latLng.longitude, 1.5);
        expect(wp.type, GWaypointEnum.CAMPING);
        expect(wp.description, 'Camping en forêt');
      },
    );

    test('transmet l\'id et l\'input corrects au datasource', () async {
      when(
        () => mockDatasource.updateWaypoint(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((_) async => gWaypointData(id: 7));

      await repository.updateWaypoint(7, domainWaypointDraft());

      verify(
        () => mockDatasource.updateWaypoint(id: 7, input: any(named: 'input')),
      ).called(1);
    });

    // ── Input GQL généré ─────────────────────────────────────────────────────

    test('passe description et title présents quand non vides', () async {
      GWaypointUpdateInput? capturedInput;

      when(
        () => mockDatasource.updateWaypoint(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((inv) async {
        capturedInput =
            inv.namedArguments[const Symbol('input')] as GWaypointUpdateInput;
        return gWaypointData();
      });

      await repository.updateWaypoint(
        1,
        domainWaypointDraft(title: 'Mont Blanc', description: 'Belle vue'),
      );

      expect(capturedInput!.title, Value.present('Mont Blanc'));
      expect(capturedInput!.description, Value.present('Belle vue'));
    });

    test('passe description et title absents quand vides', () async {
      GWaypointUpdateInput? capturedInput;

      when(
        () => mockDatasource.updateWaypoint(
          id: any(named: 'id'),
          input: any(named: 'input'),
        ),
      ).thenAnswer((inv) async {
        capturedInput =
            inv.namedArguments[const Symbol('input')] as GWaypointUpdateInput;
        return gWaypointData();
      });

      await repository.updateWaypoint(
        1,
        domainWaypointDraft(title: '', description: ''),
      );

      expect(capturedInput!.title, const Value.absent());
      expect(capturedInput!.description, const Value.absent());
    });

    // ── Gestion des erreurs ──────────────────────────────────────────────────

    test(
      'retourne Left(ServerFailure) quand le datasource lève une Exception',
      () async {
        when(
          () => mockDatasource.updateWaypoint(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenThrow(Exception('Waypoint introuvable'));

        final result = await repository.updateWaypoint(
          99,
          domainWaypointDraft(),
        );

        expect(result.isLeft(), isTrue);
        expect((result as Left).value, isA<ServerFailure>());
      },
    );

    test(
      'retourne Left(ConnectionFailure) quand une erreur non-Exception est levée',
      () async {
        when(
          () => mockDatasource.updateWaypoint(
            id: any(named: 'id'),
            input: any(named: 'input'),
          ),
        ).thenThrow(StateError('connexion perdue'));

        final result = await repository.updateWaypoint(
          1,
          domainWaypointDraft(),
        );

        expect(result.isLeft(), isTrue);
        expect((result as Left).value, isA<ConnectionFailure>());
      },
    );
  });
}
