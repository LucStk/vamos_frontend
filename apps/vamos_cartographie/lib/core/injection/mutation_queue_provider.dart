import 'package:domain_core/id.dart';
import 'package:domain_core/runtime/mutation_queue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "mutation_queue_provider.g.dart";

@riverpod
MutationQueue mutationQueue(Ref ref) {
  return MutationQueue<Id>();
}
