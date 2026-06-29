import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:domain_core/observable.dart';
import 'package:media_application/domain/entities/patch_image.dart';
import 'package:media_application/runtime/media_patch_store.dart';

class ObservableMediaPatchStore extends MediaPatchStore with Observable {
  @override
  void upsert(Id id, PatchImageMedia patch) {
    super.upsert(id, patch);
    notify();
  }

  @override
  void remove(Id id, FileKey key) {
    super.remove(id, key);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
