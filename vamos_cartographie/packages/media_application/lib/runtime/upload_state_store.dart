import 'package:media_application/domain/domain.dart';

class UploadStateStore {
  final Map<FileKey, UploadState> store = {};

  void clear() => store.clear();
  UploadState? get(FileKey key) => store[key];
  void upsert(FileKey key, UploadState state) => store[key] = state;
  void remove(FileKey key) => store.remove(key);
}
