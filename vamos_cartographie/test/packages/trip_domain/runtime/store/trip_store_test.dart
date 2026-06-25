import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/id.dart';
import 'package:trip_domain/trip_domain.dart';

Trip makeTrip({int id = 1, String title = 'Voyage test'}) =>
    Trip(id: Id<Trip>(id), title: title);

void main() {
  group('TripStore', () {
    late TripStore store;

    setUp(() {
      store = TripStore();
    });

    // -------------------------------------------------------------------------
    // upsert
    // -------------------------------------------------------------------------

    test('upsert ajoute un nouveau trip récupérable par get', () {
      // arrange
      final trip = makeTrip(id: 1);

      // act
      store.upsert(trip);

      // assert
      expect(store.get(trip.id), equals(trip));
    });

    test('upsert remplace un trip existant avec le même id', () {
      // arrange
      final original = makeTrip(id: 1, title: 'Original');
      final updated = makeTrip(id: 1, title: 'Modifié');
      store.upsert(original);

      // act
      store.upsert(updated);

      // assert
      expect(store.get(original.id)!.title, equals('Modifié'));
    });

    // -------------------------------------------------------------------------
    // get
    // -------------------------------------------------------------------------

    test('get retourne null pour un id inexistant', () {
      // assert
      expect(store.get(Id<Trip>(99)), isNull);
    });

    test('get retourne le trip pour un id existant', () {
      // arrange
      final trip = makeTrip(id: 2, title: 'Tour de France');
      store.upsert(trip);

      // act
      final result = store.get(trip.id);

      // assert
      expect(result, equals(trip));
    });

    // -------------------------------------------------------------------------
    // getRequired
    // -------------------------------------------------------------------------

    test('getRequired retourne le trip s\'il existe', () {
      // arrange
      final trip = makeTrip(id: 3);
      store.upsert(trip);

      // act
      final result = store.getRequired(trip.id);

      // assert
      expect(result, equals(trip));
    });

    test('getRequired lève une exception si l\'id est absent', () {
      // assert
      expect(() => store.getRequired(Id<Trip>(99)), throwsException);
    });

    // -------------------------------------------------------------------------
    // remove
    // -------------------------------------------------------------------------

    test('remove supprime un trip existant', () {
      // arrange
      final trip = makeTrip(id: 4);
      store.upsert(trip);

      // act
      store.remove(trip.id);

      // assert
      expect(store.get(trip.id), isNull);
    });

    test('remove sur un id inexistant ne lève pas d\'exception', () {
      // assert — le TripStore.remove appelle simplement Map.remove qui est no-op
      expect(() => store.remove(Id<Trip>(99)), returnsNormally);
    });

    // -------------------------------------------------------------------------
    // clear
    // -------------------------------------------------------------------------

    test('clear supprime tous les trips', () {
      // arrange
      store.upsert(makeTrip(id: 1));
      store.upsert(makeTrip(id: 2));

      // act
      store.clear();

      // assert
      expect(store.store, isEmpty);
    });

    test('get retourne null après clear', () {
      // arrange
      final trip = makeTrip(id: 1);
      store.upsert(trip);

      // act
      store.clear();

      // assert
      expect(store.get(trip.id), isNull);
    });
  });
}
