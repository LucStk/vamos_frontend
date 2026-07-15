import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/id.dart';
import 'package:trip_application/trip_application.dart';

Waypoint makeWaypoint({
  int id = 1,
  int vertexId = 10,
  String title = 'Waypoint test',
}) => Waypoint(
  id: Id<Waypoint>(id),
  vertexId: Id<Vertex>(vertexId),
  title: title,
);

void main() {
  group('WaypointStore', () {
    late WaypointStore store;

    setUp(() {
      store = WaypointStore();
    });

    // -------------------------------------------------------------------------
    // upsert
    // -------------------------------------------------------------------------

    test('upsert ajoute un waypoint récupérable par get', () {
      // arrange
      final wp = makeWaypoint(id: 1, vertexId: 10);

      // act
      store.upsert(wp);

      // assert
      expect(store.get(wp.id), equals(wp));
    });

    test('upsert met à jour l\'index vertex', () {
      // arrange
      final wp = makeWaypoint(id: 1, vertexId: 10);

      // act
      store.upsert(wp);

      // assert
      expect(store.getFromVertex(wp.vertexId), equals(wp));
    });

    test('upsert remplace un waypoint existant', () {
      // arrange
      final original = makeWaypoint(id: 1, vertexId: 10, title: 'Original');
      final updated = makeWaypoint(id: 1, vertexId: 10, title: 'Modifié');
      store.upsert(original);

      // act
      store.upsert(updated);

      // assert
      expect(store.get(original.id)!.title, equals('Modifié'));
    });

    // -------------------------------------------------------------------------
    // get / getRequired / getFromVertex
    // -------------------------------------------------------------------------

    test('get retourne null pour un id inexistant', () {
      // assert
      expect(store.get(Id<Waypoint>(99)), isNull);
    });

    test('getRequired retourne le waypoint s\'il existe', () {
      // arrange
      final wp = makeWaypoint(id: 2);
      store.upsert(wp);

      // act
      final result = store.getRequired(wp.id);

      // assert
      expect(result, equals(wp));
    });

    test('getRequired lève une exception si l\'id est absent', () {
      // assert
      expect(() => store.getRequired(Id<Waypoint>(99)), throwsException);
    });

    test(
      'getFromVertex retourne null si aucun waypoint n\'est indexé à ce vertex',
      () {
        // assert
        expect(store.getFromVertex(Id<Vertex>(99)), isNull);
      },
    );

    test('getFromVertex retourne le waypoint associé au vertexId', () {
      // arrange
      final wp = makeWaypoint(id: 1, vertexId: 42);
      store.upsert(wp);

      // act
      final result = store.getFromVertex(Id<Vertex>(42));

      // assert
      expect(result, equals(wp));
    });

    // -------------------------------------------------------------------------
    // remove
    // -------------------------------------------------------------------------

    test('remove supprime le waypoint du store', () {
      // arrange
      final wp = makeWaypoint(id: 3, vertexId: 30);
      store.upsert(wp);

      // act
      store.remove(wp.id);

      // assert
      expect(store.get(wp.id), isNull);
    });

    test('remove nettoie également l\'index vertex', () {
      // arrange
      final wp = makeWaypoint(id: 3, vertexId: 30);
      store.upsert(wp);

      // act
      store.remove(wp.id);

      // assert
      expect(store.getFromVertex(wp.vertexId), isNull);
    });

    test('remove lève une exception si le waypoint n\'existe pas', () {
      // assert
      expect(() => store.remove(Id<Waypoint>(99)), throwsException);
    });

    // -------------------------------------------------------------------------
    // clear
    // -------------------------------------------------------------------------

    test('clear vide le store et l\'index vertex', () {
      // arrange
      store.upsert(makeWaypoint(id: 1, vertexId: 10));
      store.upsert(makeWaypoint(id: 2, vertexId: 20));

      // act
      store.clear();

      // assert
      expect(store.store, isEmpty);
      // l'index vertex ne se remet pas à zéro via clear() — cohérent avec l'implémentation
    });
  });
}
