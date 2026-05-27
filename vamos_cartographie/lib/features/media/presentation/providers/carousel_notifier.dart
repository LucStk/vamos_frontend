import 'dart:io';
// 1. Remplacement de l'import pur riverpod par l'annotation et ajout du fichier .g.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/media/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
// REQUIS : Remplacez 'carousel_notifier' par le nom exact de votre fichier .dart
part 'carousel_notifier.g.dart';

@riverpod
class CarouselNotifier extends _$CarouselNotifier {
  @override
  CarouselState build(String carouselId) {
    return const CarouselState();
  }

  void initialize(List<MediaImage> images) {
    if (state.items.isNotEmpty) return;
    state = CarouselState.fromRemote(images);
  }

  // ─────────────────────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────────────────────

  void _updateItem(
    String fileKey,
    CarouselItem Function(CarouselItem item) update,
  ) {
    final index = state.items.indexWhere((i) => i.fileKey == fileKey);
    if (index == -1) return;
    final updatedItems = List<CarouselItem>.from(state.items);
    updatedItems[index] = update(updatedItems[index]);
    state = state.copyWith(items: updatedItems);
  }

  void _replaceItem(String fileKey, CarouselItem newItem) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.fileKey != fileKey) return item;
        return newItem;
      }).toList(),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Public API
  // ─────────────────────────────────────────────────────────────

  void addLocalImages(List<String> paths) {
    final newItems = paths
        .map((path) => CarouselItem.local(fileKey: path))
        .toList();
    state = state.copyWith(items: [...state.items, ...newItems]);

    for (final item in newItems) {
      uploadItem(item);
    }
  }

  Future<void> uploadItem(CarouselItem item) async {
    if (!item.isLocal) return;

    final path = item.fileKey;

    final ext = path.split('.').last.toLowerCase();

    _updateItem(
      path,
      (item) => item.copyWith(
        uploadStatus: UploadStatus.uploading,
        progress: 0,
        error: null,
      ),
    );

    final repository = ref.read(uploadImgRepositoryProvider);

    final result = await repository.uploadImage(
      File(path),
      ext,
      onProgress: (sent, total) {
        if (!ref.mounted) return;

        _updateItem(
          path,
          (item) => item.copyWith(progress: total > 0 ? sent / total : 0),
        );
      },
    );

    if (!ref.mounted) return;

    final stillExists = state.items.any((i) => i.isLocal && i.fileKey == path);

    if (!stillExists) return;

    result.fold(
      (failure) {
        _updateItem(
          path,
          (item) => item.copyWith(
            uploadStatus: UploadStatus.failure,
            error: "Échec upload",
          ),
        );
      },
      (MediaImage image) {
        _replaceItem(path, CarouselItem.remote(image: image));
      },
    );
  }

  void retryUpload(CarouselItem item) {
    uploadItem(item);
  }

  void deleteItem(CarouselItem item) {
    state = state.copyWith(
      items: state.items.where((i) => i.fileKey != item.fileKey).toList(),
    );
  }
}
