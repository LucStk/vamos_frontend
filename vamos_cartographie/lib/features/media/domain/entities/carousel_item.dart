import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/features/media/domain/entities/media_image.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────

enum ItemKind { local, remote }

/// Un item du carousel.
/// - [local]  : path absolu sur le device, image pas encore uploadée.
/// - [remote] : image distante avec [fileKey] (stocké en DB) et [url] (affichage).
class CarouselItem {
  final ItemKind kind;

  /// local  → path absolu du fichier sur le device
  /// remote → fileKey (relatif, stocké en DB)
  final String value;

  /// URL d'affichage pour les items remote (null pour les items locaux).
  final String? _url;

  const CarouselItem.local(this.value) : kind = ItemKind.local, _url = null;

  const CarouselItem._remote(this.value, this._url) : kind = ItemKind.remote;
  MediaImage? get remoteImage {
    if (_url != null) return MediaImage(fileKey: value, url: _url);
    throw Exception(
      "Try to get a remotImage from a carousel_item without _url",
    );
  }

  /// Crée un item distant depuis un [MediaImage].
  factory CarouselItem.remote(MediaImage image) =>
      CarouselItem._remote(image.fileKey, image.url);

  bool get isLocal => kind == ItemKind.local;
  bool get isRemote => kind == ItemKind.remote;

  /// URL utilisable pour afficher l'image.
  /// - local  → path direct (passé à Image.file)
  /// - remote → URL complète fournie par le backend
  String get displayUrl => isLocal ? value : _url!;
  static List<CarouselItem> fromRemote(List<MediaImage> remoteImages) {
    return remoteImages
        .map(
          (image) => CarouselItem.remote(image),
        ) // Réutilisation de ta factory !
        .toList();
  }

  static List<MediaImage> toRemote(List<CarouselItem> carouselItems) {
    return [
      ...carouselItems.where((i) => i.isRemote).map((i) => i.remoteImage!),
    ];
  }
}
