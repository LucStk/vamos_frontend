import 'dart:io';

import 'package:domain_core/media.dart';
import 'package:media_application/patches/patch_image.dart';

class MediaPatchStore {
  final Map<FileKey, PatchImageMedia> patchImages = {};
  MediaPatchStore();

  void clear() {
    patchImages.clear();
  }

  PatchImageMedia? get(FileKey key) => patchImages[key];

  PatchImageMedia getRequired(FileKey key) {
    var r = get(key);
    if (r == null) {
      throw Exception("Image $key not found in store");
    }
    return r;
  }

  void upsert(FileKey key, File file) {
    patchImages[key] = PatchImageMedia(fileKey: key, file: file);
  }

  void remove(FileKey key) {
    PatchImageMedia? patchImage = patchImages.remove(key);
    if (patchImage == null) {
      throw Exception("No id to remove");
    }
  }
}
