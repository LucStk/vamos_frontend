import 'package:domain_core/domain_core.dart';
import 'package:media_application/domain/entities/upload_state.dart';

class UploadStateStore {
  final Map<FileKey, UploadState> store = {};

  void clear() => store.clear();
  UploadState? get(FileKey key) => store[key];
  void upsert(FileKey key, UploadState state) => store[key] = state;
  void remove(FileKey key) => store.remove(key);
}
