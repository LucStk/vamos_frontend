import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/id.dart';

class _A {}

class _B {}

void main() {
  group('Id', () {
    test('deux Id de même type et valeur sont égaux', () {
      // arrange
      final a = Id<_A>(1);
      final b = Id<_A>(1);

      // assert
      expect(a, equals(b));
    });

    test(
      'deux Id de types différents ne sont pas égaux même avec la même valeur',
      () {
        // arrange
        final a = Id<_A>(1);
        final b = Id<_B>(1);

        // assert
        expect(a, isNot(equals(b)));
      },
    );

    test('deux Id de même type mais valeurs différentes ne sont pas égaux', () {
      // arrange
      final a = Id<_A>(1);
      final b = Id<_A>(2);

      // assert
      expect(a, isNot(equals(b)));
    });

    test('hashCode identique pour deux Id égaux', () {
      // arrange
      final a = Id<_A>(42);
      final b = Id<_A>(42);

      // assert
      expect(a.hashCode, equals(b.hashCode));
    });

    test(
      'hashCode différent pour des Id de types différents à valeur identique',
      () {
        // arrange
        final a = Id<_A>(1);
        final b = Id<_B>(1);

        // assert
        expect(a.hashCode, isNot(equals(b.hashCode)));
      },
    );

    test('toString contient la valeur de l\'Id', () {
      // arrange
      final id = Id<_A>(7);

      // assert
      expect(id.toString(), contains('7'));
    });

    test('value expose la valeur entière passée au constructeur', () {
      // arrange
      final id = Id<_A>(123);

      // assert
      expect(id.value, 123);
    });
  });
}
