import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "mutation_queue_provider.g.dart";

@Riverpod(keepAlive: true)
MutationQueue mutationQueue(Ref ref) {
  return MutationQueue<Id>();
}
