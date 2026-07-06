// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/commands/commands.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/graph_store.dart';
part 'topology_handler.g.dart';

@riverpod
TopologyHandler topologyHandler(Ref ref, TripId tripId) {
  final store = ref.read(rawGraphStoreProvider);
  final patchStore = ref.read(rawGraphPatchStoreProvider);
  final vertexRepo = ref.read(vertexRepositoryProvider);
  final segmentRepo = ref.read(segmentRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  return TopologyHandler(
    tripId,
    store,
    patchStore,
    segmentRepo,
    vertexRepo,
    executor,
  );
}
