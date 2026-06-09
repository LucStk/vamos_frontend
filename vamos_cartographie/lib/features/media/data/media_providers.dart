import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/injection.dart";

import "media_remote_datasource.dart";
import "media_repository.dart";

final mediaRemoteDatasourceProvider = Provider<MediaRemoteDatasource>((ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
});
final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  return MediaRepository(
    remote: ref.watch(mediaRemoteDatasourceProvider),
    storage: ref.watch(storageDatasourceProvider),
  );
});
