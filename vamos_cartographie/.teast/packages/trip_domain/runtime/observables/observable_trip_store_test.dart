import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/id.dart';
import 'package:trip_application/trip_application.dart';

Trip makeTrip({int id = 1, String title = 'Voyage'}) =>
    Trip(id: Id<Trip>(id), title: title);

void main() {
  group('ObservableTripStore', () {
    late ObservableTripStore store;

    setUp(() {
      store = ObservableTripStore();
    });

    // -------------------------------------------------------------------------
    // upsert notifie
    // -------------------------------------------------------------------------

    test('upsert notifie les listeners', () {
      // arrange
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.upsert(makeTrip(id: 1));

      // assert
      expect(callCount, 1);
    });

    test('upsert stocke correctement le trip', () {
      // arrange
      final trip = makeTrip(id: 1, title: 'Tour de Bretagne');

      // act
      store.upsert(trip);

      // assert
      expect(store.get(trip.id), equals(trip));
    });

    // -------------------------------------------------------------------------
    // remove notifie
    // -------------------------------------------------------------------------

    test('remove notifie les listeners', () {
      // arrange
      store.upsert(makeTrip(id: 1));
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.remove(Id<Trip>(1));

      // assert
      expect(callCount, 1);
    });

    test('remove supprime le trip du store', () {
      // arrange
      final trip = makeTrip(id: 2);
      store.upsert(trip);

      // act
      store.remove(trip.id);

      // assert
      expect(store.get(trip.id), isNull);
    });

    // -------------------------------------------------------------------------
    // clear notifie
    // -------------------------------------------------------------------------

    test('clear notifie les listeners', () {
      // arrange
      store.upsert(makeTrip(id: 1));
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.clear();

      // assert
      expect(callCount, 1);
    });

    test('clear vide le store', () {
      // arrange
      store.upsert(makeTrip(id: 1));
      store.upsert(makeTrip(id: 2));

      // act
      store.clear();

      // assert
      expect(store.store, isEmpty);
    });

    // -------------------------------------------------------------------------
    // removeListener
    // -------------------------------------------------------------------------

    test('removeListener empêche les notifications ultérieures', () {
      // arrange
      int callCount = 0;
      void listener() => callCount++;
      store.addListener(listener);
      store.removeListener(listener);

      // act
      store.upsert(makeTrip(id: 1));

      // assert
      expect(callCount, 0);
    });
  });
}
