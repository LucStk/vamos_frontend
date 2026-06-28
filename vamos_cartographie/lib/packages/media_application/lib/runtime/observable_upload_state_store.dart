import 'package:domain_core/media.dart';
import 'package:domain_core/observable.dart';
import '/domain/entities/upload_state.dart';
import '/runtime/upload_state_store.dart';

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
