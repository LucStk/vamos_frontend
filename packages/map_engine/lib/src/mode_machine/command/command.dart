// mode_machine/command.dart
import 'package:dartz/dartz.dart';

import '../effect/results.dart';
import 'handler_registry.dart';

abstract class Command<R extends Object, H> {
  const Command();

  Future<R?> handle(H handler);

  /// Appelé par le runner : H est connu ici, pas dans le runner.
  Future<R?> run(HandlerRegistry registry) => handle(registry.of<H>());
}

Future<Done?> done<F, T>(Future<Either<F, T>> Function() action) async =>
    (await action()).fold((_) => null, (_) => const Done());

Future<T?> valueOrNull<F, T>(Future<Either<F, T>> future) async =>
    (await future).fold((_) => null, (v) => v);
