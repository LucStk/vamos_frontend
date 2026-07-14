import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';

// Entité minimale pour les tests
class _Item implements HasId {
  @override
  final Id<_Item> id;
  final String name;

  _Item(int value, [this.name = '']) : id = Id<_Item>(value);
}

void main() {
  group('CollectionStore', () {
    late CollectionStore<_Item> store;

    setUp(() {
      store = CollectionStore<_Item>();
    });

    // -------------------------------------------------------------------------
    // insert / get
    // -------------------------------------------------------------------------

    test('insert ajoute un élément récupérable par get', () {
      // arrange
      final item = _Item(1, 'alpha');

      // act
      store.insert(item);

      // assert
      expect(store.get(item.id), equals(item));
    });

    test('get retourne null pour un id inexistant', () {
      // assert
      expect(store.get(Id<_Item>(99)), isNull);
    });

    // -------------------------------------------------------------------------
    // getRequired
    // -------------------------------------------------------------------------

    test('getRequired retourne l\'élément s\'il existe', () {
      // arrange
      final item = _Item(2, 'beta');
      store.insert(item);

      // act
      final result = store.getRequired(item.id);

      // assert
      expect(result, equals(item));
    });

    test('getRequired lève une exception si l\'id est absent', () {
      // assert
      expect(() => store.getRequired(Id<_Item>(99)), throwsException);
    });

    // -------------------------------------------------------------------------
    // update
    // -------------------------------------------------------------------------

    test('update remplace la valeur d\'un élément existant', () {
      // arrange
      final original = _Item(1, 'original');
      store.insert(original);
      final updated = _Item(1, 'modifié');

      // act
      store.update(updated);

      // assert
      expect(store.get(original.id)!.name, equals('modifié'));
    });

    // -------------------------------------------------------------------------
    // remove
    // -------------------------------------------------------------------------

    test('remove supprime un élément existant', () {
      // arrange
      final item = _Item(3, 'gamma');
      store.insert(item);

      // act
      store.remove(item.id);

      // assert
      expect(store.get(item.id), isNull);
    });

    test('remove lève une exception pour un id inexistant', () {
      // assert
      expect(() => store.remove(Id<_Item>(99)), throwsException);
    });

    // -------------------------------------------------------------------------
    // clear
    // -------------------------------------------------------------------------

    test('clear supprime tous les éléments', () {
      // arrange
      store.insert(_Item(1));
      store.insert(_Item(2));

      // act
      store.clear();

      // assert
      expect(store.store, isEmpty);
    });

    // -------------------------------------------------------------------------
    // getIds
    // -------------------------------------------------------------------------

    test('store contient les deux éléments insérés', () {
      // arrange
      final a = _Item(10);
      final b = _Item(20);
      store.insert(a);
      store.insert(b);

      // assert
      expect(store.store.length, 2);
      expect(store.get(a.id), equals(a));
      expect(store.get(b.id), equals(b));
    });

    test('store est vide par défaut', () {
      // assert
      expect(store.store, isEmpty);
    });

    // -------------------------------------------------------------------------
    // getNode / getNodeRequired
    // -------------------------------------------------------------------------

    test('getNode retourne null pour un id inexistant', () {
      // assert
      expect(store.getNode(Id<_Item>(42)), isNull);
    });

    test('getNode retourne un GraphNode pour un élément existant', () {
      // arrange
      final item = _Item(5, 'delta');
      store.insert(item);

      // act
      final node = store.getNode(item.id);

      // assert
      expect(node, isNotNull);
      expect(node!.value, equals(item));
    });

    test('getNodeRequired lève une exception si l\'id est absent', () {
      // assert
      expect(() => store.getNodeRequired(Id<_Item>(99)), throwsException);
    });
  });
}
