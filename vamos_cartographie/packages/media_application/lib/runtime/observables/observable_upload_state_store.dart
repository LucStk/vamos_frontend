import '/runtime/upload_state_store.dart';

import 'package:domain_core/domain_core.dart';
import 'package:media_application/domain/domain.dart';

class ObservableUploadStateStore extends UploadStateStore with Observable {
  @override
  void upsert(FileKey key, UploadState state) {
    super.upsert(key, state);
    notify();
  }

  @override
  void remove(FileKey key) {
    super.remove(key);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
