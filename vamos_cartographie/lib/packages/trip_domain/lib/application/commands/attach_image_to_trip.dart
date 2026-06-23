import 'package:domain_core/media.dart';
import 'package:trip_domain/application/repositories/trip_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/runtime/store/media_store.dart';

class AttachImageToTrip {
  MediaStore store;
  TripRepository repo;

  AttachImageToTrip(this.store, this.repo);

  Future<void> call(TripId id, FileKey key) async {
    final result = await repo.attachImageToTrip(id, key);

    result.fold(
      (f) => throw Exception(f.message),
      (image) => store.upsert(id, image),
    );
  }
}
