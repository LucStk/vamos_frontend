import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/stored_file/injection/stored_file_provider.dart';
import '/topology/injection/injection.dart';

part 'stored_file_queries.g.dart';

@riverpod
GraphNode<StoredFileFields> storedFileNode(Ref ref, StoredFileId fileId) {
  final store = ref.watch(storedFileStoreProvider);
  final node = store.storedFileStore.get(fileId);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentNode", resourceId: "$fileId"),
    );
  }
  return node;
}

@riverpod
StoredFileFields storeFile(Ref ref, StoredFileFields fileId) {
  final node = ref.watch(storedFileNodeProvider(fileId));
  return node.current;
}
