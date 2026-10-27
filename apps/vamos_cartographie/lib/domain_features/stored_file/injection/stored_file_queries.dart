import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/stored_file_provider.dart';

part 'stored_file_queries.g.dart';

@Riverpod(keepAlive: true)
GraphNode<StoredFileFields> storedFileNode(Ref ref, StoredFileId fileId) {
  final node = ref.watch(
    storedFileStoreProvider.select((s) => s.storedFileStore.get(fileId)),
  );
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "segmentNode", resourceId: "$fileId"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
StoredFileFields storeFile(Ref ref, StoredFileId fileId) {
  return ref.watch(storedFileNodeProvider(fileId).select((e) => e.current));
}

@Riverpod(keepAlive: true)
List<StoredFileFields> tripImages(Ref ref, TripId tripId) {
  final listIds = ref.watch(
    storedFileStoreProvider.select((e) => e.getFromOwner(tripId)),
  );
  return listIds.map((s) => ref.watch(storeFileProvider(s))).toList();
}
