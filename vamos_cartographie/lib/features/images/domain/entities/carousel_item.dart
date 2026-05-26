import 'package:vamos_cartographie/features/trips/domain/entities/trip_image.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────

enum _ItemKind { local, remote }

/// Un item du carousel.
/// - [local]  : path absolu sur le device, image pas encore uploadée.
/// - [remote] : image distante avec [fileKey] (stocké en DB) et [url] (affichage).
class CarouselItem {
  final _ItemKind kind;

  /// local  → path absolu du fichier sur le device
  /// remote → fileKey (relatif, stocké en DB)
  final String value;

  /// URL d'affichage pour les items remote (null pour les items locaux).
  final String? _url;

  const CarouselItem.local(this.value) : kind = _ItemKind.local, _url = null;

  const CarouselItem._remote(this.value, this._url) : kind = _ItemKind.remote;

  /// Crée un item distant depuis un [TripImage].
  factory CarouselItem.remote(TripImage image) =>
      CarouselItem._remote(image.fileKey, image.url);

  bool get isLocal => kind == _ItemKind.local;

  /// URL utilisable pour afficher l'image.
  /// - local  → path direct (passé à Image.file)
  /// - remote → URL complète fournie par le backend
  String get displayUrl => isLocal ? value : _url!;
}
