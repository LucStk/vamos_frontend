import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/features/media/data/data.dart";
import "package:vamos_cartographie/core/injection/injection.dart";

part "media_provider.g.dart";

final mediaRemoteDatasourceProvider = Provider<MediaRemoteDatasource>((ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
});
final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  return MediaRepository(
    remote: ref.watch(mediaRemoteDatasourceProvider),
    storage: ref.watch(storageDatasourceProvider),
  );
});
@riverpod
MediaService mediaService(Ref ref) {
  return MediaService(ref.read(mediaRepositoryProvider));
}
