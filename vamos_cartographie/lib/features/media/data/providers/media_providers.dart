import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/features/media/data/data.dart";
import "package:vamos_cartographie/core/injection/injection.dart";

part "media_providers.g.dart";

@riverpod
MediaRemoteDatasource mediaRemoteDatasource(Ref ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
MediaRepository mediaRepository(Ref ref) {
  return MediaRepository(
    remote: ref.watch(mediaRemoteDatasourceProvider),
    storage: ref.watch(storageDatasourceProvider),
  );
}
