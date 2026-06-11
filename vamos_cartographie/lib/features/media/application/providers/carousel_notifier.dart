import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/media/application/controllers/upload_carousel_commands.dart';
import 'package:vamos_cartographie/features/media/application/controllers/upload_controller.dart';
import 'package:vamos_cartographie/features/media/application/providers/media_providers.dart';

import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

part 'carousel_notifier.g.dart';

@riverpod
class CarouselNotifier extends _$CarouselNotifier {
  UploadCarouselImageController get _upload =>
      ref.read(uploadCarouselImageControllerProvider);

  @override
  CarouselState build(String carouselId) {
    return const CarouselState();
  }
  // ─────────────────────────────────────────────────────────────
  // Initialization
  // ─────────────────────────────────────────────────────────────

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
    final newItems = paths.map((p) => CarouselItem.local(fileKey: p)).toList();
    state = state.copyWith(items: [...state.items, ...newItems]);
    for (final item in newItems) {
      _uploadItem(item);
    }
  }

  Future<void> _uploadItem(CarouselItem item) async {
    if (!item.isLocal) return;

    final path = item.fileKey;
    final ext = path.split('.').last.toLowerCase();

    _updateItem(
      path,
      (i) => i.copyWith(
        uploadStatus: UploadStatus.uploading,
        progress: 0,
        error: null,
      ),
    );

    try {
      final image = await _upload(
        UploadCarouselImageCommand(
          file: File(path),
          type: ext,
          onProgress: (progress) {
            if (!ref.mounted) return;

            _updateItem(path, (i) => i.copyWith(progress: progress));
          },
        ),
      );

      if (!ref.mounted) return;

      _replaceItem(path, CarouselItem.remote(image: image));
    } catch (e) {
      if (!ref.mounted) return;

      _updateItem(
        path,
        (i) =>
            i.copyWith(uploadStatus: UploadStatus.failure, error: e.toString()),
      );
    }
  }

  void retryUpload(CarouselItem item) {
    _uploadItem(item);
  }

  void deleteItem(CarouselItem item) {
    state = state.copyWith(
      items: state.items.where((i) => i.fileKey != item.fileKey).toList(),
    );
  }
}
