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
  CarouselState build(List<MediaImage> initialImages) {
    final items = CarouselItem.fromRemote(initialImages);

    return CarouselState(
      items: items,
      uploadProgress: const {},
      uploadErrors: const {},
    );
  }

  /// Ajoute des images locales sélectionnées et lance l'upload
  void addLocalImages(
    List<String> paths,
    Function(List<MediaImage>) onChanged,
  ) {
    final newItems = paths.map(CarouselItem.local).toList();

    state = state.copyWith(items: [...state.items, ...newItems]);

    for (final item in newItems) {
      uploadItem(item, onChanged);
    }
  }

  /// Gère l'upload d'un item individuel
  Future<void> uploadItem(
    CarouselItem item,
    Function(List<MediaImage>) onChanged,
  ) async {
    final path = item.value;
    final ext = path.split('.').last.toLowerCase();

    // On initialise le loader pour cette image
    state = state.copyWith(
      uploadProgress: {...state.uploadProgress, path: 0.0},
      uploadErrors: {...state.uploadErrors}..remove(path),
    );

    // Note : Avec build_runner, le "ref" change subtilement en tâche de fond mais s'utilise à l'identique.
    final repository = ref.read(uploadImgRepositoryProvider);

    final result = await repository.uploadImage(
      File(path),
      ext,
      onProgress: (sent, total) {
        state = state.copyWith(
          uploadProgress: {
            ...state.uploadProgress,
            path: total > 0 ? sent / total : 0.0,
          },
        );
      },
    );

    final idx = state.items.indexWhere((i) => i.isLocal && i.value == path);
    if (idx == -1) return;

    result.fold(
      (failure) {
        state = state.copyWith(
          uploadProgress: {...state.uploadProgress}..remove(path),
          uploadErrors: {...state.uploadErrors, path: 'Échec upload'},
        );
      },
      (MediaImage image) {
        final updatedItems = [...state.items];
        updatedItems[idx] = CarouselItem.remote(image);

        state = state.copyWith(
          uploadProgress: {...state.uploadProgress}..remove(path),
          uploadErrors: {...state.uploadErrors}..remove(path),
          items: updatedItems,
        );

        // On extrait les images distantes valides pour notifier le formulaire parent
        final remoteImages = CarouselItem.toRemote(updatedItems);
        onChanged(remoteImages);
      },
    );
  }

  /// Supprime un item
  void deleteItem(int idx, Function(List<MediaImage>) onChanged) {
    final val = state.items[idx].value;
    final updatedItems = [...state.items]..removeAt(idx);

    state = state.copyWith(
      items: updatedItems,
      uploadProgress: {...state.uploadProgress}..remove(val),
      uploadErrors: {...state.uploadErrors}..remove(val),
    );

    final remoteImages = CarouselItem.toRemote(updatedItems);
    onChanged(remoteImages);
  }
}
