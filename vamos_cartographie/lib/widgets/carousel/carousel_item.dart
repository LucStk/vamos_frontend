import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/core/injection.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────

enum _ItemKind { local, remote }

/// Un item du carousel.
/// - [local]  : path absolu sur le device, image pas encore uploadée.
/// - [remote] : fileKey stocké en DB (ex: "uploads/uuid.jpg").
///              L'URL d'affichage est construite à la volée via AppConfig.
class CarouselItem {
  final _ItemKind kind;

  /// local  → path absolu du fichier sur le device
  /// remote → fileKey (relatif, stocké en DB)
  final String value;

  const CarouselItem.local(this.value) : kind = _ItemKind.local;
  const CarouselItem.remote(this.value) : kind = _ItemKind.remote;

  bool get isLocal => kind == _ItemKind.local;

  /// URL utilisable pour afficher l'image.
  /// - local  → path direct (File)
  /// - remote → URL complète construite via AppConfig
  String get displayUrl => isLocal ? value : getIt<AppConfig>().imageUrl(value);
}
