import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';

void main() {
  group('OptimisticExecutor', () {
    late OptimisticExecutor executor;

    setUp(() {
      executor = OptimisticExecutor();
    });

    // -------------------------------------------------------------------------
    // Ordre d'exécution
    // -------------------------------------------------------------------------

    test('onApply est appelé avant la réponse remote', () async {
      // arrange
      final log = <String>[];

      // act
      await executor.run<String>(
        onApply: () => log.add('apply'),
        remote: () async {
          log.add('remote');
          return const Right('ok');
        },
        onSuccess: (_) => log.add('success'),
        onError: () => log.add('error'),
      );

      // assert
      expect(log.first, 'apply');
      expect(log[1], 'remote');
    });

    // -------------------------------------------------------------------------
    // Cas nominal (Right)
    // -------------------------------------------------------------------------

    test(
      'onSuccess est appelé avec la valeur retournée par remote sur Right',
      () async {
        // arrange
        String? received;

        // act
        await executor.run<String>(
          onApply: () {},
          remote: () async => const Right('résultat'),
          onSuccess: (v) => received = v,
          onError: () => fail('onError ne doit pas être appelé'),
        );

        // assert
        expect(received, 'résultat');
      },
    );

    test('séquence complète en cas de succès: apply → success', () async {
      // arrange
      final log = <String>[];

      // act
      await executor.run<int>(
        onApply: () => log.add('apply'),
        remote: () async => const Right(42),
        onSuccess: (v) => log.add('success:$v'),
        onError: () => log.add('error'),
      );

      // assert
      expect(log, ['apply', 'success:42']);
    });

    // -------------------------------------------------------------------------
    // Cas d'erreur (Left)
    // -------------------------------------------------------------------------

    test('onError est appelé quand remote retourne Left', () async {
      // arrange
      bool errorCalled = false;

      // act
      await executor.run<String>(
        onApply: () {},
        remote: () async => Left(ServerFailure('erreur réseau')),
        onSuccess: (_) => fail('onSuccess ne doit pas être appelé'),
        onError: () => errorCalled = true,
      );

      // assert
      expect(errorCalled, true);
    });

    test('séquence complète en cas d\'erreur: apply → error', () async {
      // arrange
      final log = <String>[];

      // act
      await executor.run<int>(
        onApply: () => log.add('apply'),
        remote: () async => Left(ServerFailure('échec')),
        onSuccess: (_) => log.add('success'),
        onError: () => log.add('error'),
      );

      // assert
      expect(log, ['apply', 'error']);
    });

    test('onSuccess n\'est pas appelé en cas d\'erreur', () async {
      // arrange
      bool successCalled = false;

      // act
      await executor.run<String>(
        onApply: () {},
        remote: () async => Left(ConnectionFailure()),
        onSuccess: (_) => successCalled = true,
        onError: () {},
      );

      // assert
      expect(successCalled, false);
    });
  });
}
