import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/application/repositories/attachable_media_repository.dart';
import 'package:trip_domain/runtime/store/media_store.dart';

class AttachImageToEntity {
  final MediaStore store;
  final AttachableMediaRepository repo;

  AttachImageToEntity(this.store, this.repo);

  Future<void> call(Id id, FileKey key) async {
    final result = await repo.attachImage(id, key);
    result.fold(
      (f) => throw Exception(f.message),
      (image) => store.upsert(id, image),
    );
  }
}
