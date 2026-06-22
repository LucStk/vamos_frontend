import 'dart:io';

import 'package:domain_core/media.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:media_application/patches/media_patch_store.dart';
import 'package:trip_domain/application/repositories/media_repository.dart';
import 'package:trip_domain/trip_domain.dart';

class ImagesHandler {
  MediaPatchStore patchStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;

  ImagesHandler(this.patchStore, this.executor, this.mediaServices);

  void addImageToTrip(FileKey key, File file, TripId tripId) async {
    await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(key, file),
      remote: () => mediaServices.uploadAndAttachToTrip(file, tripId),
      onSuccess: (MediaImage server) => patchStore.remove(server.fileKey),
      onError: () {},
    );
  }

  void addImageToWaypoint(FileKey key, File file, WaypointId id) async {
    await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(key, file),
      remote: () => mediaServices.uploadAndAttachToWaypoint(file, id),
      onSuccess: (MediaImage server) => patchStore.remove(server.fileKey),
      onError: () {},
    );
  }
}
