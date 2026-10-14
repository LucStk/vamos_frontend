// mode_machine/command.dart
import 'package:dartz/dartz.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:map_engine/src/mode_machine/effect/handler_registry.dart';
import 'package:map_engine/src/mode_machine/effect/results.dart';

abstract class Command<R extends Object, H extends CommandScope> {
  const Command();

  Future<R?> handle(H handler);

  Future<R?> run(HandlerRegistry registry) {
    final h = registry.maybeOf<H>();
    if (h == null) {
      assert(false, '$runtimeType: $H indisponible dans le mode courant');
      return Future.value(null);
    }
    return handle(h);
  }
}

Future<Done?> done<F, T>(Future<Either<F, T>> Function() action) async =>
    (await action()).fold((_) => null, (_) => const Done());

Future<T?> valueOrNull<F, T>(Future<Either<F, T>> future) async =>
    (await future).fold((_) => null, (v) => v);
