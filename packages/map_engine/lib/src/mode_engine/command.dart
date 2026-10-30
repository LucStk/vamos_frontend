// mode_machine/command.dart
import 'package:dartz/dartz.dart';
import 'package:map_engine/src/mode_engine/effect/effect.dart';
import 'package:map_engine/src/mode_engine/app_scope.dart';
import 'package:map_engine/src/mode_engine/effect/results.dart';

abstract class Command<R extends Object> {
  const Command();

  Future<R?> handle(AppCommandScope handler);

  Future<R?> run(HandlerRegistry registry) {
    final h = registry.maybeOf<AppCommandScope>();
    if (h == null) {
      assert(false, '$runtimeType: AppCommandScope indisponible');
      return Future.value(null);
    }
    return handle(h);
  }
}

Future<Done?> done<F, T>(Future<Either<F, T>> Function() action) async =>
    (await action()).fold((_) => null, (_) => const Done());

Future<T?> valueOrNull<F, T>(Future<Either<F, T>> future) async =>
    (await future).fold((_) => null, (v) => v);
