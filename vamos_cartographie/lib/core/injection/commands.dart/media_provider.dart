import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/dio_media_provider.dart';
import "/core/injection/client_provider.dart";
import '/infrastructure/media/media.dart';

part 'media_provider.g.dart';

@riverpod
MediaRemoteDatasource mediaRemoteDatasource(Ref ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
MediaRepository mediaRepository(Ref ref) {
  final datasource = ref.watch(mediaRemoteDatasourceProvider);
  final dioMedia = ref.watch(dioMediaProvider);
  return MediaRepositoryImpl(remote: datasource, storage: dioMedia);
}
