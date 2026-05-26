import 'dart:io';
// 1. Remplacement de l'import pur riverpod par l'annotation et ajout du fichier .g.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/trip_image.dart';
import '../carousel_state.dart';
import '../carousel_item.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/upload_img_repository.dart';
// REQUIS : Remplacez 'carousel_notifier' par le nom exact de votre fichier .dart
part 'carousel_notifier.g.dart';

@riverpod
class CarouselNotifier extends _$CarouselNotifier {
  @override
  CarouselState build() => const CarouselState();

  /// Initialise les images distantes au chargement du widget
  void initImages(List<TripImage> remoteImages) {
    if (state.items.isEmpty && remoteImages.isNotEmpty) {
      state = CarouselState(
        items: remoteImages.map(CarouselItem.remote).toList(),
      );
    }
  }

  /// Ajoute des images locales sélectionnées et lance l'upload
  void addLocalImages(List<String> paths, Function(List<TripImage>) onChanged) {
    final newItems = paths.map(CarouselItem.local).toList();

    state = state.copyWith(items: [...state.items, ...newItems]);

    for (final item in newItems) {
      uploadItem(item, onChanged);
    }
  }

  /// Gère l'upload d'un item individuel
  Future<void> uploadItem(
    CarouselItem item,
    Function(List<TripImage>) onChanged,
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
      (TripImage image) {
        final updatedItems = [...state.items];
        updatedItems[idx] = CarouselItem.remote(image);

        state = state.copyWith(
          uploadProgress: {...state.uploadProgress}..remove(path),
          uploadErrors: {...state.uploadErrors}..remove(path),
          items: updatedItems,
        );

        // On extrait les images distantes valides pour notifier le formulaire parent
        final remoteImages = updatedItems
            .where((i) => !i.isLocal)
            .map((i) => TripImage(fileKey: i.value, url: i.displayUrl))
            .toList();

        onChanged(remoteImages);
      },
    );
  }

  /// Supprime un item
  void deleteItem(int idx, Function(List<TripImage>) onChanged) {
    final val = state.items[idx].value;
    final updatedItems = [...state.items]..removeAt(idx);

    state = state.copyWith(
      items: updatedItems,
      uploadProgress: {...state.uploadProgress}..remove(val),
      uploadErrors: {...state.uploadErrors}..remove(val),
    );

    final remoteImages = updatedItems
        .where((i) => !i.isLocal)
        .map((i) => TripImage(fileKey: i.value, url: i.displayUrl))
        .toList();

    onChanged(remoteImages);
  }
}
