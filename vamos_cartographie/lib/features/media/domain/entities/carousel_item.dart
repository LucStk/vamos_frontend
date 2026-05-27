// import 'package:dartz/dartz.dart';
// import 'package:path/path.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_item.freezed.dart';

enum UploadStatus { idle, uploading, success, failure }

@freezed
abstract class MediaImage with _$MediaImage {
  // <-- 'class' au lieu de 'abstract class'
  const factory MediaImage({required String fileKey, required String url}) =
      _MediaImage;
}

@freezed
abstract class CarouselItem with _$CarouselItem {
  // Constructeur pour un item local (en cours d'upload ou en attente)
  const factory CarouselItem.local({
    required String fileKey,
    @Default(UploadStatus.idle) UploadStatus uploadStatus,
    @Default(0.0) double progress,
    @Default(null) String? error, // 💡 Ajout de @Default(null) pour harmoniser
  }) = _CarouselItemLocal;

  // Constructeur pour un item distant (déjà sur le serveur)
  const factory CarouselItem.remote({
    required MediaImage image,
    @Default(UploadStatus.success) UploadStatus uploadStatus,
    @Default(1.0) double progress,
    @Default(null) String? error, // 💡 Ajout de @Default(null) pour harmoniser
  }) = _CarouselItemRemote;

  const CarouselItem._();

  // Notre super getter pour fileKey créé juste avant
  String get fileKey => map(
    local: (local) => local.fileKey,
    remote: (remote) => remote.image.fileKey,
  );

  bool get isLocal => this is _CarouselItemLocal;
  bool get isRemote => this is _CarouselItemRemote;

  String get displayUrl => map(
    local: (local) => local.fileKey,
    remote: (remote) => remote.image.url,
  );

  MediaImage? get remoteImage =>
      map(local: (_) => null, remote: (remote) => remote.image);
}
