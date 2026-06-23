import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:media_application/patches/media_patch_store.dart';
import 'package:media_application/read_models/image_ui_model.dart';
import "package:trip_domain/trip_domain.dart";

abstract interface class ImageResolver<T> {
  T resolve(ImageUiModel image);
}

class ImagesProjector {
  final MediaStore store;
  final MediaPatchStore patches;
  ImagesProjector({required this.store, required this.patches});

  List<ImageUiModel> project(Id id) {
    final patch = patches.get(key);
    late ImageLocation imageLocation;
    if (patch != null) {
      imageLocation = LocalPath(patch.file);
    } else {
      final image = store.get(id, key);
      imageLocation = RemoteUrl(image.url);
    }

    return ImageUiModel(fileKey: key, imageLocation: imageLocation);
  }
}
