import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';

class _Item implements HasId {
  @override
  final Id<_Item> id;

  _Item(int v) : id = Id<_Item>(v);
}

void main() {
  group('ObservableCollectionStore', () {
    late ObservableCollectionStore<_Item> store;

    setUp(() {
      store = ObservableCollectionStore<_Item>();
    });

    // -------------------------------------------------------------------------
    // insert
    // -------------------------------------------------------------------------

    test('insert notifie les listeners', () {
      // arrange
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.insert(_Item(1));

      // assert
      expect(callCount, 1);
    });

    test('insert multiple éléments notifie à chaque appel', () {
      // arrange
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.insert(_Item(1));
      store.insert(_Item(2));

      // assert
      expect(callCount, 2);
    });

    // -------------------------------------------------------------------------
    // remove
    // -------------------------------------------------------------------------

    test('remove notifie les listeners', () {
      // arrange
      store.insert(_Item(1));
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.remove(Id<_Item>(1));

      // assert
      expect(callCount, 1);
    });

    // -------------------------------------------------------------------------
    // clear
    // -------------------------------------------------------------------------

    test('clear notifie les listeners', () {
      // arrange
      store.insert(_Item(1));
      store.insert(_Item(2));
      int callCount = 0;
      store.addListener(() => callCount++);

      // act
      store.clear();

      // assert
      expect(callCount, 1);
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
      store.insert(_Item(1));

      // assert
      expect(callCount, 0);
    });

    test('plusieurs listeners sont tous notifiés', () {
      // arrange
      int countA = 0;
      int countB = 0;
      store.addListener(() => countA++);
      store.addListener(() => countB++);

      // act
      store.insert(_Item(1));

      // assert
      expect(countA, 1);
      expect(countB, 1);
    });

    // -------------------------------------------------------------------------
    // cohérence avec CollectionStore
    // -------------------------------------------------------------------------

    test('les données sont bien stockées après insert', () {
      // arrange
      final item = _Item(42);

      // act
      store.insert(item);

      // assert
      expect(store.get(item.id), equals(item));
    });

    test('les données sont supprimées après remove', () {
      // arrange
      final item = _Item(5);
      store.insert(item);

      // act
      store.remove(item.id);

      // assert
      expect(store.get(item.id), isNull);
    });

    test('le store est vide après clear', () {
      // arrange
      store.insert(_Item(1));

      // act
      store.clear();

      // assert
      expect(store.getIds(), isEmpty);
    });
  });
}
