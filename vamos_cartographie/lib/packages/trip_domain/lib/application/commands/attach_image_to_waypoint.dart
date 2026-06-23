import 'package:domain_core/media.dart';
import 'package:trip_domain/application/repositories/waypoint_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/runtime/store/media_store.dart';

class AttachImageToWaypoint {
  MediaStore store;
  WaypointRepository repo;

  AttachImageToWaypoint(this.store, this.repo);

  Future<void> call(WaypointId id, FileKey key) async {
    final result = await repo.attachImageToWaypoint(id, key);

    result.fold(
      (f) => throw Exception(f.message),
      (image) => store.upsert(id, image),
    );
  }
}
